[[ $- != *i* ]] && return

export PATH="$HOME/bin:$PATH"

export EDITOR=nano

PS1="\[\e[0;32m\]\u@\h \[\e[0;34m\]\w$ \[\e[0m\]"

ip addr add 10.0.2.15/24 dev ens3
ip link set ens3 up
ip route add default via 10.0.2.1
echo "nameserver 10.0.2.3" | tee /etc/resolv.conf

mkdir -p /run/user/$(id -u) 2> /dev/ttyS0

export XDG_DATA_DIR="/run/user/$(id -u)/"
