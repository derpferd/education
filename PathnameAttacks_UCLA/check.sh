# Two arguments, experiment and project name
CPATH=`pwd`
CPATH="$CPATH/../common"
echo "Path $CPATH"
echo "Checking installed programs"
ssh -o stricthostkeychecking=no server.$1.$2 "cd $CPATH; /usr/bin/perl check-installed.pl php apache2 mysql perl elinks links wget curl tcpdump"
echo "Checking files"
ssh -o stricthostkeychecking=no server.$1.$2 "cd $CPATH; /usr/bin/perl check-files.pl /home/wilbar /home/megaboz /home/barbazzo /home/gustar /root/memo /usr/lib/cgi-bin/memo.cgi /var/www/html/index.html /root/submit.sh /root/restore.sh"
echo "Checking processes"
ssh -o stricthostkeychecking=no server.$1.$2 "cd $CPATH; /usr/bin/perl check-processes.pl apache2"
echo "Checking cgi"
cmd="curl -s server.$1.$2/cgi-bin/memo.cgi"
perl ../common/check-output.pl "${cmd}" "^<html><head>"

