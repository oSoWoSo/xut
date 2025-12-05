Test xut
============================================

Test help command

$ xut -h
(~>) Info:  Using the default configuration.
xut 0.4.1-dev
Usage: xut [options]
*x*tra *u*ser *t*emplates
Build and install packages for Void Linux, from the abyss-packages unofficial repo
OPTIONS
 -s                      Sync the repos.
 -l                      Keep a log file under /home/runner/.xut/logs.
 -h                      Display this usage information.
 -b <package1,package2>  Build a list of (comma-separated) packages.
 -i <package1,package2>  Build and install a list of (comma-seperated) packages.
 -x                      Give xbps-src commands.
 -q <query>              Search for <query> in available templates.
 -u                      Update packages.
 The options are given together. For example in order to sync,
 enable logging and install <package> the cli command is
 <xut -sli package>.

$

All OK?
> Note: test with `clitest --prefix tab tests/help.md`
