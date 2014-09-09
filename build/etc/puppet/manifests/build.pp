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

  exec { 'wget http://download.redis.io/releases/redis-2.8.14.tar.gz':
    cwd => '/tmp',
    path => ['/usr/bin']
  }

  exec { 'tar xzf redis-2.8.14.tar.gz':
    cwd => '/tmp',
    path => ['/bin'],
    require => Exec['wget http://download.redis.io/releases/redis-2.8.14.tar.gz']
  }

  exec { '/bin/bash -c "cd /tmp/redis-2.8.14 && make"':
    require => Exec['tar xzf redis-2.8.14.tar.gz']
  }

  exec { '/bin/bash -c "cd /tmp/redis-2.8.14 && make install"':
    require => Exec['/bin/bash -c "cd /tmp/redis-2.8.14 && make"']
  }
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