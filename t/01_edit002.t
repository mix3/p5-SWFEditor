use t::Utils;
use Test::More;
use SWFEditor;

my $d1 = get_file_contents('/resource/textvar.swf');

my $swfed = SWFEditor->new();
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
