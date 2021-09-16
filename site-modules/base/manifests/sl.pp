class base::sl {
file_line { 'ulimit_file_soft':
    path   => '/etc/security/limits.conf',
    line   => '* soft nofile 4096',
    ensure => present,
  }
  file_line { 'ulimit_file_hard':
    path   => '/etc/security/limits.conf',
    line   => '* hard nofile 8192',
    ensure => absent,
  }

 exec { 'wget-percona-repo':
    command  => '/bin/wget --directory-prefix /usr/src/ "http://www.percona.com/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm"',
    onlyif   => '/bin/test ! -f /usr/src/percona-release-0.1-3.noarch.rpm',
  }

  package { 'percona-release-0.1-3.noarch':
    provider => 'rpm',
    source   => '/usr/src/percona-release-0.1-3.noarch.rpm',
    ensure   => installed,
    require  => Exec['wget-percona-repo'],
  }

  package { [ 'Percona-Server-client-56', 'Percona-Server-shared-56' ]:
    ensure      => installed,
    description => 'install-percona-packages',
    require     => Package ['percona-release-0.1-3.noarch'],
  }
}
