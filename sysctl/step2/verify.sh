#!/bin/bash
[ "$(sysctl -n net.ipv4.ip_default_ttl)" = "128" ] || exit 1
[ "$(cat /proc/sys/net/ipv4/icmp_echo_ignore_all)" = "1" ] || exit 1
# Must not be written in any config file
! grep -rqsE "ip_default_ttl|icmp_echo_ignore_all" /etc/sysctl.conf /etc/sysctl.d/ /run/sysctl.d/
