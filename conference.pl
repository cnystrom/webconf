#!/usr/local/bin/perl
#
# conference.pl -- crude www conferencing software
#

$NEWSSPOOL = "/usr/spool/news/cfi";
$NEWSGROUP = $ARGV[0];
$DIR = "$NEWSSPOOL/$NEWSGROUP";

sub bynumber { $a <=> $b; }

print "Content-type: text/html\n\n";

print "<HTML>\n";
print "<BODY BGCOLOR=#ffffff>\n";
print "<HEAD>\n";
print "<TITLE>CFI Forum: $NEWSGROUP</TITLE>\n";
print "<H1>\n";
print "<IMG SRC=\"/images/CFIsmall.gif\">\n";
print "Forum: $NEWSGROUP</H1>\n";
print "<HR>\n";
print "</HEAD>\n";
print "<BODY>\n";
print "<TABLE WIDTH=500>\n";
print "<TBODY>\n";
print "<TR>\n";
print "<TD COLSPAN=1 WIDTH=50>Number\n";
print "<TD COLSPAN=1 WIDTH=225>Subject\n";
print "<TD COLSPAN=1 WIDTH=225>From\n";
print "</TR>\n";

chdir $DIR;
opendir(D,'.');
@FILES = sort bynumber grep(-T, readdir(D));
closedir(D);

$FIRST = @FILES[0];
$LAST = @FILES[$#FILES];

for (@FILES) {

  $TOTAL = $TOTAL + 1;

  $FILENAME = $_;
  open(FILE,$FILENAME);
  while (<FILE>) {
    chop;
    if (1 .. /^$/ ) {
      push(HEADERS,$_);
    }
  }
  close(FILE);

  foreach $ITEM (@HEADERS) {
    if ($ITEM =~ /^From:/) {($TEMP,$ADDRESS) = split(/:/,$ITEM,2);}
    if ($ITEM =~ /^Reply-To:/){($TEMP,$REPLY_ADDRESS) = 
				     split(/:/,$ITEM,2);}
    if ($iTEM =~ /From /) {($TEMP,$FAUX_FROM_ADDRESS, $TEMP2) =
				 split(/\s/,$ITEM,3);}
    if ($ITEM =~ /Subject:/) {($TEMP,$SUBJECT) = split(/:/,$ITEM,2);}
  }

  if (! $SUBJECT) {
    $SUBJECT = "None";
  }

  if (! $ADDRESS) {
    $ADDRESS = $REPLY_ADDRESS;
  }

  if (! $ADDRESS) {
    $ADDRESS = $FAUX_FROM_ADDRESS;
  }

  if (! $ADDRESS) {
    $ADDRESS = "Unknown";
  }

  print "<TR>\n";
  print "<TD COLSPAN=1 WIDTH=50>";
  print "<A HREF=\"/cgi-bin/message.pl?$NEWSGROUP+$FILENAME+$FIRST+$LAST\">$FILENAME</A>\n";
  print "<TD COLSPAN=1 WIDTH=225>";
  print "<A HREF=\"/cgi-bin/message.pl?$NEWSGROUP+$FILENAME+$FIRST+$LAST\">$SUBJECT</A>\n";
  print "<TD COLSPAN=1 WIDTH=225>";
  print "<A HREF=\"mailto: $ADDRESS\">$ADDRESS</A>\n";
  print "</TR>\n";
}

print "</TBODY>\n";
print "</TABLE>\n";

print "</BODY>\n";
print "<HR>\n";
print "<ADDRESS>\n";
print "For more information contact: \n";
print "<A HREF=\"mailto:webmaster@example.com\">webmaster@example.com</A>";
print "</ADDRESS>\n";
print "</HTML>\n";

