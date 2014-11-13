# Puppet - Xvfb

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with xvfb](#setup)
    * [What xvfb affects](#what-xvfb-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with xvfb](#beginning-with-xvfb)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module is very usefull if you want to install Xvfb to be able to run headless browsers.
You can run your e2e tests with Protractor or other toll without worry if you touch keyboard or mouse affects the tests.
Working on puppet 3.7.3

## Module Description

This module purpose is to facilitate the instalation of Xvfb virtual frame buffer X.


## Setup


### Beginning with xvfb

If you include the xvfb class xvfb will be installed along with a init script:

```ruby
include xvfb
```

Add to your manifest:

```ruby
class {'xvfb':}
```


## Usage

By default, only screen 0 exists and has the dimensions 1280x1024x8.

This will make server listen for connections as server number 99 and 

create screen 1 and sets its width, height, and depth.

**Note:** *Will have the default screen 0 default configuration (one screen, 1280x1024x8)*

```ruby
class {'xvfb':
  server_id => 99,   # default is 99
  screen_number => 1,   # default is 0
  width   => 1024, # default is 1280
  height  => 768,  # default is 800
  depth   => 8,   # default is "8" 
}
```

Check if Xvfb is running

```shell
$ sudo /etc/inid.d/xvfb status
```

Start Xvfb

```shell
$ sudo /etc/inid.d/xvfb start
```

Stop Xvfb

```shell
$ sudo /etc/inid.d/xvfb stop
```


## Reference

Will create an init.d script in `/etc/init.d/xvfb`
This will install the Xvfb virtual frame buffer X server on your system.
Read more: http://www.x.org/archive/current/doc/man/man1/Xvfb.1.xhtml

## Limitations

0.1.0 - Only tested on RedHat

## Development

Just try to follow the standards and improve. :)

## Contributors
You? 

