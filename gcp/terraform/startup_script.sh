#!/usr/bin/env sh

apt update
apt upgrade -y

apt-get install -y vim curl apt-transport-https vim git wget software-properties-common lsb-release ca-certificates

# swapoff -a

# modprobe overlay
# modprobe br_netfilter

# cat << EOF | tee /etc/sysctl.d/kubernetes.conf
# net.bridge.bridge-nf-call-ip6tables = 1
# net.bridge.bridge-nf-call-iptables = 1
# net.ipv4.ip_forward = 1
# EOF

# sysctl --system

# install -m 0755 -d /etc/apt/keyrings
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
# chmod a+r /etc/apt/keyrings/docker.asc
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# apt-get update

# apt-get install containerd.io -y
# containerd config default | sudo tee /etc/apt/config.toml
# sed -e 's/SystemdCgroup = false/SystemdCgroup = true/' -i /etc/containerd/config.toml
# systemctl restart containerd
