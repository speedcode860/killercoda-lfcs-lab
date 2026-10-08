#!/bin/bash
grep -Eq '^\s*vm\.swappiness\s*=\s*10\s*$' /etc/sysctl.conf || exit 1
[ "$(sysctl -n vm.swappiness)" = "10" ]
