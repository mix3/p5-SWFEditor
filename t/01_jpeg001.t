use t::Utils;
use Test::More;
use SWFEditor;

my $expect = get_file_contents('/swf/jpeg001.swf');

{
    my $d1    = get_file_contents('/resource/negimiku.swf');
    my $d2    = get_file_contents('/resource/5.jpg');
    my $swfed = SWFEditor->new();
    $swfed->input(\$d1);
    $swfed->replace_jpeg_data(1, \$d2);
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        ''
    );
}

{
    my $d1    = get_file_path('/resource/negimiku.swf');
    my $d2    = get_file_path('/resource/5.jpg');
    my $swfed = SWFEditor->new();
    $swfed->input($d1);
    $swfed->replace_jpeg_data(1, $d2);
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        ''
    );
}

done_testing();
