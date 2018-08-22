<?php

class Cities_service extends CI_Controller{
    
    //@stodo , ideally we should require a session to show the service
    function __construct() {
        parent::__construct();
    }
    function index(){
        echo "ready";
    }
    
    function get($parent_id,$selected_child_id=null){
        $Model = "State";
        $child = "city";
        $parent = new $Model($parent_id);
        
        //echo $parent->name;
        
        $all = $parent->$child->order_by('name')->get()->all;
        //p($all);
        $result = array();
        foreach ($all as $record){
            $sel = 0;
            if ($selected_child_id == $record->id)
                $sel = 1;
            $result[] = array("id"=>$record->id,"name"=>$record->getFullName(),"selected"=>$sel);
        }
        if (empty($result)){
            $result[] = array("id"=>'',"name"=>"-");
            $result[] = array("id"=>'',"name"=>"No se encontraron registros");
        }
        
        $this->output
        ->set_content_type('application/json') //set Json header
        ->set_output(json_encode($result));// make output json encoded
        //echo json_encode($result);
        
    }
    
}