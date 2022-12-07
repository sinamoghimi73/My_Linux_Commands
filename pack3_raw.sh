#!/bin/bash
cd /home/aida/Downloads
wget -O REALSENSE.zip https://s191vlx.storage.yandex.net/rdisk/6ee6f672c64ea161ea6c61f9a9d0c606f985888c8273622f36f35198e034ea48/63909c13/fKqInKw3d7bLFOeFnMGnhAdIFQ1NQMm50DLntDO4I8gl05OWxcbUPFADt6yVfI5zRn_hT7Ci77PViX4il3C-RgrETXudcP3UDmRJKZPdg1ur8npumZHI4midPdWhecNq?uid=0&filename=REALSENSE.zip&disposition=attachment&hash=VouuBVTGaioimdQnDZERR%2BCm9MK2YwJJkkRx5sbmYkaDJRAMxJvmlfLRO7xit4Zmq/J6bpmRyOJonT3VoXnDag%3D%3D&limit=0&content_type=application%2Fzip&owner_uid=1677204052&fsize=5978679196&hid=187bef3ae6b01b47bad2f2c14726c6a0&media_type=compressed&tknv=v2&rtoken=TGdSpVyBCafZ&force_default=no&ycrid=na-cb2d1d8e5f8ed7b93279ac3ccbbc72ab-downloader2e&ts=5ef3d5180eac0&s=ee9635937321d1fa8a81a60e720b825fc26ed7dd8c1c545136e59ee80a7edbfb&pb=U2FsdGVkX1_yChYoamU1UmktytCmL6-ppqNNURIYJgsfXEKHbNXJiu66pnwGt3flC19i7X5ub2ywQws69omaIlB6LtGWL9_eyqIx4C5ruvFNZGv209jp5uigJV2uENAn
unzip REALSENSE.zip
#git clone https://github.com/IntelRealSense/librealsense.git
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

