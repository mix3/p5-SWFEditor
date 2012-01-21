use t::Utils;
use Test::More;
use SWFEditor::Simple;

my $d1     = get_file_path('/resource/negimiku.swf');
my $d2     = get_file_path('/resource/saitama3.swf');
my $expect = get_file_contents('/swf/movieclip002.swf');

my $swfed = SWFEditor::Simple->new();
{
    $swfed->input($d1);
    $swfed->replace_movie_clip('miku', $d2);
    $swfed->purge_useless_contents();
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        'movieclip002.phpt'
    );
}

done_testing();
