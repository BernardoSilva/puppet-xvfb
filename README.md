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

You can configure display, resolution and color depth:

```ruby
class {'xvfb':
  display => 99,   # default is 0
  width   => 1024, # default is 1280
  height  => 768,  # default is 800
  color   => 24,   # default is "24+32" (i.e. 32-bit)
}
```