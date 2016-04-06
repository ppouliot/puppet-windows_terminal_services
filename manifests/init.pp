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
class windows_terminal_services($remote_access){
  validate_re($remote_access, '^(enable|disable)$', 'valid values for ensure are \'enable\' or \'disable\'')
  if $remote_access == 'enable' {
    notice('Terminal Server Remote Access Enabled')
    $ts_deny_connections = '0'
  }
  if $remote_access == 'disable' {
    notice('Terminal Server Remote Access Disabled')
    $ts_deny_connections = '1' 
  }
  if $kernel == 'windows' {
    notice('Ensuring Registry key HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server')
    registry_key {'HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server':
      ensure => present,
    } warning("${module_name} Ensuring Registry key HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server is present")
    registry_value {'HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\fDenyTSConnection':
      type => string,
      data => $ts_deny_connections,
    } warning("${module_name} Ensuring Registry key value HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\fDenyTSConnection is set to ${ts_deny_connections}")
  } else {
    fail("${module_name} is for Windows Platforms only")
  }
}
