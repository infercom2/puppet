# Class: kannel
#
# This module manages kannel
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class kannel (
  $kannel_bind_address = hiera('rhizo::vpn_ip_address'),
  $kannel_admin_password = hiera('rhizo::kannel_admin_password'),
  $smsc_password = hiera('rhizo::smsc_password'),
  $kannel_sendsms_password = hiera('rhizo::kannel_sendsms_password')
) {

  package { 'kannel':
      ensure  => purged,
  }

  file { '/etc/kannel/kannel.conf':
      ensure  => absent,
      content => template('kannel/kannel.conf.erb'),
      require => Package['kannel'],
  }

  file { '/etc/default/kannel':
      ensure  => absent,
      source  => ['puppet:///modules/kannel/kannel-default'],
  }

}
