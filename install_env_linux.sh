#!/bin/bash

# linux packages
sudo apt update
sudo apt upgrade -y
sudo apt install build-essential curl python-setuptools ruby file git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev -y
sudo apt install python-pip -y
sudo apt install python-software-properties -y
sudo apt install android-sdk -y

# environment variables
echo 'PATH="$PATH:/usr/lib/android-sdk/platform-tools:/usr/lib/android-sdk/tools"' >> ~/.profile
source ~/.profile
# sudo echo 'ANDROID_HOME="/usr/lib/android-sdk"' >>  /etc/environment
echo 'ANDROID_HOME="/usr/lib/android-sdk"' | sudo tee --append /etc/environment
# sudo echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> /etc/environment
echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' | sudo tee --append /etc/environment
source /etc/environment

# install linuxbrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
echo 'MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"' >>~/.bash_profile
echo 'INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"' >>~/.bash_profile
echo 'PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >>~/.profile
source ~/.profile

# install gcc because linuxbrew recommends it
brew install gcc

# install node
cd ~/bin/
brew install node

# create links for node and npm
# sudo ln -s /usr/bin/node /home/linuxbrew/.linuxbrew/bin/node
# sudo ln -s /usr/bin/npm /home/linuxbrew/.linuxbrew/bin/npm

# node packages
npm install -g npm
npm install -g appium@1.6.5
npm install -g appium-uiautomator2-driver

# python packages
sudo -H pip install --upgrade pip
sudo -H pip install robotframework-appiumlibrary
sudo -H pip install robotframework==3.0.2
sudo -H easy_install selenium
