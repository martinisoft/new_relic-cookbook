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
  action :install
end

