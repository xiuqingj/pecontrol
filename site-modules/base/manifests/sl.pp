class base::sl {
file_line { 'ulimit_file_soft':
    path   => '/etc/security/limits.conf',
    line   => '* soft nofile 4096',
    ensure => present,
  }
  file_line { 'ulimit_file_hard':
    path   => '/etc/security/limits.conf',
    line   => '* hard nofile 8192',
    ensure => present,
  }
}
