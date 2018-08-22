<?php

class Orders_service extends CI_Controller{
    
    //@stodo , ideally we should require a session to show the service
    function __construct() {
        parent::__construct();
    }
    function index(){
        echo "ready";
    }
    
    function get($parent_id=null,$selected_child_id=null){
        $Model = "Order";
     
        $parent = new $Model($parent_id);
        
        //echo $parent->name;
        
        $all = $parent->get()->all;
        //p($all);
        $result = array();
        foreach ($all as $record){
            $result[]=array("id"=> $record->id,'fecha'=>$record->date,
                'description'=>$record->getProductDescription(),
                'productos'=> $record->getProductList());
        }
       
        $this->output
        ->set_content_type('application/json') //set Json header
        ->set_output(json_encode($result));// make output json encoded
        //echo json_encode($result);
        
    }
    
    function table($order_id = null){
        
       
        $order = new Order($order_id);
        
        echo $order->getProductsBody();
        
       
    }
    
}
