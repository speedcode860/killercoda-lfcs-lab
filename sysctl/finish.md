# Lab complete

You changed kernel parameters at runtime, made them persistent,
and solved a real-world hardening ticket.

| Goal | Command |
|---|---|
| Read a value | `sysctl <key>` / `sysctl -n <key>` / `cat /proc/sys/...` |
| Change now (lost at reboot) | `sysctl -w <key>=<value>` / `echo <value> \| sudo tee /proc/sys/...` |
| Change permanently | `/etc/sysctl.conf` or `/etc/sysctl.d/NN-name.conf` |
| Load one file | `sysctl -p <file>` |
| Reload everything (as at boot) | `sysctl --system` |
