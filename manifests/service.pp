# == Class: logstash::service
#
# Controls the logstash service
class logstash::service {
  $ensure = $logstash::start ? {true => running, default => stopped}

  service { 'logstash':
    ensure => $ensure,
    enable => $logstash::enable,
  }
}
