# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include review
class review (
  String $user = 'review',
) {
include review::motd

  $homedir = $user ? {
    'root'  => '/root',
    default => "/home/${user}",
  }

  user { $user:
    ensure     => present,
    shell      => '/bin/bash',
    managehome => true,
  }

  file { "${homedir}/.bashrc":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => '0644',
    source => 'puppet:///modules/review/bashrc',
  }
  file_line { 'ulimit_file_soft':
    path   => '/etc/security/limits.conf',
    line   => '* soft nofile 8192',
    ensure => absent,
  }
  file_line { 'ulimit_file_hard':
    path   => '/etc/security/limits.conf',
    line   => '* hard nofile 8192',
  }

  service { 'puppet':
    ensure => running,
    enable => true,
  }
}
