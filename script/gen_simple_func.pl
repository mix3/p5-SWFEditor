use strict;
use warnings;

my @func = qw/
    output

    swf_info
    get_tag_list
    get_tag_detail

    get_header_info
    set_header_info

    get_tag_data
    get_tag_data_by_cid
    get_tag_contents_by_cid
    remove_tag

    get_shape_data
    set_shape_adjust_mode
    set_shape_adjust_mode_none
    set_shape_adjust_mode_matrix_rescale
    set_shape_adjust_mode_rect_resize
    set_shape_adjust_mode_type_tilled
    get_shape_id_list_by_bitmap_ref

    get_jpeg_data
    get_jpeg_alpha
    get_png_data
    get_bitmap_size
    convert_bitmap_data_to_jpeg_tag
    apply_shape_matrix_factor
    apply_shape_rect_factor

    get_edit_string
    replace_edit_string

    get_sound_data

    get_action_data
    set_action_variables
    replace_action_strings
    disasm_action_data

    set_compress_level
    purge_useless_contents
    rebuild
/; 

for (@func) {
    print <<FUNC
sub $_ {
    return shift->super->$_(\@_);
}

FUNC
}
