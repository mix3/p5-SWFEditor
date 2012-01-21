use t::Utils;
use Test::More;
use SWFEditor;

my $d1     = get_file_contents('/resource/colorformat.swf');
my $d2     = get_file_contents('/resource/inasahama.gif');
my $expect = get_file_contents('/swf/bitmap002.swf');

my $swfed = SWFEditor->new();
{
    $swfed->input($d1);
    $swfed->replace_bitmap_data(1, $d2);
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        ''
    );
}

done_testing();
