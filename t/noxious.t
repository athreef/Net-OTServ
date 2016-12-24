use Test::More;

BEGIN {
    use_ok 'Net::OTServ';
}

my $status = Net::OTServ::status('noxiousot.com');

like $status->{serverinfo}{servername}, qr/noxious/i;

done_testing;

