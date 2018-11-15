#!/usr/bin/env bash
# # For Debian/Ubuntu/Mint Gitlab Runner Install & Register
# ref https://docs.gitlab.com/runner/install/linux-repository.html
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash

#
cat > /etc/apt/preferences.d/pin-gitlab-runner.pref <<EOF
 Explanation: Prefer GitLab provided packages over the Debian native ones
 Package: gitlab-runner
 Pin: origin packages.gitlab.com
 Pin-Priority: 1001
 EOF
 
sudo apt-get update
sudo apt-get install gitlab-runner
 
## Update 
# sudo apt-get update
# sudo apt-get install gitlab-runner

# Register runner
sudo gitlab-runner register
