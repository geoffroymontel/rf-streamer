class liquidsoap {
  $liquidsoap_packages = [
  "wget","unzip","aspcud","m4","git","pkg-config",
  "libpcre3-dev","libao-dev",
  "ncurses-dev","libogg-dev",
  "libtool","g++","libxml-dom-perl","festival",
  "libflac++-dev",
  "libmad0-dev", "libshout3-dev", "libvorbis-dev", "libid3tag0-dev",
  "libasound2-dev", "autoconf", "automake",
  "swh-plugins","portaudio19-dev","libgstreamer1.0-0","libgstreamer1.0-dev",
  "libgstreamer-plugins-base1.0-0", "libgstreamer-plugins-base1.0-dev",
  "liblo-dev","libshine-dev",
  "libmad0",
  "libspeex1", "libspeex-dev",
  "libtheora0", "libtheora-dev",
  "libvo-aacenc0", "libvo-aacenc-dev",
  "libfdk-aac0", "libfdk-aac-dev",
  "libsoundtouch0", "libsoundtouch-dev",
  "libsamplerate0", "libsamplerate0-dev",
  "libflac++6", "libflac8",
  "dssi-dev",
  "libpulse0", "libpulse-dev",
  "libtag1c2a", "libtag1-dev",
  "libvorbis0a",
  "libopus0", "libopus-dev",
  "libfaad2", "libfaad-dev",
  "libmp3lame-dev","libmp3lame0"
  ]

  class { 'apt':
  }

  package { $liquidsoap_packages:
    ensure => present
  }
  ->
  file { "/tmp/build-opam.sh":
    owner   => vagrant,
    group   => vagrant,
    mode    => 555,
    ensure  => present,
    source  => "puppet:///modules/liquidsoap/build-opam.sh"
  }
  ->
  exec { "/tmp/build-opam.sh":
    command => "/tmp/build-opam.sh",
    unless => "test -f /usr/bin/opam",
    timeout => 0,
    user => vagrant,
    group => vagrant
  }
  ->
  file { "/tmp/PACKAGES":
    ensure => present,
    source  => "puppet:///modules/liquidsoap/PACKAGES",
    owner => vagrant,
    group => vagrant
  }
  ->
  file { "/tmp/build-liquidsoap.sh":
    mode    => 555,
    ensure  => present,
    source  => "puppet:///modules/liquidsoap/build-liquidsoap.sh",
  }
  ->
  exec { "/tmp/build-liquidsoap.sh":
    command => "/tmp/build-liquidsoap.sh",
    unless => "test -f /usr/local/bin/liquidsoap",
    timeout => 0,
    user => vagrant,
    group => vagrant
  }
}
