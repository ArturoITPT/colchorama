<?php
require_once APPPATH.'/controllers/super_controller.php';
class Receipts extends super_controller{
    
    private $view = "list";
    private $id = null;
    private $Model = "Receipt";
    private $insertLabel = "Agregar Recibo";
    protected $title = "Ordenes de Compra > Recibos ";
    
    function __construct() {
        parent::__construct();
        
        $this->updateOrdersStatus();
        
    }
    
    
    function updateOrdersStatus(){
        //echo "updating .////";
        $orders = new Order();
        $cerradas = array("status !="=>"Cerrada");
        $all = $orders->where($cerradas)->get()->all;
        //echo "got ".count($all);
        foreach($all as $order){
            
            $restantes = $order->getRestantes();
           // echo "restantes ".$restantes;
            if ($restantes==0){
                $order->status = "Cerrada";
                $order->save();
            }
            else if ($restantes>0){
                $order->status = "Abierta";
                $order->save();
            }
        }
        
        
    }
    
    function getWrapper($content=""){
        
        $div = new Div();
        $div->setClass("row");
        //$div->setStyle("margin-top:80px;");
        
        $cols = new Div();
       
        $cols->setClass("col-md-12");
        //$cols->setStyle("border:1px solid #ccc");
        
        
        $h1 = new H1($this->title);
        
        $cols->add($h1);
        
        $cols->add($content);
        
        $div->add($cols);
        return $div;
        
    }
    
    function getContent(){
        
        if ($this->view == 'list'){
            $list= $this->lista();
            $wrapper=  $this->getWrapper($list);
            return $wrapper;
        }
        
        elseif ($this->view == 'form')
            
            $form= $this->formContent();
            $wrapper=  $this->getWrapper($form);
            return $wrapper;
    }
    function formContent(){
        
    
        
        $form = new Formelement();
        $form->setClass("form-horizontal");
        $record = new $this->Model($this->id);
        $id = !empty($this->id)?"id/$this->id":"";
        $action = site_url("operator/".$this->getControllerName()."/save/$id");
        $form->setAttr("action",$action);
       
       
       
        $label = "Orden";
        $input = new Input("order_id",$record->order_id,'text','form-control');
        $input->setAttr("required","required");
        $input->setId("order_id");
        
        $input->setAttr("placeholder","Numero de orden");
        $element = $this->FormElement($label,$input);     
        $form->add($element);
        
        $label = "Productos";
      
        $table = $this->getReceiptTable();
        
        $element = $this->FormElement($label,$table,10);     
        $form->add($element);
       
        $label = new BSLabel("Factura");
        $input = new Input("image",null,"file");
        
        $config["class"]="form-group";
        $config["children"]=array(
                        $label,
                        array('element'=>$input,'class'=>'col-md-4'),//crea un div
                
        );
        
        $form_group= new BSFormGroup($config);
      
        $form->add($form_group);
       
        
        $formGroup = new Div();
        $formGroup->setClass("form-group");
        $submitDiv = new Div();
        $submitDiv->setClass("col-sm-offset-2 col-sm-6");
        
        $submit = new Input("","Guardar","submit");
        $submit->setClass("btn btn-default");
        
        $submitDiv->add($submit);
        
        $formGroup->add($submitDiv);
        
        
        
        $form->add($formGroup);
       
        return $form;
        
    }
    
    /*works just as a template, real data will come via ajax*/
    
    
    function FormElement($labelContent, $input,$colspan=6){
        
        $div= new Div();
        $div->setClass("form-group");
            $label = new Label($labelContent);
            $label->setClass("col-sm-2 control-label");
        $div->add($label);
        $divInput = new Div();
        $divInput->setClass("col-sm-{$colspan}");
        
        $divInput->add($input);
       // $div->add(new Br());    
        $div->add($divInput);
        
        
        return $div;
        
        
        
    }
    function save(){
        
       
       
       
        
    }
    
    function lista(){
        
        $div = new Div();
            //$div->setStyle("border:1px solid red");
        
            $addLink = site_url("operator/".$this->getControllerName()."/form/");
            $newPatientLink = new Anchor($this->insertLabel,$addLink);
            $newPatientLink->setClass("btn btn-default btn-large pull-right");
            $newPatientLink->setStyle("margin-bottom:10px;");
            //$div->add($newPatientLink);
         
        $divFilters = new Formelement();
        $action = site_url2("receipts/filter/");
        $divFilters->setAttr("action",$action);    
        $options=  array("Abierta"=>"Abiertas",
                        ""=>"Todas",
                        "Cerrada"=>"Cerradas");
     
        $selected = cisess("receipts_filter_orders");
        //echo "selected $selected";
        //cisess_out();
        if (!isset($selected)){
            $selected = "Abiertas";
        }
        $select = new Dropdown("filter_receipts_orders",$options,$selected);
        $select->setStyle("width:120px");
        $select->setClass("pull-right form-control");
        $divFilters->add($select);
        $div->add($divFilters);
            
        
            $list = $this->getListOfRecords();
        $div->add($list);
        
        
       
        
        return $div;
        
    }
    
