sudo apt-get purge nvidia* &&\
sudo apt-get autoremove &&\
sudo apt-get autoclean &&\
sudo rm -rf /usr/local/cuda* &&\
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub &&\
echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list &&\
