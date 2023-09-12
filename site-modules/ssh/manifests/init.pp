# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ssh
class ssh {
  @@sshkey { $::hostname:
    type => rsa,
    key  => $::sshrsakey,
}

Sshkey <<| |>>
             } 
