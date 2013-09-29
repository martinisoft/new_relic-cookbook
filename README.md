# new\_relic cookbook

This cookbook installs and configures both the [New Relic](https://www.newrelic.com)
RPM agent and optionally, the plugin agents for monitoring.

# Requirements

* Ubuntu 12.04
* Java (for the MySQL plugin agent)

# Usage

To simply monitor the server, add the `new_relic::default` cookbook to your
run\_list. To setup the MySQL plugin agent, additionally add the
`new_relic::mysql_monitor` recipe to the run\_list.

# Attributes

* None

# Recipes

* default - Sets up and installs the NewRelic Server Monitor Agent
* mysql\_monitor - Installs the MySQL monitor agent for NewRelic

# Author & License

Author:: Aaron Kalin (<aaron@teamtreehouse.com>)

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
