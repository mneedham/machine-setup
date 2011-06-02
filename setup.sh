#!/bin/bash
profile_file="$HOME/.bash_profile"

# Install some tools we use
yum install wget
yum install vim
yum install git
yum install ack

# download and install jdk
wget http://oracleotn.rd.llnwd.net/otn-pub/java/jdk/6u25-b06/jdk-6u25-linux-x64-rpm.bin -O jdk.rpm.bin 
chmod u+x jdk.rpm.bin
./jdk.rpm.bin

ln -sf /usr/java/jdk1.6.0_25 /usr/java/latest 
ln -sf /usr/java/latest/bin/java /usr/bin/java

echo 'export JAVA_HOME=/usr/java/latest' >> "$profile_file"

# download and install scala
wget http://www.scala-lang.org/sites/default/files/linuxsoft_archives/downloads/distrib/files/scala-2.8.1.final.tgz -O scala.tgz
tar -xf scala.tgz
mkdir /usr/scala/
mv scala-2.8.1.final /usr/scala/
ln -s /usr/scala/scala-2.8.1.final/bin/scala /usr/bin/scala
 
# download ruby via rvm
bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
source "$profile_file"
rvm install 1.9.2

# download and install IntelliJ
wget http://download-ln.jetbrains.com/idea/ideaIC-10.5.tar.gz -O intellij.tar.gz
tar -zxvf intellij.tar.gz

# download and install MarkLogic
yum install glibc.i686
yum install lsb
wget http://segblogr0065:5304/MarkLogic/MarkLogic.rpm -O MarkLogic.rpm
rpm -i MarkLogic.rpm

# install the chrome magique
wget https://dl-ssl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -O google-chrome.rpm
rpm -i google-chrome.rpm
