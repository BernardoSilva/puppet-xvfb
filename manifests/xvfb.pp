# Class: xvfb
#
# Installs and configures xvfb.
#
class xvfb inherits xvfb::params {
  
  # notify{"Package name--->: ${xvfb_package_name}": }
  
  package { "${xvfb::params::xvfb_package_name}":
    alias  => 'xvfb',
    ensure => present,
  }

  file { '/etc/init.d/xvfb':
    content => template($xvfb::params::xvfb_erb),
    mode    => '0755',
    require => Package['xvfb'],
    notify  => Service['xvfb'],
  }

  service { 'xvfb':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}