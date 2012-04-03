<?php

$swf_filename = 'src/tests/saitama.swf';
$gif_filename = 'src/tests/5.jpg';

$swfdata = file_get_contents($swf_filename);
$obj = new SWFEditor();

$obj->setShapeAdjustMode(SWFEditor::SHAPE_BITMAP_RECT_RESIZE);
// $obj->setShapeAdjustMode(SWFEditor::SHAPE_BITMAP_MATRIX_RESCALE);
// $obj->setShapeAdjustMode(SWFEditor::SHAPE_BITMAP_TYPE_TILLED);

$obj->input($swfdata);
$image_id = 1;
$gifdata = file_get_contents($gif_filename);
$obj->replaceJpegData($image_id, $gifdata);
echo $obj->output();
