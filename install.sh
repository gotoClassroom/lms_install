#!/bin/bash
# Install LMS script

sudo apt-get update
sudo apt-get install gcc

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' docker|grep -c "ok installed")
echo Checking for docker: $PKG_OK
if [ 0 == $PKG_OK ]; then
  echo "No docker. Install docker."
  wget -qO- https://get.docker.com/ | sh
fi

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' fig|grep -c "ok installed")
echo Checking for fig: $PKG_OK
if [ 0 == $PKG_OK ]; then
  echo "No fig. Install fig."
  curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` > /usr/local/bin/fig; chmod +x /usr/local/bin/fig
fi

if [ -f /usr/bin/docker-enter ]; then
  echo "Docker enter exist!"
else
  git clone https://github.com/Pithikos/docker-enter.git docker-enter

  gcc docker-enter/docker-enter.c -o docker-enter/docker-enter

  sudo mv ./docker-enter/docker-enter /usr/bin
fi

sudo fig build --no-cache

sudo fig up --no-recreate -d
