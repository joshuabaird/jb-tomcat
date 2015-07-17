# == Class: tomcat::install::package
#
# Installs the Tomcat server via packages
#
# === Parameters
#
# === Examples
#
# === Authors
#
# Josh Baird (joshbaird@gmail.com)
#
# === Copyright
#
# Copyright 2015 Josh Baird
#
class tomcat::install::package(
  $package         = $tomcat::package,
  $package_version = $tomcat::package_version,
) {
  assert_private('This is a private class and it should not be called directly!')

  package { $package:
    ensure => $package_version,
  }
}
