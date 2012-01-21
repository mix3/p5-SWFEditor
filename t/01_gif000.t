use t::Utils;
use Test::More;
use SWFEditor;

my $d1     = get_file_contents('/resource/saitama.swf');
my $d2     = get_file_contents('/resource/inasahama.gif');
my $expect = get_file_contents('/swf/gif001.swf');

my $swfed = SWFEditor->new();
{
    $swfed->set_shape_adjust_mode_type_tilled();
    $swfed->input($d1);
    my $image_id = 1;
    $swfed->replace_gif_data($image_id, $d2);
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        'gif000.phpt'
    );
}

done_testing();
