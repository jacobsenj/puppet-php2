define php2::extension (
  $ensure  = 'present',
  $extension,
  $php
) {
  $php_version = regsubst($php, '\.', '')

  require php2::config
  require php2::fpm::config

  php_extension { $name:
    ensure         => $ensure,
    extension      => $extension,
    version        => $version,
    package_name   => $package_name,
    package_url    => "",
    homebrew_path  => $boxen::config::homebrewdir,
    phpenv_root    => $php2::config::root,
    php_version    => $php,
    cache_dir      => $php2::config::extensioncachedir,
  }
}
