# == Class: tomcat
#
# Installs and manages the Tomcat application server..
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
class tomcat(
  $tomcat_maj_version  = $tomcat::params::tomcat_maj_version,
  $install_type        = $tomcat::params::install_type,
  $package             = $tomcat::params::package,
  $package_version     = $tomcat::params::package_version,
  $catalina_home       = $tomcat::params::catalina_home,
  $tomcat_user         = $tomcat::params::tomcat_user,
  $tomcat_uid          = $tomcat::params::tomcat_uid,
  $tomcat_group        = $tomcat::params::tomcat_group,
  $tomcat_gid          = $tomcat::params::tomcat_gid,
) inherits tomcat::params {

  validate_re($tomcat_maj_version, '^[6-7]([\.0-9]+)?$')
  validate_absolute_path($catalina_home)
  validate_re($install_type, '^(package|archive)$', '$install_type must be \'package\' or \'archive\'')

  class { '::tomcat::user': } ->
  class { '::tomcat::install': } ->
  Class['tomcat']
}
