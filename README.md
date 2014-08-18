Manage sysctl parameters.

Pretty simple to use:

    sysctl { "some_name":
        param => "net.ipv4.xyzzy",
        value => "42";
    }

This will immediately set /proc/sys/et/ipv4/xyzzy to the value 42, and write
a sysctl.conf entry to ensure that is set on boot.  The namevar is used as
the basis for the filename in /etc/sysctl.d, if that is supported on your
OS.
