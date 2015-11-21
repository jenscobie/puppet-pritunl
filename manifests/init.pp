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

  package { "pritunl-${version}":
    ensure          => $ensure,
    provider        => 'pkgdmg',
    source          => "https://github.com/pritunl/pritunl-client-electron/releases/download/${version}/Pritunl.pkg.zip",
    install_options => [
      '--appdir=/Applications',
      "--binarydir=${boxen::config::bindir}"
    ]
  }
}
