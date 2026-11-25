#!/usr/local/bin/perl
#
# message.pl -- crude www message display script
#

$NEWSSPOOL = "/usr/spool/news/cfi";
$NEWSGROUP = $ARGV[0];
$MESSAGE = $ARGV[1];
$FIRST = $ARGV[2];
$LAST = $ARGV[3];
$DIR = "$NEWSSPOOL/$NEWSGROUP";

$NEXT = $MESSAGE + 1;

if ($NEXT > $LAST) {
  $NEXT = $LAST;
}

$PREV = $MESSAGE - 1;

if ($PREV < $FIRST) {
  $PREV = $FIRST;
}

sub bynumber { $a <=> $b; }

print "Content-type: text/html\n\n";

print "<HTML>\n";
print "<BODY BGCOLOR=#ffffff>\n";
print "<HEAD>\n";
print "<TITLE>CFI Forum: $NEWSGROUP</TITLE>\n";
print "<H1>\n";
print "<IMG SRC=\"/images/CFIsmall.gif\">\n";
print "Forum: $NEWSGROUP - #$MESSAGE</H1>\n";
print "<HR>\n";
print "<CENTER>\n";
print "| <A HREF=\"/cgi-bin/conference.pl?$NEWSGROUP\">Index</A> ";
print "| <A HREF=\"mailto:$NEWSGROUP@example.com\">Post</A> ";
print "| <A HREF=\"/cgi-bin/message.pl?$NEWSGROUP+$NEXT+$FIRST+$LAST\">Next</A> ";
print "| <A HREF=\"/cgi-bin/message.pl?$NEWSGROUP+$PREV+$FIRST+$LAST\">Prev</A> ";
print "| <A HREF=\"/cgi-bin/message.pl?$NEWSGROUP+$FIRST+$FIRST+$LAST\">First</A> ";
print "| <A HREF=\"/cgi-bin/message.pl?$NEWSGROUP+$LAST+$FIRST+$LAST\">Last</A> ";
print "| <A HREF=\"/index.html\">CFI</A> ";
print "|";
print "</CENTER>\n";
print "<HR>\n";

if ($MESSAGE == $FIRST) {
  print "<CENTER>\n";
  print "<B>\n";
  print "FIRST MESSAGE\n";
  print "</B>\n";
  print "</CENTER>\n";
  print "<HR>\n";
}

if ($MESSAGE == $LAST) {
  print "<CENTER>\n";
  print "<B>\n";
  print "LAST MESSAGE\n";
  print "</B>\n";
  print "</CENTER>\n";
  print "<HR>\n";
}

print "<BR>\n";
print "</HEAD>\n";

print "<BODY>\n";
print "<CODE>\n";

chdir $DIR;

$FILENAME = $MESSAGE;
open(FILE,$FILENAME);
while (<FILE>) {
  chop;
  print "$_<BR>\n";
}
close(FILE);

print "</CODE>\n";

if ($MESSAGE == $FIRST) {
  print "<HR>\n";
  print "<CENTER>\n";
  print "<B>\n";
  print "FIRST MESSAGE\n";
  print "</B>\n";
  print "</CENTER>\n";
}

if ($MESSAGE == $LAST) {
  print "<HR>\n";
  print "<CENTER>\n";
  print "<B>\n";
  print "LAST MESSAGE\n";
  print "</B>\n";
  print "</CENTER>\n";
}

print "<HR>\n";
print "<CENTER>\n";
print "| <A HREF=\"/forums.html\">Top</A> ";
print "| <A HREF=\"/cgi-bin/conference.pl?$NEWSGROUP\">Index</A> ";
print "| <A HREF=\"mailto:$NEWSGROUP@example.com\">Post</A> ";
print "| <A HREF=\"/cgi-bin/message.pl?$NEWSGROUP+$NEXT+$FIRST+$LAST\">Next</A> ";
print "| <A HREF=\"/cgi-bin/message.pl?$NEWSGROUP+$PREV+$FIRST+$LAST\">Prev</A> ";
print "| <A HREF=\"/cgi-bin/message.pl?$NEWSGROUP+$FIRST+$FIRST+$LAST\">First</A> ";
print "| <A HREF=\"/cgi-bin/message.pl?$NEWSGROUP+$LAST+$FIRST+$LAST\">Last</A> ";
print "| <A HREF=\"/index.html\">CFI</A> ";
print "|";
print "</CENTER>\n";

print "</BODY>\n";
print "<HR>\n";
print "<ADDRESS>\n";
print "For more information contact: \n";
print "<A HREF=\"mailto:webmaster@example.com\">webmaster@example.com</A>";
print "</ADDRESS>\n";
print "</HTML>\n";

