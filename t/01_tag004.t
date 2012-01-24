use t::Utils;
use Test::More;
use SWFEditor;


my $d1     = get_file_contents('/resource/textvar.swf');
my $expect = get_file_contents('/tag/textvar.tag.cid.1');

my $swfed = SWFEditor->new();
{
    $swfed->input($d1);
    my $got = $swfed->get_tag_data_by_cid(1);
    is (
        $got,
        $expect,
        '',
    );
}

done_testing();
