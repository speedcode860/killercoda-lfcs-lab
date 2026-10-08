# Non-persistent changes

1. Set `net.ipv4.ip_default_ttl` to `128` using the `sysctl` command.
2. Set `net.ipv4.icmp_echo_ignore_all` to `1` **without** the `sysctl` command,
   by writing directly to its file under `/proc/sys`.

Both changes must be lost after a reboot.
