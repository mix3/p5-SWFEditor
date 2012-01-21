use t::Utils;
use Test::More;
use SWFEditor;

my $d1     = get_file_contents('/resource/textvar.swf');
my $expect = get_file_contents('/swf/action101.swf');

my $swfed = SWFEditor->new();
{
    $swfed->input($d1);
    $swfed->replace_action_strings({
        dummydummy => 'dummy',
        inputvar   => 'rep',
    });
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        'action101.phpt'
    );
}

done_testing();
