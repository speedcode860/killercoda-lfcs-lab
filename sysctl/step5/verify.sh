#!/bin/bash
f=/etc/sysctl.d/90-hardening.conf
declare -A want=(
  [net.ipv4.conf.all.accept_redirects]=0
  [net.ipv4.conf.all.send_redirects]=0
  [net.ipv4.icmp_echo_ignore_broadcasts]=1
  [net.ipv4.tcp_syncookies]=1
  [kernel.dmesg_restrict]=1
)

# 1. Every setting is in the file
for k in "${!want[@]}"; do
  grep -Eq "^\s*${k//./\\.}\s*=\s*${want[$k]}\s*$" "$f" || exit 1
done

# 2. Simulate a reboot: set the opposite values, then reload all files
for k in "${!want[@]}"; do sysctl -w "$k=$((1 - want[$k]))" >/dev/null; done
sysctl --system >/dev/null 2>&1

# 3. Every value came back
for k in "${!want[@]}"; do
  [ "$(sysctl -n "$k")" = "${want[$k]}" ] || exit 1
done

# 4. Regular user can no longer read dmesg
! su - student -c "dmesg" >/dev/null 2>&1 || exit 1

# 5. Auditor question
[ "$(tr -d '[:space:]' < /home/student/answers/q5 2>/dev/null)" = "/etc/sysctl.d/99-zz-legacy.conf" ]
