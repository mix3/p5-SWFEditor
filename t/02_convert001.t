use t::Utils;
use Test::More;
use SWFEditor::Simple;

my $d1     = get_file_path('/resource/saitama.swf');
my $expect = get_file_contents('/swf/convert001.swf');

my $swfed = SWFEditor::Simple->new();
{
    $swfed->input($d1);
    $swfed->convert_bitmap_data_to_jpeg_tag();
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        ''
    );
}

done_testing();
