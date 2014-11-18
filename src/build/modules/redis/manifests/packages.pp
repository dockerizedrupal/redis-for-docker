class redis::packages {
  exec { 'apt-get update':
    path => ['/usr/bin']
  }

  package {[
      'build-essential'
    ]:
    ensure => present,
    require => Exec['apt-get update']
  }
}
