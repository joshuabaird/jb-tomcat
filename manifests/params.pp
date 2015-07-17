# == Class: tomcat::params
#
# Default parameters for the tomcat class
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
class tomcat::params {
  case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease {
        '7': {
          $tomcat_maj_version = '7'
          $package            = 'tomcat'
          $package_version    = 'present'
          $catalina_home      = '/usr/share/tomcat'
        }
        '6': {
          $tomcat_maj_version = '6'
          $package            = 'tomcat6'
          $package_version    = 'present'
          $catalina_home      = '/usr/share/tomcat6'
        }
        default: {
          fail("Unsupported OS Version: ${::operatingsystem} ${::operatingsystemrelease}")
        }
      }
      $tomcat_user  = 'tomcat'
      $tomcat_uid   = '91'
      $tomcat_group = 'tomcat'
      $tomcat_gid   = '91'
    }
    default: {
      fail("Unsupported OS:  ${::operatingsystem} ${::operatingsystemrelease}")
    }
  }

  # General non-OS specific params
  $install_type = 'package'
}
