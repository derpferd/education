cp -r /share/education/common/snoopy /usr/local/src/snoopy
cd /usr/local/src/snoopy
sudo ./configure
sudo make
sudo make install
sudo make enable
sudo perl /usr/local/src/snoopy/start.pl
sudo reboot
