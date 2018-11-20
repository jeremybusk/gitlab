#!/usr/bin/env bash
## Debian/Ubuntu/Mint Install Docker CE, Gitlab Runner & Register
# ref https://docs.gitlab.com/runner/install/linux-repository.html

## Install Docker-CE
# https://docs.docker.com/install/linux/docker-ce/ubuntu/
sudo apt-get update
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

apt-get install -yq lxd zfsutils-linux
sudo lxd init

## Install Gitlab Runner
# https://docs.gitlab.com/runner/install/linux-repository.html
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash

cat > /etc/apt/preferences.d/pin-gitlab-runner.pref <<EOF
 Explanation: Prefer GitLab provided packages over the Debian native ones
 Package: gitlab-runner
 Pin: origin packages.gitlab.com
 Pin-Priority: 1001
EOF
 
sudo apt-get update
sudo apt-get -y install gitlab-runner
 
## Update Gitlab Runner
# sudo apt-get update
# sudo apt-get -y install gitlab-runner

## Register runner
sudo gitlab-runner register
