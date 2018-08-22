<?php

class Providers_service extends CI_Controller{
    
    //@stodo , ideally we should require a session to show the service
    function __construct() {
        parent::__construct();
    }
    function index(){
        echo "ready";
    }
    
    function get_brands($provider_id,$selected_brand_id=null){
        
        $provider = new Provider($provider_id);
        $all = $provider->brand->get()->all;
        $result = array();
        foreach ($all as $record){
            $sel = 0;
            if ($selected_brand_id == $record->id)
                $sel = 1;
            $result[] = array("id"=>$record->id,"name"=>$record->getFullName(),"selected"=>$sel);
        }
        if (empty($result)){
            $result[] = array("id"=>'',"name"=>"-");
            $result[] = array("id"=>'',"name"=>"No se encontraron marcas");
        }
        
        $this->output
        ->set_content_type('application/json') //set Json header
        ->set_output(json_encode($result));// make output json encoded
        //echo json_encode($result);
        
    }
    
}