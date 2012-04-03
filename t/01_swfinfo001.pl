use t::Utils;
use SWFEditor;

{
    my $d1    = get_file_contents('/resource/saitama.swf');
    my $swfed = SWFEditor->new();
    $swfed->input(\$d1);
    $swfed->swf_info();
}

#{
#    my $d1    = get_file_path('/resource/saitama.swf');
#    my $swfed = SWFEditor->new();
#    $swfed->input($d1);
#    $swfed->swf_info();
#}
