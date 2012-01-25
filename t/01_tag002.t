use t::Utils;
use Test::More;
use SWFEditor;

my $expect = [
    undef,
    {
        action_list_count => 5,
    },
    undef,
    {
        edit_id => 2,
        variable_name => 'textvar',
        initial_text => 'ABCDEFG',
    },
    {
        character_id => 2,
        depth        => 1,
    },
    undef,
    undef,
];

{
    my $d1    = get_file_contents('/resource/textvar.swf');
    my $swfed = SWFEditor->new();
    $swfed->input(\$d1);
    my $index = 0;
    for my $tag (@{$swfed->get_tag_list()}) {
        if ($tag->{detail}) {
            my $got = $swfed->get_tag_detail($index);
            is_deeply(
                $got,
                $expect->[$index],
                '',
            );
        }
        $index++;
    }
}

{
    my $d1    = get_file_path('/resource/textvar.swf');
    my $swfed = SWFEditor->new();
    $swfed->input($d1);
    my $index = 0;
    for my $tag (@{$swfed->get_tag_list()}) {
        if ($tag->{detail}) {
            my $got = $swfed->get_tag_detail($index);
            is_deeply(
                $got,
                $expect->[$index],
                '',
            );
        }
        $index++;
    }
}

done_testing();
