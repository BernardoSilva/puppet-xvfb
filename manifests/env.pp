# Class: xvfb::env
#
# Exports DISPLAY variable.
#
#
class xvfb::env {
  $exe_file = '/etc/profile.d/vagrant_display.sh'

  
  concat { "${exe_file}":
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
  
  concat::fragment { 'DISPLAY':
    target  => $exe_file,
    content => "export DISPLAY=:${xvfb::display}",
  }
}