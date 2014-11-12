# Class: xvfb
#
# Installs and configures Xvfb.
#
# === Parameters
#
# [*display*]
#    X display to use. Default is 0.
# [*width*]
#    Screen width to use. Default is 1280.
# [*height*]
#    Screen height to use. Default is 800.
# [*color*]
#    Screen color depth to use. Default is "24+32" (32 bit).
#
# === Examples
#
#  class {'display':
#    display => 99,
#    width   => 1024,
#    height  => 768,
#    color   => 24,
#  }
#
class xvfb(
  $display = 0,
  $width   = 1280,
  $height  = 768,
  $color   = '24+32'
) inherits xvfb::params {
  include env
  include xvfb
  Class['xvfb'] -> Class['env']
}