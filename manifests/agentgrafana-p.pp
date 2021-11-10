node /agentgrafana-p.puppetdebug.vlan/ {
  class { 'grafana': }
  class { 'apache': }
#  class { 'base::sl':}
}
