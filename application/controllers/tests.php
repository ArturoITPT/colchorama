<?php
require_once APPPATH.'/classes/notification.php';
require_once APPPATH.'/classes/EmailFactory.php';



class Tests extends  CI_Controller{

    use notification;
    
    function __construct() {
        parent::__construct();
    }
    
    function index(){
         index_test($this,'tests/');
    }
    
    
    function showdbtables(){
    
        echo '<pre>';
        $tables=$this->db->query("SELECT t.TABLE_NAME AS myTables FROM INFORMATION_SCHEMA.TABLES AS t WHERE t.TABLE_SCHEMA = 'colchones' ")->result_array();    
            foreach($tables as $key => $val) {
            echo "TRUNCATE " .$val['myTables'] ."; \n";// myTables is the alias used in query.
        }
        
    }
    
    
    
    
    
    
    function test_OrderReceipts(){
        
        
        $order = new Order(13);
        echo $order->id;
        $receipts = $order->receipt->get()->all;
        
       foreach($receipts as $receipt){
           
           echo "receipt id is $receipt->id";
           echo "<br>";
           
       }
        
        
        
        
    }
    
    
    
    function testtaxclass(){
        
        
        $t = new Tax();
        $all  = $t->get()->all;
        foreach($all as $tax){
            echo $tax->name;
        }
        
    }
    
    function testproductsjson(){
        
        echo $this->getProducts();
        
        
        
    }
    function getProducts(){
       
        $records = new Product();
        $records->get()->all;
        $records_array = array();
        foreach($records as $record){
            $records_array[]=array("id"=>$record->getId(),
                                    "price"=>$record->price,    
                                    "code"=>$record->code,    
                                    "name"=>$record->getFullName());
        }
        
        
        $p = json_encode($records_array);
       return $p;
   }
   
    function createandsavepatient(){
        
        
        $p = new Patient();
        $p->name = "test";
        $p->save();
        echo "unique ". $p->unique;
        
        $u = $p->unique;
        $p2 = new Patient($u);
        echo "object 2 is ";
        echo $p2->name;
        echo "<br>";
        echo "object unique is $p2->unique";
        echo "created from instance unique";
        $p3 = new Patient('ca3fc235-a31b-4a33-845b-3db4fe17a53a');
        
        echo "p3 is $p3->name $p3->unique ";
        
        
        
        
        
        
    }
     function createandedit_doctor(){
        
        
        $p = new Physician();
        $p->name = "test";
        $p->save();
        echo "unique ". $p->unique;
        
        $u = $p->unique;
        $p2 = new Physician($u);
        echo "object 2 is ";
        echo $p2->name;
        echo "<br>";
        echo "object unique is $p2->unique";
        echo "created from instance unique";
        $p3 = new Physician('892dab0f-2cac-4d9e-beec-511f6c9f6197');
        
        echo "p3 is $p3->name $p3->unique ";
        
        
        
        
        
        
    }
    
    
    function testcompanybranch(){
        
        $company = new Company(1);
        
        $branch = new Branch('952daf8f-3e66-4c22-9631-36aa12b5b1a0');
        
        //$company->save($branch);
        
        
    }
}