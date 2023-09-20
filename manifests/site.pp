## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
#https://docs.puppet.com/pe/2015.3/release_notes.html#filebucket-resource-no-longer-created-by-default
File { backup => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node 'agent-p.puppetdebug.vlan' {
  # This is where you can declare classes for all nodes.
  # Example:
  # class { 'my_class': }
   $msg = lookup('messageeyaml')
   notify { $msg: }
   class { 'base::linux_users': }
}

node 'agentgrafana-p.puppetdebug.vlan' {
#  include puppet_operational_dashboards
  #class { 'base::linux_users': }
  $greet = lookup('greeting')
  notify ( $greet: }
  class { 'base::check': }
}

node default {
  }

#node 'mom.platform9.puppet.net' {
#  include puppet_metrics_dashboard::profile::master::install
#  include puppet_metrics_dashboard::profile::master::postgres_access  
#}

#node /compiler*rhel.platform9.puppet.net/ {
#  include puppet_metrics_dashboard::profile::master::install
#}

#node 'rhel7agent.platform9.puppet.net' {
#  class { 'puppet_metrics_dashboard':
#    add_dashboard_examples => true,
#    overwrite_dashboards   => false,
#  }
#}
#node 'rhel8agent.platform9.puppet.net' {
#   class {'review': }
#}

#node 'debian-agent.platform9.puppet.net' {
#  class {'apache': }
#}

#node 'pemom-p.puppetdebug.vlan' {

#puppet_metrics_dashboard::profile::puppetdb{ $facts['networking']['fqdn']:
 # timeout          => '5s',
 # puppetdb_metrics => puppet_metrics_dashboard::puppetdb_metrics(), # this is the default value
 # enable_client_cert => false
#}
#}
