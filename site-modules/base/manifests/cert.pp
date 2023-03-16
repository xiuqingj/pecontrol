file { '/opt/puppetlabs/puppet/ssl/cert.pem':
  owner => root,
  group => root,
  mode => 644,
  source => 'puppet:///site-modules/base/cert.pem',
  ensure => present,
}

