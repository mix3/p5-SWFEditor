use t::Utils;
use Test::More;
use SWFEditor;

my $expect = get_file_contents('/swf/bitmap103.swf');

{
    my $d1    = get_file_contents('/resource/colorformat.swf');
    my $d2    = get_file_contents('/resource/5.jpg');
    my $swfed = SWFEditor->new();
    $swfed->input(\$d1);
    my $result = $swfed->replace_bitmap_data({width => 100, blue => 255}, \$d2);
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        ''
    );
}

{
    my $d1    = get_file_path('/resource/colorformat.swf');
    my $d2    = get_file_path('/resource/5.jpg');
    my $swfed = SWFEditor->new();
    $swfed->input($d1);
    my $result = $swfed->replace_bitmap_data({width => 100, blue => 255}, $d2);
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        ''
    );
}

done_testing();
