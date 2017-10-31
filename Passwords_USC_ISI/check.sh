# Two arguments, experiment and project name
CPATH=`pwd`
CPATH="$CPATH/../common"
echo "Path $CPATH"
ssh -o stricthostkeychecking=no server.$1.$2 "cd $CPATH; /usr/bin/perl check-installed.pl john"
ssh -o stricthostkeychecking=no attacker.$1.$2 "cd $CPATH; /usr/bin/perl check-files.pl /var/passwords"
