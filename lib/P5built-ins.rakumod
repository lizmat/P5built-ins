my %export;
{
    use P5-X:ver<0.0.10>:auth<zef:lizmat>;
    use P5__FILE__:ver<0.0.6>:auth<zef:lizmat>;
    use P5caller:ver<0.0.13>:auth<zef:lizmat>;
    use P5chdir:ver<0.0.9>:auth<zef:lizmat>;
    use P5chomp:ver<0.0.9>:auth<zef:lizmat>;
    use P5chr:ver<0.0.9>:auth<zef:lizmat>;
    use P5defined:ver<0.0.7>:auth<zef:lizmat>;
    use P5each:ver<0.0.8>:auth<zef:lizmat>;
    use P5fc:ver<0.0.9>:auth<zef:lizmat>;
    use P5fileno:ver<0.0.6>:auth<zef:lizmat>;
    use P5getgrnam:ver<0.0.10>:auth<zef:lizmat>;
    use P5getnetbyname:ver<0.0.9>:auth<zef:lizmat>;
    use P5getpriority:ver<0.0.8>:auth<zef:lizmat>;
    use P5getprotobyname:ver<0.0.7>:auth<zef:lizmat>;
    use P5getpwnam:ver<0.0.11>:auth<zef:lizmat>;
    use P5getservbyname:ver<0.0.8>:auth<zef:lizmat>;
    use P5hex:ver<0.0.9>:auth<zef:lizmat>;
    use P5index:ver<0.0.7>:auth<zef:lizmat>;
    use P5lc:ver<0.0.10>:auth<zef:lizmat>;
    use P5lcfirst:ver<0.0.11>:auth<zef:lizmat>;
    use P5length:ver<0.0.8>:auth<zef:lizmat>;
    use P5localtime:ver<0.0.10>:auth<zef:lizmat>;
    use P5math:ver<0.0.6>:auth<zef:lizmat>;
    use P5opendir:ver<0.0.8>:auth<zef:lizmat>;
    use P5pack:ver<0.0.14>:auth<zef:lizmat>;
    use P5print:ver<0.0.7>:auth<zef:lizmat>;
    use P5push:ver<0.0.8>:auth<zef:lizmat>;
    use P5quotemeta:ver<0.0.7>:auth<zef:lizmat>;
    use P5readlink:ver<0.0.10>:auth<zef:lizmat>;
    use P5ref:ver<0.0.8>:auth<zef:lizmat>;
    use P5reset:ver<0.0.7>:auth<zef:lizmat>;
    use P5reverse:ver<0.0.9>:auth<zef:lizmat>;
    use P5seek:ver<0.0.5>:auth<zef:lizmat>;
    use P5shift:ver<0.0.8>:auth<zef:lizmat>;
    use P5sleep:ver<0.0.10>:auth<zef:lizmat>;
    use P5study:ver<0.0.6>:auth<zef:lizmat>;
    use P5substr:ver<0.0.7>:auth<zef:lizmat>;
    use P5tie:ver<0.0.14>:auth<zef:lizmat>;
    use P5times:ver<0.0.10>:auth<zef:lizmat>;
    use P5unlink:ver<0.0.1>:auth<zef:lizmat>;

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

Raku port of Perl's built-ins

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
  unlink unpack unshift untie

The following file test operators are also available:

  -r -w -x -e -f -d -s -z -l

And the following terms:

  __FILE__ __LINE__ __PACKAGE__ __SUB__ SEEK_CUR SEEK_END SEEK_SET
  STDERR STDIN STDOUT

=head1 PORTING CAVEATS

Please look at the porting caveats of the underlying modules that actually
provide the functionality:

  module           | built-in functions
  -----------------+-------------------
  P5caller         | caller
  P5chdir          | chdir
  P5chomp          | chomp chop
  P5chr            | chr ord
  P5defined        | defined undef
  P5each           | each
  P5fc             | fc
  P5fileno         | fileno
  P5getgrnam       | endgrent getgrent getgrgid getgrnam setgrent
  P5getnetbyname   | endnetent getnetbyname getnetbyaddr getnetent setnetent
  P5getpriority    | getpriority setpriority getppid getpgrp
  P5getprotobyname | endprotoent getprotobyname getprotobynumber getprotoent setprotoent
  P5getpwnam       | endpwent getlogin getpwent getpwnam getpwuid setpwent
  P5getservbyname  | endservent getservbyname getservbyport getservent setservent
  P5hex            | hex oct
  P5lc             | lc uc
  P5lcfirst        | lcfirst ucfirst
  P5length         | length
  P5localtime      | localtime gmtime
  P5math           | abs cos crypt exp int log rand sin sqrt
  P5opendir        | opendir readdir telldir seekdir rewinddir closedir
  P5pack           | pack unpack
  P5print          | print printf say
  P5push           | push pop
  P5readlink       | readlink
  P5ref            | ref
  P5reset          | reset
  P5reverse        | reverse
  P5study          | study
  P5tie            | tie, tied, untie
  P5times          | times
  P5unlink         | unlink
  P5-X             | -r -w -x -e -f -d -s -z -l

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

If you like this module, or what I’m doing more generally, committing to a
L<small sponsorship|https://github.com/sponsors/lizmat/>  would mean a great
deal to me!

Source can be located at: https://github.com/lizmat/P5built-ins . Comments and
Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2018, 2019, 2020, 2021, 2022, 2023 Elizabeth Mattijsen

Re-imagined from Perl as part of the CPAN Butterfly Plan.

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
