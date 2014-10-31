class redis::supervisor {
  file { '/etc/supervisor/conf.d/redis.conf':
    ensure => present,
    source => 'puppet:///modules/redis/etc/supervisor/conf.d/redis.conf'
  }
}
