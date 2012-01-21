use t::Utils;
use Test::More;
use SWFEditor::Simple;

my $d1     = get_file_path('/resource/textvar.swf');
my $expect = get_file_contents('/swf/edit001.swf');

my $swfed = SWFEditor::Simple->new();
{
    $swfed->input($d1);
    $swfed->replace_edit_string('textvar', 'hello world');
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        'action001.phpt'
    );
}

done_testing();
