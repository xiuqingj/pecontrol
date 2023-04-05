class base::linux_users {
ssh_authorized_key { 'andy@pepup.puppetdebug.vlan':
  ensure  => absent,
  user    => 'andy',
  type    => 'ssh-rsa',
  key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCjY0IFIvjbxXDK4RFdeepgEwz4p8NmDHMIGEVtfwOBlE9w+hZNybuyMysx7P2JyW6E4ZDMtOCTu5JgaJ0pCKaChisDXZmvKNomOdwAw2vH4m1c0QssA8zagFJzUYr9sSvyuNGY6vGFs34lOqb6ZULt7h1B8aHF9TKJSiLp+tul6tG6aH/HS1ZZWgO6q5BTFLIWSnKVbKf9AXl7qQLV/ZRInAhfsFb1Z7rd2E9TTQB0XPCApLrNpUS5r4zb4LWeaCuGo/HBKR/gt6aHi51Y7C0vmksCFBn200r9+XpXlkgeWV34rrFpQuIrL3wFoEWrpfiEmo5DZu4edqgqG8B9e48b',
}

ssh_authorized_key { 'sjiang@pepup.puppetdebug.vlan':
  ensure  => absent,
  user    => 'sjiang',
  type    => 'ssh-rsa',
  key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCri/hTiThBQeARsHOm4lLI7IqSPzRhKA64PLO5Yc8OGK8vOiBM8xeZTp5ox75JQawh+tsS+a1FJ1QOSM2TcTAT08lVGk4Bx9Bq21icFL5/JPLH970h1LDGAxOcJEWt4ed4mWOGxCrVnrgKsQWHNNNH/O9qQ+EhBFKzi7RHPAjW3RiBUJBEZTOHQi7WHiRdye82YhidhNMMKawia1TrBxDJnPHTzV2XAj+lNm8rSu0m2ONCihtmPUK/B4Ns97wvpjYtX8Jn4xr5px2MTpxpKy2layqxuks7lmLVIL4vdV4BBHZZ34ondv4hYypGpUi25KkNdGVWRH+H18AcI2P9Cnb7',
}
file { '/opt/puppetlabs/puppet/ssl/cert.pem':
  owner => root,
  group => root,
  mode => 644,
  source => 'puppet:///site-modules/base/cert.pem',
  ensure => present,
}
}
