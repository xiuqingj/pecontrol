class base::check {
exec { 'check_folder':
  command => 'test -d /var/lib/pgsql/11/data',
  path    => '/bin:/usr/bin',
  unless  => 'test -f /var/lib/pgsql/11/data/postgresql.conf'
}

package { 'postgresql11':
  ensure => present,
  require => Exec['check_folder'],
}
}
