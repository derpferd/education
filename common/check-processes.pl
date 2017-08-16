$failed = 1;
for $proc (@ARGV)
{
    print "Checking for $proc\n";
    open(FE,"ps axuw | grep $proc |") || die "Failed: $!\n";
    while ( <FE> )
    {
	if ($_ =~ /$proc/)
	{
	    $failed = 0;
	}
    }
}
if (!$failed)
{
    print "All tests passed!\n";
}
