use t::Utils;
use Test::More;
use SWFEditor::Simple;

my $d1     = get_file_path('/resource/colorformat.swf');
my $expect = get_file_contents('/shape/colorformat.shape.8');

my $swfed = SWFEditor::Simple->new();
{
    $swfed->input($d1);
    my $got = $swfed->get_shape_data(8);
    is (
        $got,
        $expect,
        ''
    );
}

done_testing();
