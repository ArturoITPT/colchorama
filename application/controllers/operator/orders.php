<?php
require_once APPPATH.'/controllers/super_controller.php';
class Orders extends super_controller{
    
    private $view = "list";
    private $id = null;
    private $dir = 'operator';
    private $controller='orders';
    private $Model = 'Order';
    protected $title = "Ordenes";
    private $add_label = "Nueva Orden";
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
        
        
        if ($this->view == 'receipt'){
            
            $receipt  = $this->receiptForm();
            $o = new Order($this->order_id);
            $this->title = "Recibo para la Orden $o->id";
            return  $wrapper=  $this->getWrapper($receipt);
        }
        
        
        if ($this->view == 'list'){
            $list= $this->lista();
            $wrapper=  $this->getWrapper($list);
            return $wrapper;
        }
        
        elseif ($this->view == 'form')
        {
            $div = new Div();
            $div_left = new Div();
            $div_left->setClass("col-md-8");    
            $div_left->setStyle("margin-left:-15px;");
            $div_right = new Div();
            $div_right->setClass("col-md-4");    
            $div_totals = new Div($this->getTotals());
            
            $div_totals->setStyle("height:400px");
            $div_totals->setStyle("border:2px solid #999; border-radius:5px;padding:6px;");
            $div_totals->setStyle("background-color:white");
        
            $div_right->add($div_totals);
            
            $form= $this->formContent();
            $div_left->add($form);
            
            $div->addChild($div_left);
            $div->addChild($div_right);
            
            
            $wrapper=  $this->getWrapper($div);
            return $wrapper;
        }
    }
     function getTotals(){
        $div = new Div();
        $div->setId("totals_wrapper");
        $div->setStyle("border:0px solid blue;height:400px;position:relative");
        $div_top = new Div();
        $div_top->setStyle("border:0px solid orange;height:300px;");
        
        $div->add($div_top);
        
        $div_bottom = new Div();
        $div_bottom->setStyle("border:0px solid green;height:100px;width:100%;");
        
        $div->add($div_bottom);
        
        $table = new Table();
        $table->setStyle("width:100%");
       
       
        $tr  = new Tr();
        //$tr->setStyle("padding-botton:14px");
        //desc label 1 
        $label1 = new Label("Descuento 1 (%)");
        $td = new Td($label1);
        $td->setStyle("width:50%");
        $tr->add($td);
        // desc input 1
        $input = new Input("descuento[]","","number");
        $input->setStyle("text-align:right;");
        $input->setClass("form-control");
        $input->setClass("discount");
        $input->setAttr("autocomplete","off");
        $input->setAttr("step","1");
        $input->setAttr("max","100");
        $input->setAttr("min","0");
        
        
        
        
        $td = new Td($input);
        $tr->add($td);
        // add row to the table 
        $table->add($tr);
        
        
        $tr  = new Tr();
        //desc label 1 
        $label1 = new Label("Descuento 2 (%)");
        $td = new Td($label1);
        $td->setStyle("width:50%");
        $tr->add($td);
        // desc input 1
        $input = new Input("descuento[]","","number");
         $input->setStyle("text-align:right");
        $input->setClass("form-control");
        $input->setClass("discount");
          $input->setAttr("autocomplete","off");
        $input->setAttr("step","1");
        $input->setAttr("max","100");
        $input->setAttr("min","0");
        
        $td = new Td($input);
        $tr->add($td);
        // add row to the table 
        $table->add($tr);
        
        $tr  = new Tr();
        //desc label 1 
        $label1 = new Label("Descuento 3 (%)");
        $td = new Td($label1);
        $td->setStyle("width:50%");
        $tr->add($td);
        // desc input 1
        $input = new Input("descuento[]","","number");
         $input->setStyle("text-align:right");
        $input->setClass("form-control");
        $input->setClass("discount");
          $input->setAttr("autocomplete","off");
        $input->setAttr("step","1");
        $input->setAttr("max","100");
        $input->setAttr("min","0");
        
        $td = new Td($input);
        $tr->add($td);
        // add row to the table 
        $table->add($tr);
        
        
        $tr  = new Tr();
        //desc label 1 
        $label1 = new Label("Descuento 4 (%)");
        $td = new Td($label1);
        $td->setStyle("width:50%");
        $tr->add($td);
        // desc input 1
        $input = new Input("descuento[]","","number");
        $input->setStyle("text-align:right");
        $input->setClass("form-control");
        $input->setClass("discount");
         $input->setAttr("autocomplete","off");
        $input->setAttr("step","1");
        $input->setAttr("max","100");
        $input->setAttr("min","0");
        
        $td = new Td($input);
        $tr->add($td);
        // add row to the table 
        $table->add($tr);
        
        
        
        
        
        
        
        $div_top->add($table);
        
        $label = new Label("Total:");
        $label->setStyle("float:left;font-size:22px;font-weight:bold");
        $inputTotal = new Input("total","","text");
        $inputTotal->setId("grand-total");
        $inputTotal->setClass("form-control");
        
        $inputTotal->setStyle("font-size:32px;height:38px;text-align:right;with:100%;color:black");
        $inputTotal->setAttr("readonly");
        
        $div_bottom->add($label);
        $div_bottom->add($inputTotal);
        
        
        
        return $div;
    }
    function formContent(){
        
    
       
        $form = new Formelement();
        
        
        
        $form->setClass("form-horizontal");
       // $form->setStyle("border:1px solid red");
        
        $record = new $this->Model($this->id);
        
        $record->where("unique", $this->id)->get();
        
        
        $discounts = new Input("discounts",$record->discounts,'hidden');
        $discounts->setId("discounts");
        $form->add($discounts);
        
        $id = !empty($this->id)?"id/$this->id":"";
        $action = site_url("$this->dir/$this->controller/save/$id");
        $form->setAttr("action",$action);
        
            $label = new BSLabel("Proveedor");
            $label->setSpan(2);
        
            $provider = new Provider();
            $all = $provider->get()->all;
        
            $options = array(""=>"Seleccione")+$provider->toIdName($all);
            $input = new Dropdown("provider_id",$options,$record->provider_id);
            $input->setId("provider_id");
            $input->setAttr("required","required");
            $input->setAttr("class","form-control");
         
            $label_date = new BSLabel("Fecha");
            $label_date->setSpan(2);
            //var_dump($record->date);
            
            
            if ($record->date==null)
                $record->date = @date("Y-m-d");
           
            
            $record->date = date("d-m-Y",strtotime($record->date));
            
            $inputDate = new Input("date",$record->date,'text');
            $inputDate->setAttr("required","required");
            $inputDate->setAttr("autocomplete","off");//also in JS
            
            $inputDate->setClass("datepicker form-control");
            
            
        $config["class"]='form-group another-class';
        $config["children"] =array(
                $label,// si la mando en array, la va a envolver en un div
                array('element'=>$input,'class'=>'col-md-4'),//crea un div
                $label_date,
                array('element'=>$inputDate,'class'=>'col-md-4'),//crea un div
            );
        
        
        $fg = new BSFormGroup($config);
        $form->add($fg);
        
        //---------------------------------------------------------------------------
         $label = new BSLabel("Dias de Crédito",3);
           
        
            $provider = new Provider();
            $all = $provider->get()->all;
        
            $options = array(""=>"Seleccione")+$provider->toIdName($all);
            $input = new Input("credit",$record->credit,"number");
          
            $input->setAttr("required","required");
            $input->setAttr("min","0");
            
            $input->setClass("form-control");
         
            $label_date = new BSLabel("Impuesto");
          
            $tax = new Tax();
            $all_taxes = $tax->get()->all;
            $optionsfortax = $tax->toIdName($all_taxes);
            $taxoptions = new Dropdown("tax_id",$optionsfortax,$record->tax_id);
            $taxoptions->setClass("form-control");
            
            
        $config["class"]='form-group another-class';
        $config["children"] =array(
                $label,// si la mando en array, la va a envolver en un div
                array('element'=>$input,'class'=>'col-md-3'),//crea un div
                $label_date,
                array('element'=>$taxoptions,'class'=>'col-md-4'),//crea un div
            );
        
        
        $fg = new BSFormGroup($config);
        $form->add($fg);
        
        ///----------------------------
        // bodega de entrega y comentarios
        
        $label_bodega = new BSLabel("Bodega");
        $depot = new Depot();
        $all = $depot->get()->all;
        $all = $depot->toIdName($all);
        $select_bodega = new Dropdown("depot_id",$all,$record->depot_id);
        $select_bodega->setClass("form-control");
        $text = new Textarea("obs",$record->obs);
        $text->setClass("form-control");
        $config["class"]='form-group another-class';
        $config["children"] =array(
                $label_bodega,// si la mando en array, la va a envolver en un div
                array('element'=>$select_bodega,'class'=>'col-md-4'),//crea un div
                new BSLabel("Observaciones"),
                array('element'=>$text,'class'=>'col-md-4'),//crea un div
                
            );
        
        
        $fg = new BSFormGroup($config);
        $form->add($fg);
        
        
        
        
        
        $table = new Table();
        $table->setClass("table table-bordered");
        $table = $this->addStudyRows($table,$record);
        $table->setId("order-table");
        $config = null;
        
        $label = new BSLabel("Products");
        $config["class"]='form-group another-class';
        $config["children"] =array(
                "label"=>$label,// si la mando en array, la va a envolver en un div
                array('element'=>$table,'class'=>'col-md-10'),//crea un div
               
                
            );
        
        $fg = new BSFormGroup($config);
        
        
        $form->add($fg);
        
       
        
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
    function FormElement($labelContent, $input){
        
        $div= new Div();
        $div->setClass("form-group");
            $label = new Label($labelContent);
            $label->setClass("col-sm-2 control-label");
        $div->add($label);
        $divInput = new Div();
        $divInput->setClass("col-sm-6");
        
        $divInput->add($input);
       // $div->add(new Br());    
        $div->add($divInput);
        
        
        return $div;
        
        
        
    }
    function save(){
        p($_POST);
        list($d,$m,$y) = preg_split("[-]", $_POST["date"]);
        $_POST['date'] = "$y-$m-$d";
        $params = params(2);
        //p($params);
        $id = isset($params["id"])?$params["id"]:null;
        $record = new $this->Model($id);
        $record->assignFromPost();
        $record->save();
        
        $selected_ids = $this->input->post("selected_ids");
        $qty = $this->input->post("qty");
        
        $record->delete_product($record->product->get()->all);
        foreach($selected_ids as $k => $selected_item){
            if(!empty($selected_item)){
                $p = new Product($selected_item);
                $record->save($p);
                $record->set_join_field($p,"qty",$qty[$k]);
                // set the price at which it was sold
                $record->set_join_field($p,"cost",$p->cost);
            }
        }
        
        
        
        redirect("$this->dir/$this->controller");
       
       
        
    }
    
    function lista(){
        
        $div = new Div();
            //$div->setStyle("border:1px solid red");
        
            $addLink = site_url("$this->dir/$this->controller/form/");
            $newPatientLink = new Anchor($this->add_label,$addLink);
            $newPatientLink->setClass("btn btn-default btn-large pull-right");
            $newPatientLink->setStyle("margin-bottom:10px;");
            $div->add($newPatientLink);
        
        
            $list = $this->getListOfRecords();
            $div->add($list);
        
        
       
        
        return $div;
        
    }
    
    function form(){
     $params = params(3);
//        print("<br><br><br>");
//        print_r($params);
       //p($params); 
       //die();
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
        
        $patient = new $this->Model();
        $all = $patient->get()->all;
        $table = $this->entable($all);
        
        return $table;
        
        
    }
   
    
   
   function entable($all){
       
       $table = new Table();
    
       $table->setClass("table table-striped table-bordered");
       $header = new Tr();
       
       $th = new Th("No. de Orden");
       $header->add($th);
       
       
       
       $th = new Th("");
       $header->add($th);
       
       
       $table->add($header);
       foreach ($all as $key=> $record){
            $tr = new Tr();
            
            $td = new Td($record->id);
            $tr->add($td);   
            
            
           
            $td = new Td($record->getProvider());
            $tr->add($td);   
             $editArgs[getDir()]= $this->getControllerName();
            $editArgs["form"]="action";
            $editLink = $record->getEditLink($editArgs);
            
            $edit = new Anchor("Modificar",$editLink);
            $edit->setClass("btn btn-default");
            $td = new Td($edit);
            $tr->add($td);   
            
            $td = new Td($record->created);
            $tr->add($td);   
            
            
            
                
            $table->add($tr);
           
       }
       
       
       return $table;
   }
    
   function getControllerName() {
       return strtolower(__CLASS__);
   }   
   
   
    function addStudyRows($table,$record,$rows= 20){
        
        
        $children = $record->product->include_join_fields()->get()->all;
        
        $tr = new Tr();
        $th = new Th("");
        $th->setStyle("width:50px");
        $tr->add($th);
        
        $th = new Th("Modelo/SKU");
        $th->setStyle("text-align:center");
        $tr->add($th);
        
        $th = new Th("Cantidad");
        $th->setStyle("text-align:center;width:70px;");
        $tr->add($th);
        
        $th = new Th("Costo Unidad");
        $th->setStyle("text-align:center;width:70px;");
        $tr->add($th);
        
        $th = new Th("");
        $th->setStyle("text-align:center");
        $tr->add($th);
        
        
        
        
        
        
        $table->add($tr);
        
        for($i=0; $i<$rows; $i++){
            
            $child = isset($children[$i])?$children[$i]:NULL;
            
            $tr = new Tr();
            $tr->setId(isset($child->unique)?$child->unique:"");
            
            if (!is_null($child))
                $image = $child->getImage(FALSE,$dim=50);
            else 
                $image = "";
            $td = new Td($image);
            $td->setClass("image");
            $tr->add($td);
            
            $input = new Input("estudios[]",isset($children[$i]->modelo)?$children[$i]->getDescription():"");
            if ($i==0){
                $input->setAttr("required","required");
            }
            $input->setAttr("id","");//need to store here the id of the study with JS 
            $input->setClass("form-control studies a_row");
            //$input->setStyle("height:26px");
            $td = new Td($input);
            $tr->add($td);
            
            $input = new Input("qty[]",isset($child->join_qty)?$child->join_qty:"","number");
            $input->setAttr("min",1);
            $input->setAttr("autocomplete","off");
            
            $input->setAttr("placeholder","cantidad");
            $input->setStyle("width:70px;text-align:right");
            $input->setClass("form-control qty");
            $td = new Td($input);
            $td->setStyle("width:80px;text-align:center");
            $tr->add($td);
            
            $input = new Input("price[]",isset($child->cost)?$child->cost:"","number");
            $input->setAttr("min",1);
            $input->setAttr("placeholder","precio");
            $input->setStyle("width:100px;text-align:right");
            $input->setClass("form-control price");
            
            $hidden_input = new Input("selected_ids[]",isset($child->unique)?$child->unique:"","hidden");
            $hidden_input->setClass("selected_id");
            $td = new Td($input." ".$hidden_input);
            $td->setStyle("width:110px;text-align:center");
            $tr->add($td);
            
            $removeURL = '#';
            $deleteItem = new Anchor("<i class='ti-trash'></i>",$removeURL);
            $deleteItem->setAttr("deletes",isset($child->unique)?$child->unique:"");
            $deleteItem->setClass("removeItem");
            
            $td = new Td($deleteItem);
            $td->setStyle("vertical-align:middle");
            $tr->add($td);
            
            $table->add($tr);
        }
        
        return $table;
        
    }
    
     function getJs() {
       
       
      // die("diyonddddg");
       if ($this->view=='receipt'){
            $data["nothing"]="nothing";
            return $this->load->view("js/receipts/receipts_js.php",$data,true);
           
       }
       
         
         
        $data["products"]= $this->getProducts();
       
        
        return $this->load->view("js/orders/orders_js.php",$data,true);
   
        
   } 

   function getProducts(){
       
        $records = new Product();
        $records->get()->all;
        $records_array = array();
        foreach($records as $record){
            $records_array[]=array("id"=>$record->getId(),
                                    "price"=>$record->cost,    
                                    "modelo"=>$record->modelo,    
                                    "description"=>$record->getDescription(),    
                
                                    "image"=>$record->getImageSrcThumb(),    
                
                                    "name"=>$record->getFullName());
        }
        
        
        $p = json_encode($records_array);
       return $p;
   }
   
   function receipt($id=null){
       $this->order_id = $id;
       $this->view = "receipt";
       $this->index();
       
       
   } 
    
   function receiptForm(){
       
       $form = new Formelement();
       $form->setClass("form-horizontal");
       $action = site_url2("orders/save_receipt");
       $form->setAttr("action",$action);
        //$form->setStyle("border:1px solid red");
       
       $order = new Order($this->order_id);
      
       
       $receipt =  $order->getReceiptTable();
       
      
      
        
       
        $config["class"]='form-group another-class';
            $children=array(
               
                array('element'=>$receipt,'class'=>'col-md-12'),//crea un div
        
                
            );
        
        $config["children"]=$children;
        $fg = new BSFormGroup($config);
       
        $form->add($fg);
       
        $input = new Input("factura","","text");
        $input->setClass("form-control");
        $label = new BSLabel("Factura");
        
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
        
        $label = new BSLabel("Bodega");
        
        
        $d = new Depot();
      
        $options = $d->allToIdName();
        
        
        $input = new DD("depot_id",$options);
        $input->setClass("form-control");
        
        $label->setClass("col-md-2 form-label");
        $config["class"]='form-group another-class';
            $children=array(
                "label"=>$label,// si la mando en array, la va a envolver en un div
                array('element'=>$input,'class'=>'col-md-4'),//crea un div
               
                
            );
        
        $config["children"]=$children;
        $fg = new BSFormGroup($config);
       
        $form->add($fg);
        
        
        
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
       
       // hide the order id 
       $input = new Input("order_id",$order->id,"hidden");
       $form->add($input);
       
       return $form;
       
       
   }
   
   
   function save_receipt(){
       
       
        //p($_POST);
       
        //pd($_FILES);
       
        $params = params();
       // pd($params);
        
        $receipt = new Receipt();
        
        $receipt->assignFromPost();
        
        $receipt->save();
        
        
        
        $received= $this->input->post("received");
        
        foreach($received as $productkey => $product_qty){
            
            $p = new Product($productkey);
            $receipt->save($p);
            $receipt->set_join_field($p,'qty', $product_qty);
            //save the price in the order as well
            $receipt->set_join_field($p,'cost', $p->cost);
            
        }
        //pd($_FILES);
        //// upload and save factura
        $file_name = "comprobante";
        if (!empty($_FILES[$file_name]['name'])){
            $upload_data = $this->do_upload($file_name);
            if (isset($upload_data["file_name"])){
                
                $image = new Image();
                // save in the images table the properties of the saved image
                foreach($upload_data as $keyI=>$valI){
                    $image->$keyI = $valI;
                }
                $image->save();
                $receipt->save($image);
            }
        }
        // llenar el stock 
        
        
        
        redirect(site_url2("receipts/"));
       
   }
   
}