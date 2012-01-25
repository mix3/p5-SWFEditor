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
    open my $fh, $filepath or die "$!: $filepath";
    my $data = do { local $/; <$fh> };
    close $fh;
    return $data;
}

sub get_file_path {
    return $FindBin::Bin.'/'.shift;
}

1;
