# Install pritunl client
#
# Usage:
#
#   include pritunl
#

class pritunl (
  $ensure   = 'present',
  $version = '0.10.14'
) {

  include boxen::config

  $download_uri = "https://github.com/pritunl/pritunl-client-electron/releases/download/${version}/Pritunl.pkg.zip"

  exec { "download pritunl-${version}":
    command => "curl -s -L ${download_uri} -o /tmp/Pritunl.pkg.zip"
  } ->
  exec { "unzip pritunl-${version}":
    command => "unzip -o /tmp/Pritunl.pkg.zip -d /tmp/Pritunl.pkg"
  } ->
  package { "pritunl-${version}":
    ensure          => $ensure,
    provider        => 'pkgdmg',
    source          => "/tmp/Pritunl.pkg",
    install_options => [
      '--appdir=/Applications',
      "--binarydir=${boxen::config::bindir}"
    ]
  }
}
