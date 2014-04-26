# Public: Variables for working with Homebrew
#
# Examples
#
#   require homebrew::config

class homebrew::config {
  include boxen::config

  $cachedir   = "${boxen::config::cachedir}/homebrew"
  $installdir = "${boxen::config::home}/homebrew"
  $libdir     = "${installdir}/lib"

  $cmddir     = "${installdir}/Library/Homebrew/cmd"
  $tapsdir    = "${installdir}/Library/Taps"
  $formuladir = "${installdir}/Library/Formula"

  $brewsdir   = "${tapsdir}/boxen/boxen-brews"

  $min_revision = 'e567009'
}
