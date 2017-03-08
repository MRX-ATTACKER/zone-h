#!/usr/bin/perl
use IO::Socket::INET ;
use Term::ANSIColor;
if ($^O =~ /MSWin32/) {system("cls");} else { system("clear"); }
print color 'reset';
print color("bold green"), "              Zone-h Submitter\n";
print color("bold white"), "              SeCureSec.top\n";
print color("bold red"), "             Type Name Of File : " ;
print color 'reset';
$file = <STDIN> ;
chomp ($file) ;
open(ZONE,"<$file") ;
@site = <ZONE> ;
close(ZONE);
print color("bold red"), "Type Your NickName : " ;
print color 'reset';
$name = <STDIN> ;
chomp ($name) ;
if ($^O =~ /MSWin32/) {system("cls");} else { system("clear"); }
print color("bold yellow"), "Starting ..." ;
print color 'reset';
$counter = scalar(@site) ;
for ($i = 0 , $i <= $counter , $i++){
print color("bold yellow"), "Submit -> $site[$i]" ;
print color 'reset';
$socket = IO::Socket::INET->new(PeerAddr => "www.zone-h.org", PeerPort => 80, Proto => "tcp") or next ;
print $socket "POST /notify/single HTTP/1.0\r\n" ;
print $socket "Accept: */*\r\n" ;
print $socket "Referer: http://www.zone-h.org/notify/single\r\n" ;
print $socket "Accept-Language: pt-br\r\n" ;
print $socket "Content-Type: application/x-www-form-urlencoded\r\n" ;
print $socket "Connection: Keep-Alive\r\n" ;
print $socket "User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)\r\n" ;
print $socket "Host: www.zone-h.org\r\n" ;
$length = length("defacer=$name&domain1=http%3A%2F% 2F$site[$i]&hackmode=17&reason=1") ;
print $socket "Content-Length: $length\r\n" ;
print $socket "Pragma: no-cache\r\n" ;
print $socket "\r\n" ;
print $socket "defacer=$name&domain1=http%3A%2F%2F$site[$i]&hackmode=17&reason=1\r\n" ;
close($socket) ;
}
