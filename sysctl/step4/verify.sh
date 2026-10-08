#!/bin/bash
f=/etc/sysctl.d/60-lfcs.conf
grep -Eq '^\s*net\.ipv4\.ip_default_ttl\s*=\s*128\s*$' "$f" || exit 1
grep -Eq '^\s*net\.ipv4\.icmp_echo_ignore_all\s*=\s*1\s*$' "$f" || exit 1

# Simulate a reboot: reset values, then reload every config file
sysctl -w net.ipv4.ip_default_ttl=64 net.ipv4.icmp_echo_ignore_all=0 vm.swappiness=60 >/dev/null
sysctl --system >/dev/null 2>&1

[ "$(sysctl -n net.ipv4.ip_default_ttl)" = "128" ] || exit 1
[ "$(sysctl -n net.ipv4.icmp_echo_ignore_all)" = "1" ] || exit 1
[ "$(sysctl -n vm.swappiness)" = "10" ]   # step 3 must survive too