    function form(){
     $params = params(2);
//        print("<br><br><br>");
//        print_r($params);
        
        if (isset($params["id"]))
            $this->id = $params["id"];
        
        $this->view = 'form';
        $this->index();
        
        
    }
    
    function getSearchForm(){
        
        $form = new Formelement();
        return $form;
        
    }
    
    function getListOfRecords(){
        
        // this is somewhat an exception ,
        //  the  orders will be display and the receipts from there 
        
        $element = new Order();
        
        $receipts_filter_orders = cisess("receipts_filter_orders");
        
        if ($receipts_filter_orders===FALSE){
            $receipts_filter_orders = "Abierta"; // default to abiertas
        }
        
        if (!empty($receipts_filter_orders))
        {
            $element->where("status",$receipts_filter_orders);
        }
        
        
        $element->order_by("id","desc");
        
        $all = $element->get()->all;
        //echo $element->check_last_query();
        ///die();
        $table = $this->entable($all);
        
        return $table;
        
        
    }
   
    
   /*these are orders, not receipts*/
   function entable($all){
       
       $table = new Table();
       $table->setClass("table table-striped table-bordered");
       $header = new Tr();
       
       $th = new Th("Orden");
       $header->add($th);
       
       $th = new Th("Proveedor");
       $header->add($th);
       
       $th = new Th("Total Pzas");
       $header->add($th);
       
       $th = new Th("Recibidas");
       $header->add($th);
       
       
       $th = new Th("Restantes");
       $header->add($th);
       
        $th = new Th("Status");
        $header->add($th);
       
       
       $th = new Th("Recibos");
       $header->add($th);
       
       $th = new Th("Comprobante");
       $header->add($th);
       
       $th = new Th("");
       $header->add($th);
       
       $table->add($header);
       foreach ($all as $key=> $element){
            $tr = new Tr();
            
                $td = new Td($element->id);
                $tr->add($td);
                
                $td = new Td($element->getProvider());
                $tr->add($td);
                
                
                $pedidas = $element->getPiezas();
                $td = new Td($pedidas);
                $tr->add($td);
                
                $recibidas = $element->getReceived();
                $td = new Td($recibidas);
                $tr->add($td);
                
                
                $restantes = $pedidas - $recibidas;
                $td = new Td($restantes);
                $tr->add($td);
                if (empty($element->status))
                    $element->status = "Abierta";
                $td = new Td($element->status);
                $tr->add($td);
                
                
                $recibos = $element->getRecibosTable();
                $td = new Td($recibos);
                $tr->add($td);
                
                
                
                
                $receipt = site_url2("orders/receipt/{$element->unique}");
                $receive_anchor = new Anchor("Agregar Recibo","$receipt");
                if ($restantes==0){
                    $receive_anchor = new Anchor("Agregar Recibo","#");
                    $receive_anchor->setAttr("disabled","disabled");
                    $receive_anchor->setAttr("onclick","return false");
                    // mark order as closed
                  
                    
                }
                $receive_anchor->setClass("btn btn-default");
                $td = new Td($receive_anchor);
                $td->setStyle("text-align:center");
                $tr->add($td);
                
                
                
                
            $table->add($tr);
           
       }
       
       
       return $table;
   }
    
   function payments(){
       
       
       $this->receipt_id = $id;
       $this->view = "receipt";
       $this->index();
       
   }
   function getControllerName() {
       return strtolower(__CLASS__);
   }
    
   function getJs() {
       
        if ($this->view=='receipt')
        {
            $data[""]="";
            return $this->
                load->view("js/{$this->getControllerName()}/{$this->getControllerName()}_js.php",$data,true);
        }
        //die($this->view);
        if ($this->view=='list'){
        $data[""]="";    
        return $this->
                load->view("js/{$this->getControllerName()}/{$this->getControllerName()}_list_js.php",$data,true);
            
        }
        
                
    }
    
    
    function filter(){
        $status = $this->input->post("filter_receipts_orders");
        cisess("receipts_filter_orders",$status);
        redirect(site_url2("receipts"));
        
    }
   

}