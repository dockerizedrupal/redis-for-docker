class build::redis::supervisor {
  file { '/etc/supervisor/conf.d/redis.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/redis.conf',
    mode => 644
  }
}
