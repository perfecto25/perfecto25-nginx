class nginx::params {


  case $::osfamily {
  'Debian': {
    if ($::operatingsystem == 'Ubuntu' and $::operatingsystemmajrelease in ['12.04','14.04']) {
      $package_name   = 'nginx'
      $service_name = 'nginx'
      $vhost_dir    = '/etc/nginx/sites-enabled'
      $user         = 'www-data'
    }
            }
  'RedHat': {
    if ($::operatingsystem == 'CentOS' and $::operatingsystemmajrelease in ['6','7']) {
      $package_name   = 'nginx'
      $service_name = 'nginx'
      $vhost_dir    = '/etc/nginx/vhost.d'
      $user         = 'nginx'
    }

            }
  default: {
    fail("Module ${module_name} is not supported on ${::operatingsystem}")
  }


  }






# Defaults Values
$nginx_dirs = [ '/etc/nginx','/etc/nginx/includes','/etc/nginx/conf.d','/etc/nginx/ssl','/etc/nginx/sites-available','/etc/nginx/sites-enabled' ]
$conf_file = '/etc/nginx/nginx.conf'
$default_file = '/etc/nginx/sites-available/default'
$root_dir = '/usr/share/nginx/html/'
$hostname = $::hostname
$puppet_agent_version = $::puppet_agent_version
$nginx_port = '8000'



}
