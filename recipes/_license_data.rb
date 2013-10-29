#
# Cookbook Name:: new_relic
# Recipe:: _license_data
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

license_key = node["new_relic"]["license_key"]
if license_key.nil?
  license_key = begin
                  key_data = Chef::EncryptedDataBagItem.load(node["new_relic"]["data_bag_name"], "new_relic_env").to_hash
                  key_data.delete('id')
                  key_data["license_key"]
                rescue => ex
                  Chef::Application.fatal!("Cannot decrypt data bag! #{ex}")
                end
end
