<?php
require_once APPPATH.'/controllers/super_controller.php';
class Brands extends super_controller{
    
    private $view = "list";
    private $id = null;
    private $Model = "Brand";
    private $insertLabel = "Agregar Marca";
    protected $title = "Marcas";
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
       
       
       
        $label = "Nombre";
        $input = new Input("name",$record->name,'text','form-control');
        $input->setAttr("required","required");
        
        $element = $this->FormElement($label,$input);     
        $form->add($element);
        
        $label = "Status";
        $options = array("active"=>"Activo","inactive"=>"Inactivo");
        $input = new Multiselect("status",$options, array(0=>$record->status));
        $input->setAttr("required","required");
        $input->setClass("form-control");
        $element = $this->FormElement($label,$input);     
        $form->add($element);
       
        $label = "Productos";
        $options =  $record->getAllProducts();
        $selected_options= $record->getSelectedProducts();         
                
                
        $input = new Multiselect("products[]",$options, $selected_options);
       // $input->setAttr("required","required");
        $input->setAttr("multiple","muliple");
        
        $input->setClass("form-control multi");
        $element = $this->FormElement($label,$input);     
        $form->add($element);
       
        
        
       
        
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
        //pd($_POST);
        $params = params(2);
        //p($params);
        $id = isset($params["id"])?$params["id"]:null;
        $record = new $this->Model($id);
        $record->assignFromPost();
        $record->save();
        
        // save selected marcass
        $children = $this->input->post("products");
        $record->delete_product($record->product->get()->all);
        foreach ($children as $key => $child) {
            //echo "[--[ it is and id $child}]";
            $b = new Product($child);
            //echo "id is $b->id" .$b->getFullName();
            $record->save($b);
        }
        
        
        redirect("operator/".$this->getControllerName());
       
       
        
    }
    
    function lista(){
        
        $div = new Div();
            //$div->setStyle("border:1px solid red");
        
            $addLink = site_url("operator/".$this->getControllerName()."/form/");
            $newPatientLink = new Anchor($this->insertLabel,$addLink);
            $newPatientLink->setClass("btn btn-default btn-large pull-right");
            $newPatientLink->setStyle("margin-bottom:10px;");
            $div->add($newPatientLink);
        
        
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
        
        $patient = new $this->Model();
        $all = $patient->get()->all;
        $table = $this->entable($all);
        
        return $table;
        
        
    }
   
    
   
   function entable($all){
       
       $table = new Table();
       $table->setClass("table table-striped table-bordered");
       $header = new Tr();
       
       $th = new Th("Nombre");
       $header->add($th);
       
       
       
       $th = new Th("");
       $header->add($th);
       
       
       $table->add($header);
       foreach ($all as $key=> $patient){
            $tr = new Tr();
            
                $td = new Td($patient->getFullName());
                $tr->add($td);
                
              
                $editParams["operator"]=$this->getControllerName()."/form";
                $editLink = $patient->getEditLink($editParams);
                $edit = new Anchor("Modificar",$editLink);
                $td = new Td($edit);
                $tr->add($td);
                
                
            $table->add($tr);
           
       }
       
       
       return $table;
   }
    
   
   function getControllerName() {
       return strtolower(__CLASS__);
   }
    
   function getJs() {
       
        if ($this->view=='form')
        {
            $data[""]="";
            return $this->
                load->view("js/{$this->getControllerName()}/{$this->getControllerName()}_js.php",$data,true);
        }        
                
    }
    
   

}