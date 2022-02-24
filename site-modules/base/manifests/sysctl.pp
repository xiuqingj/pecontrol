class base::sysctl {
  file_line { "sysctl-net.ipv4.tcp_challenge_ack_limit":
    path    => "/etc/sysctl.conf",
    line    => "net.ipv4.tcp_challenge_ack_limit = 2147483647",
    match   => "^net.ipv4.tcp_challenge_ack_limit.*$",
    ensure  => present,
    notify  => Exec['/sbin/sysctl -p'],
    #noop    => false,
  }

  exec { '/sbin/sysctl -p':
    refreshonly => true,
  }
}
