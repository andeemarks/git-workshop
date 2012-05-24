#!/bin/bash
cd ~
rm -rf git-workshop
kill `lsof | grep 4567 | awk '{print $2}'`
git clone git://github.com/andeemarks/git-workshop.git
cd git-workshop
bundle install --deployment --without development test
ruby -rubygems app/web_relative_clock.rb &
HOST_NAME=`ec2metadata | grep public-hostname | awk '{print $2}'`
sleep 2
echo "**** Now running - check http://$HOST_NAME:4567/city/<cityname>"