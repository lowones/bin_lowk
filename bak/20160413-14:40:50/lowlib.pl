sub get_timestamp
{
	use Time::localtime;
	my $time = localtime;
	my $timestamp = sprintf("%04d-%02d-%02d-%02d:%02d:%02d",  $time->year+1900, ($time->mon)+1, $time->mday, $time->hour, $time->min, $time->sec);
	return $timestamp;
}	#	END get_timestamp
#
sub read_file
{
        my $filename = shift;
#        open(FILE, "<$filename") or warn "Can't open $filename: $!\n";
        open(FILE, "<$filename") or die "Can't open $filename: $!\n";
        chomp(my @file = <FILE>);
        close(FILE);
        return @file;
}       #       END read_file
#
sub trim
{
	my @out = @_;
	for (@out)
	{
		s/^\s+//;	# trim left
		s/\s+$//;	# trim right
	}	#	END for @out
	return @out == 1
		? $out[0]	# only one to return
		: @out;		# or many
}	#	END trim
#
sub valid_characters
{
}	#	END valid_characters
#
sub check_name
{
        my $name = shift(@_);
        ${$name} = trim(${$name});
        if ( ${$name} =~ m/^(\w+)$/ )
        {
                ${$name} = $1;
        }
        else
        {
                die "Invalid hostname discovered: ${$name}\n";
        }
}       #       END check_name
#
sub valid_name
{
        my $name = shift(@_);
        ${$name} = trim(${$name});
        if ( ${$name} =~ m/^(\w+)$/ )
        {
                ${$name} = $1;
        }
        else
        {
	return;		# return failure
        }
}       #       END valid_name
#
sub valid_abs_file
{
	my $path = shift(@_);
	${$path} = trim(${$path});
	if ( ${$path} =~ m/^(\/\w[-\w]*(?:\/\w[-\w]*)*)$/ )
	{
		${$path} = $1;
	}
	else
	{
		return;		# returns failure undef or ()
	}
}
#
sub valid_id
{
	my $id = shift(@_);
	${$id} = trim(${$id});
	if ( ${$id} =~ m/^(\d+)$/ )
	{
		${$path} = $1;
	}
	else
	{
		return;		# return failure
	}
}	#	END valid_id
#
sub print_array
{
        my @array = @_;
        foreach my $line (@array)
        {
                chomp($line);
                print "$line\n";
        }       #       END @array
}       #       END print_array
#
1;
