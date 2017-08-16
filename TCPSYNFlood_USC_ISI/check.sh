# Two arguments, experiment and project name
CPATH=`pwd`
CPATH="$CPATH/../common"
echo "Path $CPATH"
ssh -o stricthostkeychecking=no server.$1.$2 "sudo bash /share/education/TCPSYNFlood_USC_ISI/install-server"
ssh -o stricthostkeychecking=no attacker.$1.$2 "sudo bash /share/education/TCPSYNFlood_USC_ISI/install-flooder"
ssh -o stricthostkeychecking=no attacker.$1.$2 "cd $CPATH; /usr/bin/perl check-files.pl /bin/flooder; rm /tmp/index.html; wget server -o /tmp/index.html; /usr/bin/perl check-files.pl /tmp/index.html"
