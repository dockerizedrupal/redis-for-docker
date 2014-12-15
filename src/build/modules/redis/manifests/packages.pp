class redis::packages {
  package {[
      'build-essential'
    ]:
    ensure => present
  }
}
