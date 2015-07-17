# == Class: tomcat::install
#
# Installs the Tomcat server
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
class tomcat::install(
  $install_type = $tomcat::install_type,
) {
  assert_private('This is a private class and it should not be called directly!')

  case $install_type {
    'package' : { contain ::tomcat::install::package }
    'archive' : { contain ::tomcat::install::archive }
    default   : { contain ::tomcat::install::package }
  }
}
