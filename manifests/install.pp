class nginx::install ( 

$nginx_dirs = $::nginx::params::nginx_dirs

) inherits ::nginx::params {

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


file { '/etc/nginx': 
  ensure => directory,
  mode   => '0644',
  owner  => 'root',
  group  => 'root',
  require => Package['nginx'],
}

package { 'nginx': 
  ensure => latest,
}

file { '/etc/nginx/nginx.conf':
  ensure  => present,
  mode    => '0644',
  owner   => 'root',
  group   => 'root',
  # content => template('nginx/nginx.conf.erb'),
  require => Package['nginx'],
  notify  => Service['nginx'],

}

service { 'nginx':
  ensure  => running,
  enable  => true,
  require => File['/etc/nginx/nginx.conf'],
  restart => '/etc/init.d/nginx reload',
}



file { [$nginx_dirs]: 
  ensure  => directory,
  mode    => '0644',
  owner   => 'root',
  group   => 'root',
  require => Package['nginx'],
}

user { 'www-data':
  ensure           => 'present',
  comment          => 'www-data',
  gid              => '33',
  home             => '/var/www',
  password         => '*',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/usr/sbin/nologin',
  uid              => '33',
}






}
