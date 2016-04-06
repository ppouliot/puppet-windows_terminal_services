# == Class: windows_terminal_services
#
# This puppet module configures Terminal Services on Windows platforms for
# for remote access.
#
# === Parameters
#
# [*remote_access*]
#   Used to enable or disable remote access.  Valid values are 'enable' or 'disable'.
#
#
# === Examples
#
#  class { 'windows_terminal_services':
#    remote_access => 'enable',
#  }
#
# === Authors
#
# Peter J. Pouliot <peter@pouliot.net>
#
# === Copyright
#
# Copyright 2015 Peter J. Pouliot <peter@pouliot.net>, unless otherwise noted.

class windows_terminal_services ( $remote_access ){

  validate_re($remote_access, '^(enable|disable)$', 'valid values for ensure are \'enable\' or \'disable\'')

  $ts_deny_connections =  $remote_access ? {
    (/enable/)  => '0',
    (/disable/) => '1',
    default     => undef,
  }

  if $kernel == 'windows' {
    registry_key {'HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server':
      ensure => present,
    }
    registry_value {'HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\fDenyTSConnection':
      type => string,
      data => $ts_deny_connections,
    }
  } else {
    fail("${module_name} is for Windows Platforms only")
  }
}
