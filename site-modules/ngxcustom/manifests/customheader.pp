class ngxcustom::customheader {
  pe_nginx::directive { 'include custom headers':
    directive_ensure => 'present',
    target           => '/etc/puppetlabs/nginx/conf.d/proxy.conf',
    directive_name   => 'include',
    value            => 'headers.conf',
    server_context   => $::fqdn,
    }

  file { '/etc/puppetlabs/nginx/headers.conf':
    ensure => file,
    group  => 'root',
    owner  => 'root',
    mode   => '0644',
    source =>'puppet:///modules/nginxcustom/headers.conf',
    }
}
