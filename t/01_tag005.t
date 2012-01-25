use t::Utils;
use Test::More;
use SWFEditor;

my $expect = get_file_contents('/swf/negimiku_replace_tag.swf');

{
    my $d1    = get_file_contents('/resource/negimiku.swf');
    my $d2    = get_file_contents('/resource/saitama-3.bits');
    my $swfed = SWFEditor->new();
    $swfed->input(\$d1);
    $swfed->replace_tag_data(2, \$d2);
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        '',
    );
}

{
    my $d1    = get_file_path('/resource/negimiku.swf');
    my $d2    = get_file_path('/resource/saitama-3.bits');
    my $swfed = SWFEditor->new();
    $swfed->input($d1);
    $swfed->replace_tag_data(2, $d2);
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        '',
    );
}

done_testing();
