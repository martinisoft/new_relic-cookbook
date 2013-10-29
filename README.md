# new\_relic cookbook

This cookbook installs and configures both the [New Relic](https://www.newrelic.com)
server monitor agent and optionally, the plugin agents.

# Requirements

* Ubuntu 12.04

# Suggestions

* Java (for the MySQL plugin agent)

# Usage

To simply monitor the server, add the `new_relic::default` cookbook to your
run\_list.

To setup the MySQL plugin agent, additionally add the
`new_relic::mysql_monitor` recipe to the run\_list and you can optionally
setup an encrypted data bag with the following structure:

```json
{
  "id": "new_relic",
  "license_key": "ff7ac3bd91dc..."
}
```

The values expected in the data bag:

* license\_key - Your NewRelic api key found in your "Account settings" area.

#### Setting up the encrypted data bag for testing

* Setup the data bags folder:

```
mkdir -p test/integration/default/data_bags/martinisoftware
```

#### Setting up the data bag secret

```
openssl rand -base64 512 > test/integration/data_bags/encrypted_data_bag_secret
```

* Create the encrypted data bag file with the secret

```
knife solo data bag edit martinisoftware new_relic --secret-file test/integration/data_bags/encrypted_data_bag_secret --data-bag-path test/integration/data_bags/martinisoftware
```

# Attributes

* `default["new_relic"]["enabled"]` - Is the server agent enabled?
* `default["new_relic"]["data_bag_name"]` - The data bag that contains the "new\_relic\_env" item, default is "new_relic"
* `default["new_relic"]["license_key"]` - Your NewRelic license key
* `default["new_relic"]["loglevel"]` - Log level, default is "info"
* `default["new_relic"]["logfile"]` - Log location, default is "/var/log/newrelic/nrsysmond.log"

# Recipes

* default - Sets up and installs the NewRelic Server Monitor Agent
* mysql\_monitor - Installs the MySQL monitor agent for NewRelic

# Author & License

Author:: Aaron Kalin (<akalin@martinisoftware.com>)

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
