#!/bin/bash
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt update

sudo apt install ros-noetic-desktop-full -y

sudo apt install -y ros-noetic-slam-gmapping ros-noetic-ros-numpy ros-noetic-ros-numpy ros-noetic-teleop-twist-keyboard ros-noetic-pcl-ros

echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

source ~/.bashrc

sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential pcl-tools

sudo rosdep init

rosdep update



