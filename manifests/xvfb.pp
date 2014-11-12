# Class: xvfb
#
# Installs and configures xvfb.
#
class xvfb inherits xvfb::params {
  
  # Create log files and folders.
  file { "${xvfb::params::log_dir}":
      owner => 'root',
      group => 'root',
      mode => "0775",
      ensure => directory
  }
  ->
  file { [
    "${xvfb::params::error_log_file}",
    "${xvfb::params::default_log_file}"
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