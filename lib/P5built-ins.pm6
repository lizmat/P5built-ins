use v6.c;

my %export;
module P5built-ins:ver<0.0.23>:auth<cpan:ELIZABETH> {
    use P5__FILE__:ver<0.0.3>:auth<cpan:ELIZABETH>;
    use P5caller:ver<0.0.7>:auth<cpan:ELIZABETH>;
    use P5chdir:ver<0.0.6>:auth<cpan:ELIZABETH>;
    use P5chomp:ver<0.0.6>:auth<cpan:ELIZABETH>;
    use P5chr:ver<0.0.6>:auth<cpan:ELIZABETH>;
    use P5defined:ver<0.0.3>:auth<cpan:ELIZABETH>;
    use P5each:ver<0.0.6>:auth<cpan:ELIZABETH>;
    use P5fc:ver<0.0.6>:auth<cpan:ELIZABETH>;
    use P5fileno:ver<0.0.4>:auth<cpan:ELIZABETH>;
    use P5getgrnam:ver<0.0.7>:auth<cpan:ELIZABETH>;
    use P5getnetbyname:ver<0.0.5>:auth<cpan:ELIZABETH>;
    use P5getpriority:ver<0.0.6>:auth<cpan:ELIZABETH>;
    use P5getprotobyname:ver<0.0.4>:auth<cpan:ELIZABETH>;
    use P5getpwnam:ver<0.0.6>:auth<cpan:ELIZABETH>;
    use P5getservbyname:ver<0.0.5>:auth<cpan:ELIZABETH>;
    use P5hex:ver<0.0.6>:auth<cpan:ELIZABETH>;
    use P5index:ver<0.0.5>:auth<cpan:ELIZABETH>;
    use P5lc:ver<0.0.7>:auth<cpan:ELIZABETH>;
    use P5lcfirst:ver<0.0.8>:auth<cpan:ELIZABETH>;
    use P5length:ver<0.0.5>:auth<cpan:ELIZABETH>;
    use P5localtime:ver<0.0.7>:auth<cpan:ELIZABETH>;
    use P5math:ver<0.0.3>:auth<cpan:ELIZABETH>;
    use P5opendir:ver<0.0.5>:auth<cpan:ELIZABETH>;
    use P5pack:ver<0.0.9>:auth<cpan:ELIZABETH>;
    use P5print:ver<0.0.4>:auth<cpan:ELIZABETH>;
    use P5push:ver<0.0.5>:auth<cpan:ELIZABETH>;
    use P5quotemeta:ver<0.0.4>:auth<cpan:ELIZABETH>;
    use P5readlink:ver<0.0.7>:auth<cpan:ELIZABETH>;
    use P5ref:ver<0.0.5>:auth<cpan:ELIZABETH>;
    use P5reset:ver<0.0.4>:auth<cpan:ELIZABETH>;
    use P5reverse:ver<0.0.6>:auth<cpan:ELIZABETH>;
    use P5seek:ver<0.0.3>:auth<cpan:ELIZABETH>;
    use P5shift:ver<0.0.5>:auth<cpan:ELIZABETH>;
    use P5sleep:ver<0.0.8>:auth<cpan:ELIZABETH>;
    use P5study:ver<0.0.4>:auth<cpan:ELIZABETH>;
    use P5substr:ver<0.0.5>:auth<cpan:ELIZABETH>;
    use P5tie:ver<0.0.12>:auth<cpan:ELIZABETH>;
    use P5times:ver<0.0.7>:auth<cpan:ELIZABETH>;
    use P5-X:ver<0.0.6>:auth<cpan:ELIZABETH>;

    # there must be a better way to do this, but this will work for now
    %export = MY::.keys.grep( *.starts-with('&') ).map: { $_ => ::($_) };
}

multi sub EXPORT() { %export }
multi sub EXPORT(*@args) {
    my $imports := Map.new( |(%export{ @args.map: '&' ~ * }:p) );
    if $imports != @args {
        die "P5built-ins doesn't know how to export: "
          ~ @args.grep( { !$imports{$_} } ).join(', ')
    }
    $imports
}

=begin pod

=head1 NAME

P5built-ins - Implement Perl's built-in functions

=head1 SYNOPSIS

  use P5built-ins;   # import all P5 built-in functions supported

  use P5built-ins <tie untie>;  # only import specific ones

  tie my @a, Foo;

=head1 DESCRIPTION

This module provides an easy way to import a growing number of built-in
functions of Perl in Raku  Currently supported at:

  abs caller chdir chomp chop chr closedir cos crypt defined each endgrent
  endnetent endprotoent endpwent endservent exp fc fileno getgrent getgrgid
  getgrnam getlogin getnetbyaddr getnetbyname getnetent getpgrp getppid
  getpriority getprotobyname getprotobynumber getprotoent getpwent getpwnam
  getpwuid getservbyname getservbyport getservent gmtime hex index int lc
  lcfirst length localtime log oct opendir ord pack pop print printf push
  quotemeta rand readdir readlink ref reset reverse rewinddir rindex say
  seek seekdir setgrent setnetent setpriority setprotoent setpwent setservent
  shift sin sleep sqrt study substr telldir tie tied times uc ucfirst undef
  unpack unshift untie

The following file test operators are also available:

  -r -w -x -e -f -d -s -z -l

And the following terms:

  __FILE__ __LINE__ __PACKAGE__ __SUB__ SEEK_CUR SEEK_END SEEK_SET
  STDERR STDIN STDOUT

=head1 PORTING CAVEATS

Please look at the porting caveats of the underlying modules that actually
provide the functionality:

  module        | built-in functions
  --------------+-------------------
  P5caller      | caller
  P5chdir       | chdir
  P5defined     | defined undef
  P5each        | each
  P5fileno      | fileno
  P5getpriority | getpriority setpriority getppid getpgrp
  P5length      | length
  P5localtime   | localtime gmtime
  P5math        | abs cos crypt exp int log rand sin sqrt
  P5opendir     | opendir readdir telldir seekdir rewinddir closedir
  P5pack        | pack unpack
  P5print       | print printf say
  P5readlink    | readlink
  P5ref         | ref
  P5reset       | reset
  P5reverse     | reverse
  P5study       | study
  P5tie         | tie, tied, untie
  P5times       | times
  P5-X          | -r -w -x -e -f -d -s -z -l

=head1 AUTHOR

Elizabeth Mattijsen <liz@wenzperl.nl>

Source can be located at: https://github.com/lizmat/P5built-ins . Comments and
Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2018-2019 Elizabeth Mattijsen

Re-imagined from Perl as part of the CPAN Butterfly Plan.

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: ft=perl6 expandtab sw=4
