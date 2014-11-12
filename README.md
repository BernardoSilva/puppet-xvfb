puppet-xvfb
===========

A puppet module to setup Xvfb

###Usage

If you include the xvfb class xvfb will be installed along with a init script:

```ruby
include xvfb
```

Add to your manifest:

```ruby
class {'xvfb':}
```


### Configuration

# By default, only screen 0 exists and has the dimensions 1280x1024x8.

This will make server listen for connections as server number 99 and 

create screen 1 and sets its width, height, and depth.

**Note:** *Will have the default screen 0 default configuration (one screen, 1280x1024x8)*

```ruby
class {'xvfb':
  server_id => 99,   # default is 99
  screen_number => 1,   # default is 0
  width   => 1024, # default is 1280
  height  => 768,  # default is 800
  depth   => 24,   # default is "24" 
}
```