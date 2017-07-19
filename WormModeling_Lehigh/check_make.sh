cd ~/paws; make; rm log*
./slammer &
sleep 300
./stop_paws
ls
cd /users/sunshine/education/wormmodel; /usr/bin/perl check_make.pl
