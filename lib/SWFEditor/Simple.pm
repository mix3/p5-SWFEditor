package SWFEditor::Simple;

use SWFEditor;

sub new {
    my ($class) = @_;
    my $self = bless {
        super => SWFEditor->new(),
    }, $class;
    return $self;
}

sub super {
    my $self = shift;
    return $self->{super};
}

sub input {
    my $self = shift;
    my $file = shift;
    return $self->super->_input(&_load_file($file));
}

sub replace_tag_data {
    my $self  = shift;
    my $seqno = shift;
    my $file  = shift;
    return $self->super->_replace_tag_data($seqno, &_load_file($file));
}

sub replace_tag_data_by_cid {
    my $self = shift;
    my $cid  = shift;
    my $file = shift;
    return $self->super->_replace_tag_data_by_cid($cid, &_load_file($file));
}

sub replace_tag_contents_by_cid {
    my $self = shift;
    my $cid  = shift;
    my $file = shift;
    return $self->super->_replace_tag_contents_by_cid($cid, &_load_file($file));
}

sub replace_movie_clip {
    my $self          = shift;
    my $instance_name = shift;
    my $file          = shift;
    my $unused_cid_purge = shift || 1;
    return $self->super->_replace_movie_clip(
        $instance_name,
        &_load_file($file),
        $unused_cid_purge,
    );
}

sub replace_shape_data {
    my $self     = shift;
    my $shape_id = shift;
    my $file     = shift;
    return $self->super->_replace_shape_data($shape_id, &_load_file($file));
}

sub replace_bitmap_data {
    my $self       = shift;
    my $image_cond = shift;
    my $file       = shift;
    my $alpha_file = shift;
    my $without_converting = shift || 0;

    my $alpha_data     = 0;
    my $alpha_data_len = 0;

    if ($alpha_file) {
        ($alpha_data, $alpha_data_len) = &_load_file($alpha_file);
    } else {
        ($alpha_data, $alpha_data_len) = (0, 0);
    }
    return $self->super->_replace_bitmap_data(
        $image_cond,
        &_load_file($file),
        $alpha_data,
        $alpha_data_len,
        $without_converting,
    );
}

sub replace_png_data {
    my $self     = shift;
    my $image_id = shift;
    my $file     = shift;
    return $self->super->_replace_png_data($image_id, &_load_file($file));
}

sub replace_gif_data {
    my $self     = shift;
    my $image_id = shift;
    my $file     = shift;
    return $self->super->_replace_gif_data($image_id, &_load_file($file));
}

sub replace_jpeg_data {
    my $self     = shift;
    my $image_id = shift;
    my $file     = shift;
    return $self->super->_replace_jpeg_data($image_id, &_load_file($file));
}

sub replace_mld_data {
    my $self     = shift;
    my $sound_id = shift;
    my $file     = shift;
    return $self->super->_replace_mld_data($sound_id, &_load_file($file));
}

sub is_shape_tag_data {
    my $self = shift;
    my $file = shift;
    return $self->super->_is_shape_tag_data(&_load_file($file));
}

sub is_bitmap_tag_data {
    my $self = shift;
    my $file = shift;
    return $self->super->_is_bitmap_tag_data(&_load_file($file));
}

sub _load_file {
    my $filepath = shift;
    my $size = (stat($filepath))[7];
    my $bytes = '';
    my $fh;
    open $fh, $filepath or die "$!: $filepath";
    binmode($fh);
    while (<$fh>) {
        $bytes .= $_;
    }
    close $fh;
    return ($bytes, $size);
}

sub output {
    return shift->super->output(@_);
}

sub swf_info {
    return shift->super->swf_info(@_);
}

sub get_tag_list {
    return shift->super->get_tag_list(@_);
}

sub get_tag_detail {
    return shift->super->get_tag_detail(@_);
}

sub get_header_info {
    return shift->super->get_header_info(@_);
}

sub set_header_info {
    return shift->super->set_header_info(@_);
}

sub get_tag_data {
    return shift->super->get_tag_data(@_);
}

sub get_tag_data_by_cid {
    return shift->super->get_tag_data_by_cid(@_);
}

sub get_tag_contents_by_cid {
    return shift->super->get_tag_contents_by_cid(@_);
}

sub remove_tag {
    return shift->super->remove_tag(@_);
}

sub get_shape_data {
    return shift->super->get_shape_data(@_);
}

sub set_shape_adjust_mode {
    return shift->super->set_shape_adjust_mode(@_);
}

sub set_shape_adjust_mode_none {
    return shift->super->set_shape_adjust_mode_none(@_);
}

sub set_shape_adjust_mode_matrix_rescale {
    return shift->super->set_shape_adjust_mode_matrix_rescale(@_);
}

sub set_shape_adjust_mode_rect_resize {
    return shift->super->set_shape_adjust_mode_rect_resize(@_);
}

sub set_shape_adjust_mode_type_tilled {
    return shift->super->set_shape_adjust_mode_type_tilled(@_);
}

sub get_shape_id_list_by_bitmap_ref {
    return shift->super->get_shape_id_list_by_bitmap_ref(@_);
}

sub get_jpeg_data {
    return shift->super->get_jpeg_data(@_);
}

sub get_jpeg_alpha {
    return shift->super->get_jpeg_alpha(@_);
}

sub get_png_data {
    return shift->super->get_png_data(@_);
}

sub get_bitmap_size {
    return shift->super->get_bitmap_size(@_);
}

sub convert_bitmap_data_to_jpeg_tag {
    return shift->super->convert_bitmap_data_to_jpeg_tag(@_);
}

sub apply_shape_matrix_factor {
    return shift->super->apply_shape_matrix_factor(@_);
}

sub apply_shape_rect_factor {
    return shift->super->apply_shape_rect_factor(@_);
}

sub get_edit_string {
    return shift->super->get_edit_string(@_);
}

sub replace_edit_string {
    return shift->super->replace_edit_string(@_);
}

sub get_sound_data {
    return shift->super->get_sound_data(@_);
}

sub get_action_data {
    return shift->super->get_action_data(@_);
}

sub set_action_variables {
    return shift->super->set_action_variables(@_);
}

sub replace_action_strings {
    return shift->super->replace_action_strings(@_);
}

sub disasm_action_data {
    return shift->super->disasm_action_data(@_);
}

sub set_compress_level {
    return shift->super->set_compress_level(@_);
}

sub purge_useless_contents {
    return shift->super->purge_useless_contents(@_);
}

sub rebuild {
    return shift->super->rebuild(@_);
}

1;
