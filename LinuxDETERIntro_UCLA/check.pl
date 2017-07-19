@files=("/usr/share/pixmaps/*INTRO*","/dev/*intro*", "/var/log/*intro*", "/etc/*intro*", "/.hidden/*Intro*");
$failed = 0;
for $file (@files)
{
    open(FE,"perl file_exists.pl $file |") || die "Failed: $!\n";
    while ( <FE> )
    {
	if ($_ =~ /does not/)
	{
	    print "$file does not exist\n";
	    $failed = 1;
	}
    }
}
if (!$failed)
{
    print "All tests passed!\n";
}

sub file_exists
{
    $file=shift;
    if (-e $file)
    {
	print "Found $file\n";
	return 1;
    }
    else
    {
	print "not found $file\n";
	return 0;
    }
}
