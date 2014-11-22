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

  file { '/tmp/redis-2.8.17.tar.gz':
    ensure => present,
    source => 'puppet:///modules/redis/tmp/redis-2.8.17.tar.gz'
  }

  exec { 'tar xzf redis-2.8.17.tar.gz':
    cwd => '/tmp',
    path => ['/bin'],
    require => File['/tmp/redis-2.8.17.tar.gz']
  }

  exec { '/bin/bash -c "cd /tmp/redis-2.8.17 && make"':
    require => Exec['tar xzf redis-2.8.17.tar.gz']
  }

  exec { '/bin/bash -c "cd /tmp/redis-2.8.17 && make install"':
    require => Exec['/bin/bash -c "cd /tmp/redis-2.8.17 && make"']
  }
}
