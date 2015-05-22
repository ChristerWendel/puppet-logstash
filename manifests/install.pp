# == Class: logstash::install
#
# Installs logstash
class logstash::install {
  include aptrepo

  aptrepo::addrepo { 'logstash':
    location => 'http://packages.elasticsearch.org/logstash/1.5/debian/',
    key      => 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch',
  } -> Package['logstash']

  package { 'logstash':
    ensure => $logstash::version,
  }
}
