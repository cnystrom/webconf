#!/usr/local/bin/perl
#
# mail2conf.pl -- deposit mail into a conference directory
#
# You can use this to bypass the news system if you do not want to
# use a newsgroup.
#

$NEWSSPOOL = "/usr/spool/news/cfi";
$NEWSGROUP = $ARGV[0];
$DIR = "$NEWSSPOOL/$NEWSGROUP";

sub bynumber { $a <=> $b; }

chdir $DIR;
opendir(D,'.');
@FILES = sort bynumber grep(-T, readdir(D));
closedir(D);

$LAST = @FILES[$#FILES];

$FILENAME = $LAST + 1;

open(FILE, "> $FILENAME");

while (<STDIN>) {
  print FILE "$_";
}

close(FILE);


