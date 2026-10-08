#!/bin/bash
# Non-root user with sudo (the learner is not told)
useradd -m -s /bin/bash student
echo "student ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/student
mkdir -p /home/student/answers
chown -R student: /home/student/answers

# Known starting values
sysctl -w net.ipv4.ip_default_ttl=64 vm.swappiness=60 net.ipv4.icmp_echo_ignore_all=0 >/dev/null

# Trap for step 5: an old file read AFTER the learner's file
cat > /etc/sysctl.d/99-zz-legacy.conf <<'EOF'
# Added by J. Doe in 2019 for debugging - temporary
kernel.dmesg_restrict = 0
EOF
sysctl -w kernel.dmesg_restrict=0 >/dev/null
