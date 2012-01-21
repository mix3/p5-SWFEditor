package t::Utils;

use strict;
use warnings;
use utf8;
use lib './t/lib';
use FindBin;
use Test::More;

sub import {
    my $caller = caller;
    {
        no strict 'refs';
        no warnings 'redefine';
        *{ $caller.'::get_file_contents' } = \&get_file_contents;
        *{ $caller.'::get_file_path' } = \&get_file_path;
    }
    strict->import;
    warnings->import;
    utf8->import;
}

sub get_file_contents {
    my $filepath = $FindBin::Bin.'/'.shift;
    my $bytes = '';
    my $fh;
    open $fh, $filepath or die "$!: $filepath";
    binmode($fh);
    while (<$fh>) {
        $bytes .= $_;
    }
    close $fh;
    return $bytes;
}

sub get_file_path {
    return $FindBin::Bin.'/'.shift;
}

1;
