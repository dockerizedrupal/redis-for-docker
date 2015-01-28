class redis {
  require redis::packages
  require redis::supervisor

  file { '/root/redis.conf':
    ensure => present,
    source => 'puppet:///modules/redis/root/redis.conf',
    mode => 644
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
    timeout => 0,
    require => Exec['tar xzf redis-2.8.17.tar.gz']
  }

  exec { '/bin/bash -c "cd /tmp/redis-2.8.17 && make install"':
    timeout => 0,
    require => Exec['/bin/bash -c "cd /tmp/redis-2.8.17 && make"']
  }
}
