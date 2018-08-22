<?php
require_once APPPATH.'/controllers/super_controller.php';
class Branches extends super_controller{
    
    private $view = "list";
    private $id = null;
    private $dir = 'operator';
    private $controller='branches';
    private $Model = 'Branch';
    protected $title = "Sucursales";
    private $add_label = "Agregar Sucursal";
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
        
        $record->where("unique", $this->id)->get();
        
       
        
        $id = !empty($this->id)?"id/$this->id":"";
        $action = site_url("$this->dir/$this->controller/save/$id");
        $form->setAttr("action",$action);
       
        //nombre y status
        $formGroup = $this->FormGroup();
        $label = $this->Label("Nombre",'col-md-2 control-label');
        $input = new Input("name",$record->name,'text','form-control');
        $inputWrapper = $this->Input($input, 'col-md-4');
        $formGroup->add($label);
        $formGroup->add($inputWrapper);
        
        $label = $this->Label("Status");
        $options = array("active"=>"Activo","inactive"=>"Inactivo");
        $input = new Multiselect("status",$options, array(0=>$record->status));
        $input->setClass("form-control");
        $inputWrapper = $this->Input($input, 'col-md-4');
        $input->setAttr("required","required");
        $input->setClass("form-control");
        $formGroup->add($label);
        $formGroup->add($inputWrapper);
        
        $form->add($formGroup);
        
        ///// addess  
        $formGroup = $this->FormGroup();
        $label = $this->Label("Dirección",'col-md-2 control-label');
        $input = new Textarea("address",$record->address);
        $input->setAttr("required","required");
        $input->setAttr("placeholder","Calle y Número");
        $input->setClass("form-control");
        $inputWrapper = $this->Input($input, 'col-md-4');
        $formGroup->add($label);
        $formGroup->add($inputWrapper);
        
        $label = $this->Label("Colonia",'col-md-2 control-label');
        $input = new Input("colonia",$record->colonia);
        $input->setAttr("required","required");
        $input->setClass("form-control");
        $inputWrapper = $this->Input($input, 'col-md-4');
        $formGroup->add($label);
        $formGroup->add($inputWrapper);
        
        
        $form->add($formGroup);
        // estados  / municipio starts
        
        $formGroup = $this->FormGroup();
            $label = $this->Label("Estado",'col-md-2 control-label');
            $input = new Dropdown("state_id",$record->getStates(),$record->state_id);
            $input->setAttr("required","required");
            $input->setId("state_id");
            $input->setAttr("updates","city_id");
            $input->setAttr("update_url", site_url("services/cities_service/get/{parent_id}/{child_id}"));
            
            
            
            $input->setAttr("placeholder","Calle y Número");
            $input->setClass("form-control");
            $inputWrapper = $this->Input($input, 'col-md-4');
        $formGroup->add($label);
        $formGroup->add($inputWrapper);
        
        $label = $this->Label("Ciudad/Municipio",'col-md-2 control-label');
            $input = new Dropdown("city_id",$record->getCities(),$record->city_id);
            $input->setAttr("required","required");
            $input->setId("city_id");
            
            $input->setAttr("placeholder","Calle y Número");
            $input->setClass("form-control");
            $inputWrapper = $this->Input($input, 'col-md-4');
        $formGroup->add($label);
        $formGroup->add($inputWrapper);
        
        
        $form->add($formGroup);
        
        // estados  / municipio ends
        // CP
        $formGroup = $this->FormGroup();
            $label = $this->Label("Codigo Postal",'col-md-2 control-label');
            $input = new Input("zipcode",$record->zipcode);
            $input->setAttr("required","required");
            $input->setClass("form-control");
            $inputWrapper = $this->Input($input, 'col-md-4');
            $formGroup->add($label);
            $formGroup->add($inputWrapper);

            $label = $this->Label("Telefono");
            
            $formGroup->add($label);
            
                $telOptions["fixed"]="Fijo";
                $telOptions["mobile"]="Celular";
                $dropdown = new Dropdown("phone_type",$telOptions,$record->phone_type);
                $dropdown->setClass("form-control");
                $inputWrapper = $this->Input($dropdown,'col-md-2');
            
            $formGroup->add($inputWrapper);
                
                $input = new Input("phone",$record->phone,"text");
                $input->setClass("form-control");
                $inputWrapper = $this->Input($input,'col-md-2');
            $formGroup->add($inputWrapper);
                
            
            
            
            
        
        $form->add($formGroup);
        
        
        //FRC
        $formGroup = $this->FormGroup();
        $label = $this->Label("RFC",'col-md-2 control-label');
        $input = new Input("rfc",$record->rfc,'text','form-control toUpperCase');
        $inputWrapper = $this->Input($input, 'col-md-4');
        $formGroup->add($label);
        $formGroup->add($inputWrapper);
        
        $label = $this->Label("Nombre Fiscal");
       
        $input = new Input("fiscal_name",$record->fiscal_name);
        $input->setClass("form-control");
        $inputWrapper = $this->Input($input, 'col-md-4');
        $input->setAttr("required","required");
        $input->setClass("form-control");
        $formGroup->add($label);
        $formGroup->add($inputWrapper);
        
        $form->add($formGroup);
        
        
        // submit button
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
        
        $params = params(2);
        //p($params);
        $id = isset($params["id"])?$params["id"]:null;
        $record = new $this->Model($id);
        $record->assignFromPost();
        $record->save();
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
     $params = params(2);
    // pd($params);
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
                
                
                
                $editParams["$this->dir"]="$this->controller/form";
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
    
    function action($params){
        
        $params = params(1);
        //p($params);
        //$this->index();
    }
   
    function getJs() {
        $data[""]="";
        return $this->load->view("js/branches/branches_js.php",$data,true);
    }
    
}