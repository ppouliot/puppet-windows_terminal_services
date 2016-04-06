# windows_terminal_services

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with windows_terminal_services](#setup)
    * [What windows_terminal_services affects](#what-windows_terminal_services-affects)
    * [Setup requirements](#setup-requirements)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview
This puppet module is used for enabling and disabling Terminal Services on Windows Platforms for Remote Access.

## Module Description
This module works by modifying the necessary Windows Registry keys for Terminal Services.


### What windows_terminal_services affects

* Registry Key 'HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server'
* Registry Key Value: 'HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\fDenyTSConnection'

### Setup Requirements **OPTIONAL**
This module requires the puppetlabs-registry module.

## Usage
To enable remote access via Windows Terminal Services on a Windows host.
  ```
  class{'windows_terminal_services':
    remote_access => enable,
  }
  ```

To disable remote access via Windows Terminal Services on a Windows host.
  ```
  class{'windows_terminal_services':
    remote_access => disable,
  }
  ```
## Reference
* init.pp

## Limitations
* Windows 8.1
* Windows Server 2012r2 Plaforms
* Windows 10
* Windows Server 2016 Plaforms

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
