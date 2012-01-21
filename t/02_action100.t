use t::Utils;
use Test::More;
use SWFEditor::Simple;

my $d1     = get_file_path('/resource/textvar.swf');
my $expect = get_file_contents('/swf/action100.swf');

my $swfed = SWFEditor::Simple->new();
{
    $swfed->input($d1);
    $swfed->replace_action_strings({
        dummy    => 'dummydummy',
        inputvar => 'replacedvar',
    });
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        'action100.phpt'
    );
}

done_testing();
