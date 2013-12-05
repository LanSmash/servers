#!/usr/bin/perl

#zone "doubleclick.net" in { type master ; file "/etc/bind/db.blocked" ; } ;

open (FILE, "$ARGV[0]");
while (<FILE>) {
  chomp;
  print "zone \"$_\" in { type master ; file \"/etc/bind/db.blocked\" ; } ;\n";
}
close (FILE);
exit;

