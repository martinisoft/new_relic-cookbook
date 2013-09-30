#
# Cookbook Name:: new_relic
# Recipe:: default
#
# Copyright (C) 2013 Aaron Kalin
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "apt"

license_key = node["new_relic"]["license_key"]
if license_key.nil?
  license_key = begin
                  key_data = Chef::EncryptedDataBagItem.load("treehouse", "new_relic").to_hash
                  key_data.delete('id')
                  key_data["license_key"]
                rescue => ex
                  Chef::Application.fatal!("Cannot decrypt data bag! #{ex}")
                end
end

# Add the NewRelic apt repository
apt_repository "newrelic" do
  uri "http://apt.newrelic.com/debian/"
  distribution "newrelic"
  components [ "non-free" ]
  keyserver "subkeys.pgp.net"
  key "548C16BF"
  action :add
end

# Install NewRelic server monitor agent
package "newrelic-sysmond" do
  action :upgrade
end

# Configure the monitor
directory "/var/run/newrelic" do
  owner "newrelic"
  group "newrelic"
end

template "/etc/newrelic/nrsysmond.cfg" do
  source "nrsysmond.cfg.erb"
  owner "root"
  group "newrelic"
  mode "640"
  variables(
    :license_key => license_key,
    :loglevel => node["new_relic"]["loglevel"],
    :logfile => node["new_relic"]["logfile"]
  )
  notifies :restart, "service[newrelic-sysmond]" if node["new_relic"]["enabled"]
end

service "newrelic-sysmond" do
  supports status: true, restart: true, reload: true
  if node["new_relic"]["enabled"]
    action [ :enable, :start ]
  else
    action [ :disable, :stop ]
  end
end
