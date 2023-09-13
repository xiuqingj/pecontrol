# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include hosts
class hosts {
@@host { $::hostname:
ip => $::ipaddress,
host_aliases => $::fqdn,
}

Host <<||>>

resources {'host':
purge => true,
}
