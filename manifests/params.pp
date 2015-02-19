class moinmoin::params {
  case $::osfamily {
    'Debian': {
      $package  = 'python-moinmoin'
      $moin_dir = '/etc/moin'
    }

    default: {
      fail("${::osfamily} is not supported.")
    }
  }
}