use Test::More;
use Carp;

BEGIN {
    use_ok 'Net::OTServ';
}
my $addr = 'medivia.org';

# Server has been online since 2011, so it should do as a testcase
my $status;
eval {
    $status = Net::OTServ::status $addr;
};
SKIP: {
    $@ =~ /offline/ and plan skip_all => "Error connecting to $addr";
    $@ and die $@;

    is $status->{owner}{name}, "Iryont";
    is $status->{owner}{name}, "Iryont";
    is $status->{serverinfo}{servername}, "Medivia";
    is $status->{serverinfo}{server}, "Medivia";
    is $status->{serverinfo}{url}, "medivia.org";
}

done_testing;
