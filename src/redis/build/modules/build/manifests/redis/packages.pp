class build::redis::packages {
  package {[
      'build-essential'
    ]:
    ensure => present
  }
}
