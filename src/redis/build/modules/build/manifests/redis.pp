class build::redis {
  require build::redis::packages
  require build::redis::supervisor

  file { '/etc/redis.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/redis.conf',
    mode => 644
  }

  file { '/tmp/redis-3.0.3.tar.gz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/redis-3.0.3.tar.gz'
  }

  bash_exec { 'cd /tmp && tar xzf redis-3.0.3.tar.gz':
    require => File['/tmp/redis-3.0.3.tar.gz']
  }

  bash_exec { 'cd /tmp/redis-3.0.3 && make':
    timeout => 0,
    require => Bash_exec['cd /tmp && tar xzf redis-3.0.3.tar.gz']
  }

  bash_exec { 'cd /tmp/redis-3.0.3 && make install':
    timeout => 0,
    require => Bash_exec['cd /tmp/redis-3.0.3 && make']
  }
}
