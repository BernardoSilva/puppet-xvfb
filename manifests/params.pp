# Class: xvfb::params
#
# Display parameters.
#
#
class xvfb::params {
  $osfamily_name    = downcase($::osfamily)
  $xvfb_erb         = "xvfb/${osfamily_name }/xvfb.erb"
  $log_dir          = '/var/log/xvfb'
  $error_log_file   = "${log_dir}/xvfb_error.log"
  $default_log_file = "${log_dir}/xvfb_std.log"
  $process_id_file  = "${log_dir}/xvfb.pid"

  case $::osfamily {
    'RedHat': {
      $xvfb_package_name = 'xorg-x11-server-Xvfb'
    }
    'Debian': {
      $xvfb_package_name = 'xvfb'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }

}