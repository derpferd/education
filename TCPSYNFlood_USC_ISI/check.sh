# Two arguments, experiment and project name
echo "Attacker"
ssh -o stricthostkeychecking=no attacker.$1.$2 "cd /users/sunshine/education/tcpsyn; /usr/bin/perl checkattacker.pl; rm /tmp/index.html; wget server -o /tmp/index.html"
echo "Server"
ssh -o stricthostkeychecking=no attacker.$1.$2 "cd /users/sunshine/education/tcpsyn; /usr/bin/perl checkserver.pl"
