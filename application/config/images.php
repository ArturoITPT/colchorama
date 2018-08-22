<?php
/*
|--------------------------------------------------------------------------
| Image Preset Sizes
|--------------------------------------------------------------------------
|
| Specify the preset sizes you want to use in your code. Only these preset 
| will be accepted by the controller for security.
|
| Each preset exists of a width and height. If one of the dimensions are 
| equal to 0, it will automatically calculate a matching width or height 
| to maintain the original ratio.
|
| If both dimensions are specified it will automatically crop the 
| resulting image so that it fits those dimensions.
|
*/

$config["image_sizes"]["square"] = array(150, 150);
$config["image_sizes"]["large"]   = array(1024, 768);
$config["image_sizes"]["medium"]   = array(600, 460);
$config["image_sizes"]["small"]   = array(200, 160);

//$config["image_sizes"]["small"]  = array(280, 0);
//$config["image_sizes"]["medium"] = array(340, 0);
//$config["image_sizes"]["large"]  = array(800, 0);