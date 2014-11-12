# Class: xvfb
#
# Installs and configures Xvfb.
#
# === Parameters
#
# [*screen_number*]
#    X screen to use. Default is 0.
# [*width*]
#    Screen width to use. Default is 1280.
# [*height*]
#    Screen height to use. Default is 800.
# [*depth*]
#    Screen color depth to use. Default is "32".
#
# === Examples
#
#  class {'xvfb':
#    screen_number => 0,
#    width   => 1024,
#    height  => 768,
#    depth   => 24,
#    server_id => 99,
#  }
#
class xvfb(
  $screen_number = 0,
  $width   = 1280,
  $height  = 768,
  $depth   = 32,
  $server_id = 99,
) inherits xvfb::params {
  include env
  include xvfb
  Class['xvfb'] -> Class['env']
}