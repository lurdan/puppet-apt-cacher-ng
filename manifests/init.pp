class apt-cacher-ng (
  $version = 'installed',
  ) {

  package { 'apt-cacher-ng': ensure => $version, }

  service { 'apt-cacher-ng':
    ensure => running,
    require => Package['apt-cacher-ng'],
  }

  Package['apt-cacher-ng'] -> Apt-cacher-ng::Backend <| |> -> Service['apt-cacher-ng']
}


# Usage:
#   apt-cacher-ng::backend { 'debian':
#     url => 'http://ftp.jp.debian.org/debian/'
#   }
define apt-cacher-ng::backend (
  $url
  ) {

  file { "/etc/apt-cacher-ng/backends_${name}":
    content => "${url}\n",
  }
}
