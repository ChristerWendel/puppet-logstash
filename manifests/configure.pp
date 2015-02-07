# == Class: logstash::configure
#
# Configures logstash
class logstash::configure {
  $elasticsearch_host = $logstash::elasticsearch_host

  file { '/etc/logstash/conf.d/syslog.conf':
    ensure  => 'present',
    owner   => 'logstash',
    group   => 'logstash',
    mode    => '0644',
    content => template('logstash/syslog.conf.erb'),
  }

  user { 'logstash':
    ensure => 'present',
    groups => ['logstash', 'adm'],
  }
}
