use t::Utils;
use Test::More;
use SWFEditor;

my $d1     = get_file_contents('/resource/saitama.swf');
my $d2     = get_file_contents('/resource/negimiku001.png');
my $expect = get_file_contents('/swf/png002.swf');

my $swfed = SWFEditor->new();
$swfed->set_shape_adjust_mode_rect_resize();
{
    $swfed->input($d1);
    my $image_id = 1;
    $swfed->replace_png_data($image_id, $d2);
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        'pnt001.phpt'
    );
}

done_testing();
