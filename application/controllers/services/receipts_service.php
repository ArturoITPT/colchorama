<?php

class receipts_service extends CI_Controller{
    
    //@stodo , ideally we should require a session to show the service
    function __construct() {
        parent::__construct();
    }
    function index(){
        echo "ready";
    }
    
    function serve($receipt_id =null ){
        
        if (empty($receipt_id)){
            
            echo "...";
            
        }
        
        $receipt  = new Receipt($receipt_id);
        $order    = $receipt->order->get();
      
        echo $receipt->getModalView();
        
        

        
    }
    
    function table($order_id = null){
        
       
        $order = new Order($order_id);
        
        echo $order->getProductsBody();
        
       
    }
    
}
