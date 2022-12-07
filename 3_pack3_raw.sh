#!/bin/bash
cd /home/aida/Downloads
git clone https://github.com/IntelRealSense/librealsense.git
echo 'deb http://archive.ubuntu.com/ubuntu focal-updates main' >> /etc/apt/sources.list
apt-get install libssl-dev libusb-1.0-0-dev libudev-dev pkg-config libgtk-3-dev libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev python3-dev -y
cd /home/aida/Downloads/librealsense
sudo cp config/99-realsense-libusb.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules && udevadm trigger
./scripts/patch-realsense-ubuntu-lts.sh
echo 'hid_sensor_custom' | sudo tee -a /etc/modules
mkdir build
cd /home/aida/Downloads/librealsense/build
export PATH=$PATH:/usr/bin/python3
cmake ../ -DCMAKE_BUILD_TYPE=Release -DBUILD_PYTHON_BINDINGS=true -DFORCE_RSUSB_BACKEND=true -DBUILD_SHARED_LIBS=false -DBUILD_WITH_CUDA=true
make -j8
sudo make install
reboot

