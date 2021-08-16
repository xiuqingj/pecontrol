node /debian-agent.platform9.puppet.net/ {
#  class {'base::sysctl':} 
  class {'base':} 
 # class { 'review':}  
  class { 'apache':}
} 

