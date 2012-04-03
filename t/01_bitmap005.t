use t::Utils;
use Test::More;
use SWFEditor;

my $expect = get_file_contents('/swf/bitmap005.swf');

{
    my $d1    = get_file_contents('/resource/colorformat_trans.swf');
    my $d2    = get_file_contents('/resource/negimiku001.png');
    my $swfed = SWFEditor->new();
    $swfed->input(\$d1);
    $swfed->replace_bitmap_data({ red => 0, green => 0, blud => 0 }, \$d2);
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        ''
    );
}

{
    my $d1    = get_file_path('/resource/colorformat_trans.swf');
    my $d2    = get_file_path('/resource/negimiku001.png');
    my $swfed = SWFEditor->new();
    $swfed->input($d1);
    $swfed->replace_bitmap_data({ red => 0, green => 0, blud => 0 }, $d2);
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        ''
    );
}

done_testing();
