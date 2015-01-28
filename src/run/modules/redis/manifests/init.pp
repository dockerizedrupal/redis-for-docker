class redis {
  exec { 'mkdir -p /redis/data':
    path => ['/bin']
  }
}
