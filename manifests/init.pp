define sysctl(
		$param,
		$value
) {
	include sysctl::packages

	file { "/etc/sysctl.d/${name}.conf":
		ensure  => file,
		mode    => 0444,
		owner   => "root",
		group   => "root",
		content => "# THIS FILE IS PUPPET MANAGED\n\n${param} = ${value}\n",
		require => Sysctl::Packages,
	}
	
	exec { "sysctl::set ${param} to ${value}":
		command => "/sbin/sysctl ${param}=${value}",
		unless  => "/usr/bin/test \$(/sbin/sysctl ${param}) = '${param} = ${value}'",
		require => Sysctl::Packages,
	}
}
