#!/usr/bin/env bash
set -e

echo "Install some common tools for further installation"
if [ "${DISTRO}" == "centos" ] ; then
  yum install -y vim wget net-tools bzip2 python3
  wget http://mirror.ghettoforge.org/distributions/gf/el/7/gf/x86_64/wmctrl-1.07-17.gf.el7.x86_64.rpm
  yum localinstall -y wmctrl*.rpm
  rm wmctrl*.rpm
else
  apt-get update
  apt-get install y apt-utils
  apt-get update
  apt-get install -y git vim wget net-tools locales bzip2 wmctrl software-properties-common mesa-utils
  #apt-get clean -y
  apt-get autoremove -y
  apt-get autoclean -y

  echo "generate locales for en_US.UTF-8"
  locale-gen en_US.UTF-8
fi

# if [ "$DISTRO" = "ubuntu" ]; then
#   #update mesa to latest
#   add-apt-repository ppa:kisak/kisak-mesa
#   #apt full-upgrade -y
#   apt-get upgrade -y mesa
#   apt-get autoremove -y
#   apt-get autoclean -y
# fi
