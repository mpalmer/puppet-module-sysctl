define sysctl(
		$param = $name,
		$value
) {
	include sysctl::packages

	file { "/etc/sysctl.d/${name}.conf":
		ensure  => file,
		mode    => 0444,
		owner   => "root",
		group   => "root",
		content => "# THIS FILE IS PUPPET MANAGED\n\n${param} = ${value}\n",
		require => Class['sysctl::packages'],
	}
	
	exec { "sysctl::set ${param} to ${value}":
		command => "/sbin/sysctl ${param}='${value}'",
		unless  => "/usr/bin/test \"\$(/sbin/sysctl ${param})\" = '${param} = ${value}'",
		require => Class['sysctl::packages'],
	}
}
