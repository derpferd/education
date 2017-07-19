@files=("/users/sunshine/paws/log1.dat","/users/sunshine/paws/log2.dat","/users/sunshine/paws/log3.dat","/users/sunshine/paws/log4.dat","/users/sunshine/paws/log5.dat","/users/sunshine/paws/log6.dat","/users/sunshine/paws/log7.dat","/users/sunshine/paws/log8.dat");
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
