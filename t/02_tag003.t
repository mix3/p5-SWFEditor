use t::Utils;
use Test::More;
use SWFEditor::Simple;

my $d1 = get_file_path('/resource/textvar.swf');

my $swfed = SWFEditor::Simple->new();
{
    $swfed->input($d1);
    my $seqno = 0;
    for my $tag_info (@{$swfed->get_tag_list()}) {
        my $got = $swfed->get_tag_data($seqno);
        my $expect = get_file_contents('/tag/textvar.tag.'.$seqno);
        is(
            $got,
            $expect,
            '',
        );
        $seqno++;
    }
}

done_testing();
