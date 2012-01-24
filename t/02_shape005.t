use t::Utils;
use Test::More;
use SWFEditor::Simple;

my $d1     = get_file_path('/resource/negimiku.swf');
my $expect = get_file_contents('/swf/shape005.swf');

my $swfed = SWFEditor::Simple->new();
{
    $swfed->input($d1);
    $swfed->apply_shape_rect_factor(6, 0.5, 0.5, 1, 1);
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        ''
    );
}

done_testing();
