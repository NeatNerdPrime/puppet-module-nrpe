# == Class: nrpe
#
# Full description of class nrpe here.
#
# === Parameters
#
# Document parameters here.
#
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# === Examples
#
#
# === Copyright
#
# Copyright 2013 Computer Action Team, unless otherwise noted.
#
class nrpe(
  $allowed_hosts = ['127.0.0.1'],
  $purge         = undef,
  $recurse       = undef,
) inherits nrpe::params {

  package { 'nrpe_packages':
    ensure   => installed,
    name     => $nrpe::params::nrpe_packages,
    provider => $nrpe::params::nrpe_provider,
  }

  service { 'nrpe_service':
    ensure    => running,
    name      => $nrpe::params::nrpe_service,
    enable    => true,
    require   => Package['nrpe_packages'],
    subscribe => File['nrpe_config'],
  }

  file { 'nrpe_config':
    name    => $nrpe::params::nrpe_config,
    content => template('nrpe/nrpe.cfg.erb'),
    require => File['nrpe_include_dir'],
  }

  file { 'nrpe_include_dir':
    ensure  => directory,
    name    => $nrpe::params::nrpe_include_dir,
    purge   => $purge,
    recurse => $recurse,
    require => Package['nrpe_packages'],
  }


  file { "/usr/lib/nagios/plugins/check_glance1":
     notify  => Service["nrpe_service"],
     ensure  => present,
     owner   => "root",
     group   => "root",
     mode    => 0755,
     source  => "puppet:///modules/nrpe/check_glance1",
     require => Package["nrpe_packages"],
  }

    file { "/usr/lib/nagios/plugins/check_keystone":
        notify  => Service["nrpe_service"],
        ensure  => present,
        owner   => "root",
        group   => "root",
        mode    => 0755,
        source  => "puppet:///modules/nrpe/check_keystone",
        require => Package["nrpe_packages"],
    }

    file { "/usr/lib/nagios/plugins/check_novaapi":
        notify  => Service["nrpe_service"],
        ensure  => present,
        owner   => "root",
        group   => "root",
        mode    => 0755,
        source  => "puppet:///modules/nrpe/check_novaapi",
        require => Package["nrpe_packages"],
    }

    file { "/usr/lib/nagios/plugins/check_rabbitmq_aliveness":
        notify  => Service["nrpe_service"],
        ensure  => present,
        owner   => "root",
        group   => "root",
        mode    => 0755,
        source  => "puppet:///modules/nrpe/check_rabbitmq_aliveness",
        require => Package["nrpe_packages"],
    }

    file { "/usr/lib/nagios/plugins/check_rabbitmq_objects":
        notify  => Service["nrpe_service"],
        ensure  => present,
        owner   => "root",
        group   => "root",
        mode    => 0755,
        source  => "puppet:///modules/nrpe/check_rabbitmq_objects",
        require => Package["nrpe_packages"],
    }

    file { "/usr/lib/nagios/plugins/check_rabbitmq_overview":
        notify  => Service["nrpe_service"],
        ensure  => present,
        owner   => "root",
        group   => "root",
        mode    => 0755,
        source  => "puppet:///modules/nrpe/check_rabbitmq_overview",
        require => Package["nrpe_packages"],
    }

    file { "/usr/lib/nagios/plugins/check_rabbitmq_server":
        notify  => Service["nrpe_service"],
        ensure  => present,
        owner   => "root",
        group   => "root",
        mode    => 0755,
        source  => "puppet:///modules/nrpe/check_rabbitmq_server",
        require => Package["nrpe_packages"],
    }

    file { "/usr/lib/nagios/plugins/check_rabbitmq_queue":
        notify  => Service["nrpe_service"],
        ensure  => present,
        owner   => "root",
        group   => "root",
        mode    => 0755,
        source  => "puppet:///modules/nrpe/check_rabbitmq_queue",
        require => Package["nrpe_packages"],
    }

    file { "/usr/lib/nagios/plugins/check_rabbitmq_watermark":
        notify  => Service["nrpe_service"],
        ensure  => present,
        owner   => "root",
        group   => "root",
        mode    => 0755,
        source  => "puppet:///modules/nrpe/check_rabbitmq_watermark",
        require => Package["nrpe_packages"],
    }

    file { "/usr/lib/nagios/plugins/check_vm":
        notify  => Service["nrpe_service"],
        ensure  => present,
        owner   => "root",
        group   => "root",
        mode    => 0755,
        source  => "puppet:///modules/nrpe/check_vm",
        require => Package["nrpe_packages"],
    }

}
