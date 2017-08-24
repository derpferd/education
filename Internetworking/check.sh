# Two arguments, experiment and project name
MYPATH=`pwd`
CPATH="$MYPATH/../common"
echo "Path $CPATH"
ARRAY=( NWrouter NWworkstation1 SWrouter SWworkstation1 ISrouter )
for node in ${ARRAY[*]} ; do
   echo "=========> $node"
   ssh -o stricthostkeychecking=no $node.$1.$2 "cd $CPATH; /usr/bin/perl check-files.pl /tmp/nicaddressing.dat "
done
