# == Class: logstash
#
# A module for Logstash [http://logstash.net]
#
# === Parameters
# ["version"]
#   The package version to install
#
# ["elasticsearch_hosts"]
#   The host names of the server running Elasticsearch
#
# ["enable"]
#   Should the service be enabled during boot time?
#
# ["start"]
#   Should the service be started by Puppet?

class logstash (
  $version = 'present',
  $elasticsearch_hosts = ['localhost'],
  $enable = true,
  $start = true
  )  {
    class{'logstash::install': } ->
    class{'logstash::configure': } ~>
    class{'logstash::service': } ->
    Class['logstash']
  }
