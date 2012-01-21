use t::Utils;
use Test::More;
use SWFEditor::Simple;

my $d1 = get_file_path('/resource/textvar.swf');

my $expect = {
    compress => 0,
    version  => 4,
    x_min    => 0,
    y_min    => 0,
    x_max    => 240,
    y_max    => 240,
};

my $swfed = SWFEditor::Simple->new();
{
    $swfed->input($d1);
    my $got = $swfed->get_header_info();
    is_deeply(
        $got,
        $expect,
        '',
    );
}

done_testing();
