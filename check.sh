# Two arguments, experiment and project name
ssh -o stricthostkeychecking=no intro.$1.$2 "/usr/bin/perl /share/education/LinuxDETERIntro_UCLA/check.pl"
