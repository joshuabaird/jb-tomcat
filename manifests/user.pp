# == Class: tomcat::user
#
# Configures the user and group for Tomcat.
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
class tomcat::user(
  $tomcat_user  = $tomcat::tomcat_user,
  $tomcat_uid   = $tomcat::tomcat_uid,
  $tomcat_group = $tomcat::tomcat_group,
  $tomcat_gid   = $tomcat::tomcat_gid,
) {
  assert_private('This is a private class and it should not be called directly!')

  group { $tomcat_group:
    ensure => present,
    name   => $tomcat_group,
    gid    => $tomcat_gid,
    system => true,
  }

  user { $tomcat_user:
    ensure  => present,
    name    => $tomcat_user,
    uid     => $tomcat_uid,
    gid     => $tomcat_gid,
    system  => true,
    require => Group["$tomcat_group"],
  }
}
