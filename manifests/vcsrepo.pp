class nginx::vcsrepo (
  $root_dir = $::nginx::params::root_dir,
  $remote_git_source = $::nginx::params::remote_git_source
) inherits ::nginx::params {


package { 'git':
  ensure => installed,
}

#vcsrepo { $root_dir:
#  ensure    => present,
#  provider  => git,
#  source    => $remote_git_source,
#  revision  => 'master',
#  force     => true,
#}

}
