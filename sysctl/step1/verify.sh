#!/bin/bash
ans() { tr -d '[:space:]' < "/home/student/answers/$1" 2>/dev/null; }
[ "$(ans q1)" = "$(sysctl -n kernel.pid_max)" ] || exit 1
[ "$(ans q2)" = "/proc/sys/net/ipv4/ip_forward" ] || exit 1
[[ "$(ans q3)" =~ ^-?n$ ]] || exit 1      # accepts "-n" or "n"
[ "$(ans q4)" = ";" ]
