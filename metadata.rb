name             "new_relic"
maintainer       "Aaron Kalin"
maintainer_email "aaron@teamtreehouse.com"
license          "Apache 2.0"
description      "Installs and configures the New Relic agents for Treehouse"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          "0.1.0"

supports "ubuntu"

depends "apt"

suggests "java"
