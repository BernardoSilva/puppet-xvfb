# Class: xvfb
#
# Installs and configures xvfb.
#
class xvfb inherits xvfb::params {
  
  # Create log files and folders.
  file { "/var/log/xvfb":
      owner => 'root',
      group => 'root',
      mode => "0775",
      ensure => directory
  }
  ->
  file { [
    '/var/log/xvfb/xvfb_error.log',
    '/var/log/xvfb/xvfb.pid',
    '/var/log/xvfb/xvfb_std.log'
    ]:
    ensure  => 'present',
    mode    => '0775',
  }
  ->
  package { "${xvfb::params::xvfb_package_name}":
    alias  => 'xvfb',
    ensure => present,
  }
  ->
  file { '/etc/init.d/xvfb':
    content => template($xvfb::params::xvfb_erb),
    mode    => '0775',
    require => Package['xvfb'],
    notify  => Service['xvfb'],
  }
  ~>
  service { 'xvfb':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}