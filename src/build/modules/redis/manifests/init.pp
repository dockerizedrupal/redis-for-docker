class redis {
  require redis::packages
  require redis::supervisor

  exec { 'mkdir -p /redis/conf.d':
    path => ['/bin']
  }

  file { '/redis/conf.d/redis.conf':
    ensure => present,
    source => 'puppet:///modules/redis/redis/conf.d/redis.conf',
    mode => 644,
    require => Exec['mkdir -p /redis/conf.d']
  }

  exec { 'mkdir -p /redis/data':
    path => ['/bin']
  }

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