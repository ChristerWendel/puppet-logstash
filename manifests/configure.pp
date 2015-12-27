# == Class: logstash::configure
#
# Configures logstash
class logstash::configure {
  $elasticsearch_hosts = $logstash::elasticsearch_hosts

  file { '/etc/logstash/conf.d/syslog.conf':
    ensure  => 'present',
    owner   => 'logstash',
    group   => 'logstash',
    mode    => '0644',
    content => template('logstash/syslog.conf.erb'),
  }

  file { '/etc/logstash/conf.d/elasticsearch.conf':
    ensure  => 'present',
    owner   => 'logstash',
    group   => 'logstash',
    mode    => '0644',
    content => template('logstash/elasticsearch.conf.erb'),
  }

  user { 'logstash':
    ensure => 'present',
    groups => ['logstash', 'adm'],
  }

  File <| tag == logstash |>
}
