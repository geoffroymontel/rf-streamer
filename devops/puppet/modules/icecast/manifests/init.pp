class icecast (
  $admin_user="admin",
  $admin_password="Q0A46L1cv81yi",
  $source_password="W426UP7035r",
  $relay_password="74eOEZ8U7ZM",
  $hostname="localhost",
  $port="8000"
) {
  $icecast_packages = ["libxml2","libxslt1.1","curl","openssl","vorbis-tools"]

  package { $icecast_packages:
    ensure => present
  }
  ->
  group { 'icecast':
    ensure => present
  }
  ->
  user { 'icecast2':
    ensure => present
  }
  ->
  package { 'icecast2':
    ensure => installed,
  }
  ->
  file { '/etc/icecast2/icecast.xml':
    ensure    => file,
    content   => template("icecast/icecast.xml.erb"),
    owner     => "icecast2",
    group     => "icecast"
  }
  ->
  file { '/etc/default/icecast2':
    owner   => root,
    group   => root,
    mode    => 644,
    ensure  => present,
    source  => "puppet:///modules/icecast/icecast2"
  }
  ->
  service { 'icecast2':
    enable => true
  }
}
