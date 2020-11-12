NAME
====

Raku port of Perl's built-ins

SYNOPSIS
========

    use P5built-ins;   # import all P5 built-in functions supported

    use P5built-ins <tie untie>;  # only import specific ones

    tie my @a, Foo;

DESCRIPTION
===========

This module provides an easy way to import a growing number of built-in functions of Perl in Raku Currently supported at:

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

PORTING CAVEATS
===============

Please look at the porting caveats of the underlying modules that actually provide the functionality:

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
    P5-X             | -r -w -x -e -f -d -s -z -l

AUTHOR
======

Elizabeth Mattijsen <liz@wenzperl.nl>

Source can be located at: https://github.com/lizmat/P5built-ins . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2018-2020 Elizabeth Mattijsen

Re-imagined from Perl as part of the CPAN Butterfly Plan.

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

