class mysql {
  $packages = ["mysql-server", "mysql-client", "php5-mysql"]

  package { $packages:
    ensure => present,
    require => Package["php5"]
  }

  exec { "mysql-password":
    require => [
      Package["mysql-server"],
      Package["mysql-client"]
    ],
    refreshonly => true,
    unless => "mysqladmin -uroot -p$db_password status",
    path => "/bin:/usr/bin",
    command => "mysqladmin -uroot password $db_password",
  }
}
