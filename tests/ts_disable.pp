# Disable Remote Access using puppet-windows_terminal_services
class{'windows_terminal_services':
  remote_access => disable,
}
