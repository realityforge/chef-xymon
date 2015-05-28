name             "xymon"
maintainer       "Peter Donald"
maintainer_email "peter@realityforge.org"
license          "Apache 2.0"
description      "Installs/Configures Xymon monitoring infrastructure"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.1"

attribute "xymon/servers",
  :display_name => "Xymon Server ip addresses",
  :description => "List of Xymon servers to send monitoring information to",
  :type => "array",
  :default => ""
