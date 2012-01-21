use t::Utils;
use Test::More;
use SWFEditor;

my $d1     = get_file_contents('/resource/negimiku.swf');
my $d2     = get_file_contents('/resource/4color-300.swf');
my $expect = get_file_contents('/swf/movieclip004.swf');

my $swfed = SWFEditor->new();
{
    $swfed->input($d1);
    $swfed->replace_movie_clip('miku', $d2);
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        'movieclip004.phpt'
    );
}

done_testing();
