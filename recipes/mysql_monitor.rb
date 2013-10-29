#
# Cookbook Name:: new_relic
# Recipe:: mysql_monitor
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
include_recipe "java::openjdk"

# Setup new_relic user
user "new_relic" do
  comment "New Relic Plugin Agent"
  shell "/bin/bash"
  home "/srv/new_relic"
  manage_home true
end

