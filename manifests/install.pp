class nginx::install (
  $package_name = $::nginx::params::package_name,
  $service_name = $::nginx::params::service_name,
  $vhost_dir = $::nginx::params::vhost_dir,
  $user = $::nginx::params::user,
  $nginx_dirs = $::nginx::params::nginx_dirs,
  $conf_file = $::nginx::params::conf_file,
  $puppet_agent_version = $::nginx::params::puppet_agent_version

) inherits ::nginx::params {


# check node agent version
$fqdn = $::fqdn

if $puppet_agent_version < '3.8' {
  fail("---- Node ${fqdn} has a Puppet agent version: ${puppet_agent_version} which is not compatible with this module. Need to have minimum Puppet agent 3.8 -----")
}


# Repo to be added later, add repo update to Params class based on OS

  #exec { 'add repo':
  # path    => "/usr/bin",
  # command => "add-apt-repository ppa:nginx/stable",
  #  before  => Exec['update'],
  #}

  #exec { "update":
  # path    => "/usr/bin/",
  # command => "apt-get update",
  # before  => Package['nginx'],
  #}

package { 'nginx':
  name   => $package_name,
  ensure => latest,
}


file { [$nginx_dirs]:
  ensure  => directory,
  mode    => '0644',
  owner   => 'root',
  group   => 'root',
  require => Package['nginx'],
}


user { 'nginx_user':
  name             => $user,
  ensure           => 'present',
  comment          => "${user}",
  home             => '/var/www',
  password         => '*',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/usr/sbin/nologin',
  require          => Package['nginx'],
}


}



