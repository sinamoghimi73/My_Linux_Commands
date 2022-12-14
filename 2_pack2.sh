#!/bin/bash
cd /home/aida/Downloads
wget https://developer.download.nvidia.com/compute/cuda/11.4.1/local_installers/cuda_11.4.1_470.57.02_linux.run
sudo sh cuda_11.4.1_470.57.02_linux.run

echo '/usr/local/cuda/lib64' >> /etc/ld.so.conf
sudo ldconfig
echo 'export CUDA_HOME=/usr/local/cuda' >> /home/aida/.bashrc
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64' >> /home/aida/.bashrc
echo 'export PATH=$PATH:$CUDA_HOME/bin' >> /home/aida/.bashrc
reboot


