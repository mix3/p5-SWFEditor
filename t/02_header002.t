use t::Utils;
use Test::More;
use SWFEditor::Simple;

my $d1 = get_file_path('/resource/textvar.swf');

my $expect = {
    compress => 1,
    version  => 5,
    x_min    => 10,
    y_min    => 10,
    x_max    => 150,
    y_max    => 150,
};

my $swfed = SWFEditor::Simple->new();
{
    $swfed->input($d1);
    $swfed->set_header_info($expect);
    my $got = $swfed->get_header_info();
    is_deeply(
        $got,
        $expect,
        '',
    );
}

done_testing();
