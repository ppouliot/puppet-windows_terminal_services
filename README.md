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
6. [Contributors - Contributors to the module](#contributors)

## Overview
This puppet module is used for enabling and disabling Terminal Services on Windows Platforms for Remote Access.

## Module Description
This module works by modifying the necessary Windows Registry keys for Terminal Services.


### What windows_terminal_services affects

* Registry Key 'HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server'
* Registry Key Value: 'HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\fDenyTSConnection'

### Setup Requirements 
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

## Contributors
* Peter Pouliot <peter@pouliot.net>

## Copyright and License

Copyright (C) 2016 Peter J. Pouliot

Peter Pouliot can be contacted at: peter@pouliot.net

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

