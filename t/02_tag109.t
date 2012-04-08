use t::Utils;
use Test::More;
use SWFEditor;

note('print_tag_data(): test');

my $expect = <<"EXPECT";
tag=SetBackgroundColor(9)  length=3
EXPECT

tests {
    SKIP: {
        eval {
            require Capture::Tiny;
            Capture::Tiny->import(qw/capture/);
        };
        skip 'Capture::Tiny not installed', 2 if ($@);
        my $d1    = get_file_contents('/tag/textvar.tag.0');
        my $swfed = SWFEditor->new();
        my $got = capture {
            $swfed->print_tag_data(\$d1);
        };
        is($got, $expect, '');
    }
};

tests {
    SKIP: {
        eval {
            require Capture::Tiny;
            Capture::Tiny->import(qw/capture/);
        };
        skip 'Capture::Tiny not installed', 2 if ($@);
        my $d1    = get_file_path('/tag/textvar.tag.0');
        my $swfed = SWFEditor->new();
        my $got = capture {
            $swfed->print_tag_data($d1);
        };
        is($got, $expect, '');
    }
};

done_testing();
