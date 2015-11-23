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
    command => "curl ${download_uri} > /tmp/Pritunl-${version}.zip"
  } ->
  exec { "unzip pritunl-${version}":
    command => "unzip -o /tmp/Pritunl-${version}.zip"
  } ->
  package { "pritunl-${version}":
    ensure          => $ensure,
    provider        => 'pkgdmg',
    source          => "/tmp/Pritunl-${version}.pkg",
    install_options => [
      '--appdir=/Applications',
      "--binarydir=${boxen::config::bindir}"
    ]
  }
}
