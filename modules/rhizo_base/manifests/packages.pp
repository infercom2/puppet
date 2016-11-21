# Class: rhizo_base::packages
#
# This module manages the packages not included in other modules
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class rhizo_base::packages {

  package { ['mosh', 'git', 'openvpn', 'lm-sensors', 'runit', 'sqlite3',
            'libffi-dev', 'sudo', 'apt-transport-https']:
      ensure  => installed,
      require => Class['rhizo_base::apt'],
    }
/*
  package { ['puppet', 'puppet-common']:
      ensure  => '3.8.1-1puppetlabs1',
    }
*/
  }
