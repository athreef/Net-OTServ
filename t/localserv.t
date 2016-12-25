use Test::More skip_all => "Don't know how to use Test::TCP yet";
use Test::TCP;

BEGIN {
    use_ok 'Net::OTServ';
}

my $port;
my $server = Test::TCP->new(
    listen => 1,
    auto_start => 1,
    code => sub {
        my $sock = shift;
        my $req; $sock->recv($req, 9);
        if ($req eq "\x06\x00\xFF\xFF\x69\x6E\x66\x6F") {
        my $xml = qq{
                    <?xml version="1.0"?>
                    <tsqp version="1.0">
                        <serverinfo uptime="25221" ip="127.0.0.1" servername="Test::TCP" port="$port" location="$0" url="127.0.0.1" server="Test::TCP" version="7.4" client="7.4"/>
                        <owner name="a3f" email=""/>
                        <players online="400" max="2500" peak="2500"/>
                        <map name="map" author="a3f" width="10" height="10"/>
                        <motd>Welcome to TCP::Test</motd>
                    </tsqp>
        };
        }

    },
);
$port = $server->port;
my $status = Net::OTServ::status '127.0.0.1', $port;
ok keys %{ $status} > 0;

done_testing;
