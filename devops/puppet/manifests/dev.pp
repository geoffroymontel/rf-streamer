node 'dev' inherits basenode {
  class { 'liquidsoap':
  }

  class { 'icecast':
  }
}
