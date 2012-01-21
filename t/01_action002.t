use t::Utils;
use Test::More;
use SWFEditor;

my $d1     = get_file_contents('/resource/textvar-noaction.swf');
my $expect = get_file_contents('/swf/action002.swf');

my $swfed = SWFEditor->new();
{
    $swfed->input($d1);
    $swfed->set_action_variables({
        testvar => 'dummydummy',
    });
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        'action002.phpt'
    );
}

done_testing();
