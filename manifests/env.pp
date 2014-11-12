# == Class: xvfb::env
#
# Exports DISPLAY variable.
#
#
class xvfb::env {
  $file = '/etc/profile.d/vagrant_display.sh'

  concat { $file:
    owner => root,
    group => root,
    mode  => '0644',
  }

  concat::fragment { 'DISPLAY':
    target  => $file,
    content => "export DISPLAY=:${xvfb::display}",
  }
}