<?php

require_once 'parent_model.php';

class Image extends parent_model{
    
    
    var $has_one = array('product','receipt','payment');

	// Insert related models that Template can have more than one of
        // 
    var $has_many = array();

    var $default_order_by = array("id"=>'desc');
    
    function __construct($id = NULL, $controller = null) {
        parent::__construct($id, $controller);
    }
    
    function getModelName() {
        return __CLASS__;
    }
    
    function getSrc(){
        
        return base_url("uploads/$this->file_name");
        
    }
    
}
