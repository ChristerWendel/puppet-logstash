# == Class: logstash::install
#
# Installs logstash
class logstash::install {
  include aptrepo

  if $::architecture == 'amd64' or $::architecture == 'i386' {
    aptrepo::addrepo { 'logstash':
      location => 'http://packages.elasticsearch.org/logstash/2.1/debian/',
      key      => 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch',
      } -> Package['logstash']
  }

  package { 'logstash':
    ensure => $logstash::version,
  }
}
