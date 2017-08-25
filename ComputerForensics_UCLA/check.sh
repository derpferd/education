# Two arguments, experiment and project name
MYPATH=`pwd`
CPATH="$MYPATH/../common"
echo "Path $CPATH"
echo "Checking installed programs"
ssh -o stricthostkeychecking=no workbench.$1.$2 "cd $CPATH; /usr/bin/perl check-installed.pl hexedit john"
echo "Checking files"
ssh -o stricthostkeychecking=no workbench.$1.$2 "cd $CPATH; /usr/bin/perl check-files.pl /usr/bin/e2undel /images/* /usr/bin/zonk"
