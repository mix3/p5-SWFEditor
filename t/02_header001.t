use t::Utils;
use Test::More;
use SWFEditor;

my $expect = {
    compress => 0,
    version  => 4,
    x_min    => 0,
    y_min    => 0,
    x_max    => 240,
    y_max    => 240,
};

{
    my $d1    = get_file_contents('/resource/textvar.swf');
    my $swfed = SWFEditor->new();
    $swfed->input(\$d1);
    my $got = $swfed->get_header_info();
    is_deeply(
        $got,
        $expect,
        '',
    );
}

{
    my $d1    = get_file_path('/resource/textvar.swf');
    my $swfed = SWFEditor->new();
    $swfed->input($d1);
    my $got = $swfed->get_header_info();
    is_deeply(
        $got,
        $expect,
        '',
    );
}

done_testing();
