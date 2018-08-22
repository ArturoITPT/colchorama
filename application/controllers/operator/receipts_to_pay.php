<?php
require_once APPPATH.'/controllers/super_controller.php';
class Receipts_to_pay extends super_controller{
    
    private $view = "list";
    private $id = null;
    private $Model = "Receipt";
    private $insertLabel = "";
    protected $title = "Cuentas por pagar";
    
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
        
         if ($this->view == 'payform'){
          
             
             
             return $this->payForm();
             
        }
        
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
    
    function payForm(){
       
       $form = new Formelement();
       $form->setClass("form-horizontal");
       $action = site_url2("receipts_to_pay/save");
       $form->setAttr("action",$action);
        //$form->setStyle("border:1px solid red");
       
       $receipt = new Receipt($this->receipt_id);
      
       $receipt->id;
       $h1 = new H1("Recibo No. $receipt->id");
       $form->add($h1);
       
       
      
        
       
      
       
        $input = new Input("total","","text");
        $input->setClass("form-control");
        $label = new BSLabel("Total A Pagar");
        
        $label->setClass("col-md-2 form-label");
        $config["class"]='form-group another-class';
            $children=array(
                "label"=>$label,// si la mando en array, la va a envolver en un div
                array('element'=>$input,'class'=>'col-md-4'),//crea un div
               
                
            );
        
        $config["children"]=$children;
        $fg = new BSFormGroup($config);
       
        $form->add($fg);
       
        $input = new Input("comprobante","","file");
        $input->setClass("form-control");
        $label = new BSLabel("Comprobante");
        
        $label->setClass("col-md-2 form-label");
        $config["class"]='form-group another-class';
            $children=array(
                "label"=>$label,// si la mando en array, la va a envolver en un div
                array('element'=>$input,'class'=>'col-md-4'),//crea un div
               
                
            );
        
        $config["children"]=$children;
        $fg = new BSFormGroup($config);
       
        $form->add($fg);
       
        //-------------------------------------------------------------------------------
        
//        $label = new BSLabel("Bodega");
//        
//        
//        $d = new Depot();
//      
//        $options = $d->allToIdName();
//        
//        
//        $input = new DD("depot_id",$options);
//        $input->setClass("form-control");
//        
//        $label->setClass("col-md-2 form-label");
//        $config["class"]='form-group another-class';
//            $children=array(
//                "label"=>$label,// si la mando en array, la va a envolver en un div
//                array('element'=>$input,'class'=>'col-md-4'),//crea un div
//               
//                
//            );
//        
//        $config["children"]=$children;
//        $fg = new BSFormGroup($config);
//       
//        $form->add($fg);
        
        
        
        $input = new Input("","Guardar","submit");
        $input->setClass("btn btn-default");
        $config["class"]='form-group another-class';
            $children=array(
            
                array('element'=>$input,'class'=>'col-md-2 pull-right'),//crea un div
             
                
            );
        
        $config["children"]=$children;
        $fg = new BSFormGroup($config);
       
       
       $fg = new BSFormGroup($config);
       $form->add($fg);
       
       $input = new Input("receipt_id",$receipt->id,"hidden");
       $form->add($input);
       
       $date = @date("Y-m-d");
        $input = new Input("date",$date,"hidden");
       $form->add($input);
       
       return $form;
       
       
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
        
       $receipt_id = $this->input->post("receipt_id");
       $receipt = new Receipt($receipt_id);
       
       $total = $this->input->post("total");
       
       $payment = new Payment();
       $payment->total = $total;
       $payment->save($receipt);
       
       redirect(site_url2("receipts_to_pay"));
        
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
    
    function form($id){
       // $params = params();
      
        //echo $id;
        //pd($params);
        // echo $id;
        $this->receipt_id = $id;
        $this->view = "payform";
        $this->index();
       
       
   
        
        
    }
    
    function getSearchForm(){
        
        $form = new Formelement();
        return $form;
        
    }
    
    function getListOfRecords(){
        
        // this is somewhat an exception ,
        //  the  orders will be display and the receipts from there 
        
        $element = new Receipt();
        
        $receipts_filter_orders = cisess("receipts_filter_orders");
        
        if ($receipts_filter_orders===FALSE){
            $receipts_filter_orders = "Abierta"; // default to abiertas
        }
        
       
        
        
        $element->order_by("id","desc");
        
        $all = $element->get()->all;
        //echo $element->check_last_query();
        ///die();
        $table = $this->entable($all);
        
        return $table;
        
        
    }
   
    
   
   function entable($all){
       
       $table = new Table();
       $table->setClass("table table-striped table-bordered");
       $header = new Tr();
       
       $th = new Th("No. de Recibo");
       $header->add($th);
       
        $th = new Th("No. de Orden");
       $header->add($th);
       
       $th = new Th("Proveedor");
       $header->add($th);
       
       $th = new Th("Días");
       $header->add($th);
       
       $th = new Th("Total");
       $header->add($th);
       $th = new Th("Factura");
       $header->add($th);
        $th = new Th("");
       $header->add($th);
         $th = new Th("");
       $header->add($th);
       $table->add($header);
       foreach ($all as $key=> $element){
            $tr = new Tr();
            
                $td = new Td($element->id);
                $tr->add($td);
                 $td = new Td($element->getOrderId());
                $tr->add($td);
                $td = new Td($element->getProvider());
                $tr->add($td);
                $td = new Td($element->getDays());
                $tr->add($td);
                $td = new Td($element->getTotal());
                $td->setStyle("text-align:right");
                $tr->add($td);
                
                $td = new Td($element->getPdf());
                $td->setStyle("text-align:center");
                $tr->add($td);
                
                $pagos = $this->getRecibosTable($element);
                $td = new Td($pagos);
                $td->setStyle("text-align:right");
                $tr->add($td);
                
                
                $new_payment_link = site_url2("receipts_to_pay/form/$element->unique");
                $anchor = new Anchor("Agregar Pago","$new_payment_link");
                $anchor->setClass("btn btn-default");
                $td = new Td($anchor);
                $td->setStyle("text-align:right");
                $tr->add($td);
                
                
                
            $table->add($tr);
           
       }
       
       
       return $table;
   }
    
   
   function getControllerName() {
       return strtolower(__CLASS__);
   }
    
   function getJs() {
       
       
        
                
    }
    
    
    function filter(){
        $status = $this->input->post("filter_receipts_orders");
        cisess("receipts_filter_orders",$status);
        redirect(site_url2("receipts"));
        
    }
   
    
     /*para desplegar en el listado frontal de las ordentes*/
   function getRecibosTable($receipt)
   {
       
       
        
        
        $all = $receipt->payment->get()->all;
      
       
        
        $headers = array("No.",
                         "Total",
                        "Fecha");
        $columns = array(
                         array( 'field'=>'id'),
                     
                         array( 'function'=>'getTotalPaid'),
                          array( 'function'=>'getDate'),
                            
                         
                        );
        //pd($columns);
        $styles = array(
            
                        'text-align:right;width:40px',
                        'text-align:right;width:40px',
                        'text-align:right;width:80px',
                        'text-align:center;width:40px',
        );
        $config = array("headers"=> $headers,
                       "columns"=>$columns,
                        "rows"=>$all,
                        "styles"=>$styles
            );
        
        $table =new Table($config);
        $table->setClass("table table-bordered subtable");
        $style= new Css(".subtable th{text-align:center}");
        $table->add($style);
        
      
        return $table;
        
   }
   
    
    
    
}