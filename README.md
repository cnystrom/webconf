# Archived (2026)

This is Chris Nystrom's 1996 web conference software, kept as history
and no longer maintained.

**Do not run this on a live server.** `message.pl` lines 75-76 opens a
file named in the web address, so a visitor can read files or run
commands. `conference.pl` line 49 has a syntax error (`push(HEADERS`
should be `push(@HEADERS`), so it will not run as is.

# WebConf

Web Conference is a collection of Bourne and Perl scripts that act as a
Web interface to Usenet news and mailing lists.

That description is the wording from Chris Nystrom's old programs page.
The original README says the scripts create a conferencing system for the
web by creating an interface to Usenet news, or simulating a news system
if none exists.

## Origin

From Chris Nystrom's old programs page (originally on cactus.org).
The download on that page was the shell archive `webconf.01`.

https://nystrom.family/chris/old/programs.html
https://nystrom.family/chris/old/webconf.01
All of Chris's code: https://nystrom.family/chris/code/

`archive.sh` is dated Oct 1996.

## License

No license stated in the original.

This work is dedicated to the public domain under the Unlicense; see LICENSE.

## Third-party file removed

`mail2news.sh` was in the original archive. Chris's own README says it
"Pipes e-mail into a newsgroup (not original with me)". The file header
identifies it as the 1988 `distribute` script (`$Header: distribute,v 1.18
88/09/18 22:26:23 lamy Exp $`). It was omitted here.

The remaining files are Chris's conference index and message scripts,
`mail2conf.pl`, `archive.sh`, the README, and TODO.
