class nginx::service (
  $service_name = $::nginx::params::service_name,
  $conf_file = $::nginx::params::conf_file,
  $nginx_port = $::nginx::params::nginx_port,
  $root_dir = $::nginx::params::root_dir,

) inherits ::nginx::params {


service { 'nginx':
  name    => $service_name,
  ensure  => running,
  enable  => true,
  require => File["${conf_file}"],
    }




}
