# Ticket SEC-2041 - Kernel hardening

> **From:** Security team
> **To:** Linux admins
> **Priority:** High
>
> Following last week's audit, apply the settings below on this server.
> They must be active now **and** survive a reboot.
> Put them in `/etc/sysctl.d/90-hardening.conf`.
>
> | Parameter | Value |
> |---|---|
> | `net.ipv4.conf.all.accept_redirects` | `0` |
> | `net.ipv4.conf.all.send_redirects` | `0` |
> | `net.ipv4.icmp_echo_ignore_broadcasts` | `1` |
> | `net.ipv4.tcp_syncookies` | `1` |
> | `kernel.dmesg_restrict` | `1` |
>
> **Expected result:** a regular user can no longer read the kernel log with `dmesg`.

## Questions

1. After applying everything, is the expected result reached? If not, fix it.
2. The auditor wants to know: which file was preventing the setting from working?
   Write its full path in `~/answers/q5`.
