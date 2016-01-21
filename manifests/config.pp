class nginx::config (
  $conf_file = $::nginx::params::conf_file,
  $root_dir = $::nginx::params::root_dir,
  $hostname = $::nginx::params::hostname,
) inherits ::nginx::params {

 File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

file { "${conf_file}":
  ensure  => present,
  content => template('nginx/nginx.conf.erb'),
  require => Package['nginx'],
  notify  => Service['nginx'],
}


file { "${default_file}":
  ensure  => present,
  content => template('nginx/default.erb'),
  require => Package['nginx'],
  notify  => Service['nginx'],
}


file { "${root_dir}/index.html":
  ensure  => present,
  content => file('nginx/index.html'),
  require => Package['nginx'],

}


}
