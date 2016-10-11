use Test::More;

BEGIN {
    use_ok 'Net::OTServ';
}

# Server has been online since 2011, so it should do as a testcase
my $status = Net::OTServ::status('medivia.org');

is $status->{owner}{name}, "Iryont";
is $status->{owner}{name}, "Iryont";
is $status->{serverinfo}{servername}, "Medivia";
is $status->{serverinfo}{server}, "Medivia";
is $status->{serverinfo}{url}, "medivia.org";

done_testing;
