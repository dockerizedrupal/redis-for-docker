class packages {
  package {[
      'build-essential'
    ]:
    ensure => present
  }
}

class redis_supervisor {
  file { '/etc/supervisor/conf.d/redis.conf':
    ensure => present,
    source => '/tmp/build/etc/supervisor/conf.d/redis.conf'
  }
}

class redis {
  include redis_supervisor
}

node default {
  file { '/run.sh':
    ensure => present,
    source => '/tmp/build/run.sh',
    mode => 755
  }

  include packages
  include redis

  Class['packages'] -> Class['redis']

  exec { 'apt-get update':
    path => ['/usr/bin'],
    before => Class['packages']
  }
}