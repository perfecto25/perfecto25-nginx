class nginx::pull_remote (

  $modulepath = $::nginx::params::modulepath,
  $remote_git_source = $::nginx::params::remote_git_source,
  $git_sync_min = $::nginx::params::git_sync_min

) inherits ::nginx::params {

cron  { 'pullremote':
  command => "/usr/local/bin/puppet apply ${modulepath}/nginx/tests/pull_remote.pp",
  user    => root,
  minute  => "*/${git_sync_min}",
}

vcsrepo { "${modulepath}/nginx/files/repo":
  ensure     => latest,
  provider   => git,
  source     => $remote_git_source,
  revision   => 'master',
  force      => true,
}


}
