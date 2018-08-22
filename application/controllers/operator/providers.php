<?php
require_once APPPATH.'/controllers/super_controller.php';
class Providers extends super_controller{
    
    private $view = "list";
    private $id = null;
    private $Model = "Provider";
    private $insertLabel = "Agregar Producto";
    protected $title = "Proveedores";
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
       
        $label = "Marca";
        $options = parent_model::options("Brand");
        $selected_branches = $record->getSelectedBrands();
        //p($selected_branches);
        $select = new Multiselect("brands[]",$options,$selected_branches);
        $select->setAttr("multiple","multiple");
        $select->setClass("form-control");
        $element = $this->FormElement($label,$select);     
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
       // pd($_POST);
        $params = params(2);
        //p($params);
        $id = isset($params["id"])?$params["id"]:null;
        $record = new $this->Model($id);
        $record->assignFromPost();
        $record->save();
        
        // save related marks
        $brands = $this->input->post("brands");
        $record->delete_brand($record->brand->get()->all);
        foreach ($brands as $key => $brand) {
            //echo "[--[$branch]";
            $b = new Brand($brand);
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
       
       $th = new Th("Marcas");
       $header->add($th);
       
       
       $th = new Th("");
       $header->add($th);
       
       
       $table->add($header);
       foreach ($all as $key=> $record){
            $tr = new Tr();
            
                $td = new Td($record->getFullName());
                $tr->add($td);
                $p = new Provider();
                
                $td = new Td($record->getSubtable('Brand'));
                $tr->add($td);
                
              
                $editParams["operator"]=$this->getControllerName()."/form";
                $editLink = $record->getEditLink($editParams);
                $edit = new Anchor("Modificar",$editLink);
                $td = new Td($edit);
                $tr->add($td);
                
                
            $table->add($tr);
           
       }
       
       
       return $table;
   }
    
    function getJs() {
        $data[""]="";
        return $this->load->view("js/providers/providers_js.php",$data,true);
        
    }
   function getControllerName() {
       return strtolower(__CLASS__);
   }
    

}