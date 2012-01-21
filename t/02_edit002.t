use t::Utils;
use Test::More;
use SWFEditor::Simple;

my $d1 = get_file_path('/resource/textvar.swf');

my $swfed = SWFEditor::Simple->new();
{
    $swfed->input($d1);
    my $got = $swfed->get_edit_string('textvar');
    is (
        $got,
        'ABCDEFG',
        '',
    );
}

done_testing();
