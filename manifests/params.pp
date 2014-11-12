# Class: xvfb::params
#
# Display parameters.
#
#
class xvfb::params {
  $osfamily_name       = downcase($::osfamily)
  $xvfb_erb            = "xvfb/${osfamily_name }/xvfb.erb"

  notify{"Operating system name is--->: ${osfamily_name}": }
  notify{"Operating system name is--->: ${$::osfamily}": }
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

  notify{"Package name--->: ${xvfb_package_name}": }
}