node rhel8agent.platform9.puppet.net {
  
  file_line { 'ulimit_file_soft':
    path   => '/etc/security/limits.conf',
    line   => '* soft nofile 8192',
    ensure => absent,
  }
  file_line { 'ulimit_file_hard':
    path   => '/etc/security/limits.conf',
    line   => '* hard nofile 8192',
  }
}
