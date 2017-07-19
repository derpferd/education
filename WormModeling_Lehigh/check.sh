# Two arguments, experiment and project name
ARRAY=( node-0 node-1 node-2 node-3 node-4 node-5 node-6 node-7 node-8 )
for node in ${ARRAY[*]} ; do
   echo $node
   ssh -o stricthostkeychecking=no $node.$1.$2 "cd /users/sunshine/education/wormmodel; /usr/bin/perl check.pl"
done
ssh -o stricthostkeychecking=no node-0.$1.$2 "cd /users/sunshine/education/wormmodel; bash check_make.sh"
