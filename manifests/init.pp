class pgpool {
	$pgpool_pkg = 'pgpool-II-91'
	$pgpool_srv = 'pgpool-II-91'
	$servers = hiera('pgpool-servers')
	package	{ $pgpool_pkg:
		ensure => installed,
	}
	package { 'users-postgres':
		ensure => installed,
		require => Package[$pgpool_pkg],
	}
	service { $pgpool_srv:
		ensure => running,
		require => File['pgpool.conf'],
	}
	file { "pgpool.conf":
		path => "/etc/pgpool-II-91/${name}.conf",
		owner => 'root',
		group => 'root',
		mode => '0644',
		content => template('pgpool/pgpool.erb'),
		require => Package[$pgpool_pkg],
		notify => Service[$pgpool_srv],
	}
	file { "sys-${name}":
		path => "/etc/sysconfig/${name}",
		ensure => present,
		owner => 'root',
		group => 'root',
		mode => '0644',
		content => 'OPTS=" -n"',
		require => Package[$pgpool_pkg],
		notify => Service[$pgpool_srv],
	}
	file { "run-${name}":
		path => "/var/run/${name}/",
		ensure => directory,
		owner => 'postgres',
		group => 'postgres',
		require => Package[$pgpool_pkg],
		notify => Service[$pgpool_srv],
	}
	file { "pool_passwd":
		path => "/etc/pgpool-II-91/pool_passwd",
		ensure => present,
		owner => 'postgres',
		group => 'postgres',
		require => Package[$pgpool_pkg],
	}
}
