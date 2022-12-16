#!/bin/bash
cd /home/aida/Downloads
sudo apt install -y libblas-dev
wget https://github.com/PointCloudLibrary/pcl/archive/refs/tags/pcl-1.13.0.tar.gz
tar -xf pcl-pcl-1.13.0.tar.gz
cd pcl-pcl-1.13.0
mkdir build && cd build
cmake ..
make -j4
sudo make install

