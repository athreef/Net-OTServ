use Test::More;

BEGIN {
    use_ok 'Net::OTServ';
}
use Data::Dumper;

my $status = Net::OTServ::status('mirage-server.no-ip.org', 7171);
ok keys %{ $status} > 0;
done_testing;


