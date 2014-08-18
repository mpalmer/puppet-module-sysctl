# Purge any configuration not set via Puppet.
class sysctl::managed_only {
	file {
		"/etc/sysctl.conf":
			ensure  => file,
			mode    => 0440,
			owner   => "root",
			group   => "root",
			content => "# THIS FILE IS DELIBERATELY EMPTY.\n# PLEASE USE PUPPET TO SET SYSCTL VALUES.\n";
		"/etc/sysctl.d":
			ensure  => directory,
			mode    => 0750,
			recurse => true,
			purge   => true,
			force   => true;
	}
}
