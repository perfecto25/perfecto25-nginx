class nginx {

include ::nginx::install
include ::nginx::config
include ::nginx::vcsrepo
include ::nginx::service


# resource sequence
Class['::nginx::install'] -> Class['::nginx::config'] -> Class['::nginx::vcsrepo'] -> Class['::nginx::service']

}
