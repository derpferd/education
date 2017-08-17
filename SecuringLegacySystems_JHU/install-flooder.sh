#!/bin/bash
sudo apt-get install flex libnet1 libnet1-dev libpcap-dev -y
sudo cp -r /share/education/SecuringLegacySystems_JHU/flooder /usr/local/src
cd /usr/local/src/flooder; sudo make; sudo cp flooder /bin

