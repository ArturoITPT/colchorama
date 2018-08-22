<?php
require_once APPPATH.'/controllers/super_controller.php';
class Vehicles extends super_controller{
    
    private $view = "list";
    private $id = null;
    private $dir = 'operator';
    private $controller='vehicles';
    private $Model = 'Vehicle';
    protected $title = "Vehiculos";
    private $add_label = "Agregar Vehiculo";
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
                $input->setAttr("required","required");
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
        
        $formGroup = $this->FormGroup();
                $label = $this->Label("Modelo",'col-md-2 control-label');
                $input = new Input("modelo",$record->modelo,'text','form-control');
                $input->setAttr("required","required");
                $inputWrapper = $this->Input($input, 'col-md-4');
            $formGroup->add($label);
            $formGroup->add($inputWrapper);
        
            $label = $this->Label("Marca",'col-md-2 control-label');
                $input = new Input("marca",$record->marca,'text','form-control');
                   $input->setAttr("required","required");
                $inputWrapper = $this->Input($input, 'col-md-4');
            $formGroup->add($label);
            $formGroup->add($inputWrapper);
        
        $form->add($formGroup);
        
        $formGroup = $this->FormGroup();
                $label = $this->Label("Carroceria",'col-md-2 control-label');
                $input = new Input("carroceria",$record->carroceria,'text','form-control');
                $inputWrapper = $this->Input($input, 'col-md-4');
            $formGroup->add($label);
            $formGroup->add($inputWrapper);
        
            $label = $this->Label("Tipo",'col-md-2 control-label');
                $options = $record->getVehicleTypes();
                $selectedType = $record->getVehicleTypeSelected();
                $input = new Multiselect("vehicletype_id",$options, $selectedType);
                   $input->setAttr("required","required");
                $input->setClass("form-control");
                $inputWrapper = $this->Input($input, 'col-md-4');
                $input->setAttr("required","required");
                $input->setClass("form-control");
            $formGroup->add($label);
            $formGroup->add($inputWrapper);
        
        $form->add($formGroup);
        
        $formGroup = $this->FormGroup();
                $label = $this->Label("Medida de Uso",'col-md-2 control-label');
               
                $options = array("Kilometros"=>"Kilometros","Millas"=>"Millas",'Horas'=>"Horas");
                $selectedType = array($record->medidadeuso);
                $input = new Multiselect("medidadeuso",$options, $selectedType);
                $input->setClass("form-control");
                $inputWrapper = $this->Input($input, 'col-md-4');
                $input->setAttr("required","required");
                $input->setClass("form-control");
                
                
            $formGroup->add($label);
            $formGroup->add($inputWrapper);
        
            $label = $this->Label("Medida de combustible",'col-md-2 control-label');
                $options = array("Litros"=>"Litros","Galones"=>"Galones");
                $selectedType = array($record->medidadecombustible);
                $input = new Multiselect("medidadecombustible",$options, $selectedType);
                $input->setClass("form-control");
                $inputWrapper = $this->Input($input, 'col-md-4');
                $input->setAttr("required","required");
                $input->setClass("form-control");
            $formGroup->add($label);
            $formGroup->add($inputWrapper);
        
        $form->add($formGroup);
        
        $formGroup = $this->FormGroup();
                $label = $this->Label("Número de Serie",'col-md-2 control-label');
                $input = new Input("numerodeserie",$record->numerodeserie,'text','form-control');
                $input->setAttr("required","required");
                $inputWrapper = $this->Input($input, 'col-md-4');
            $formGroup->add($label);
            $formGroup->add($inputWrapper);
        
            $label = $this->Label("Placas",'col-md-2 control-label');
                $input = new Input("placas",$record->placas,'text','form-control');
                 $input->setAttr("required","required");
                $inputWrapper = $this->Input($input, 'col-md-4');
            $formGroup->add($label);
            $formGroup->add($inputWrapper);
        
        $form->add($formGroup);
        
        // companua de seguros y numero de poliza
      
        $formGroup = $this->FormGroup();
                $label = $this->Label("Aseguradora",'col-md-2 control-label');
                $input = new Input("aseguradora",$record->aseguradora,'text','form-control');
                 $input->setAttr("required","required");
                $inputWrapper = $this->Input($input, 'col-md-2');
            $formGroup->add($label);
            $formGroup->add($inputWrapper);
        
            $label = $this->Label("Número de Poliza",'col-md-2 control-label');
                $input = new Input("seguro",$record->seguro,'text','form-control');
                 $input->setAttr("required","required");
                $inputWrapper = $this->Input($input, 'col-md-2');
            $formGroup->add($label);
            $formGroup->add($inputWrapper);
            
            $label = $this->Label("Fecha de Vencimiento",'col-md-2 control-label');
            
            //var_dump($record->polizavence);
            if ($record->polizavence==NULL){
                //echo "fix it";
                $record->polizavence = date("Y-m-d");
            }
                //var_dump($record->polizavence);
                $vence  = date("d/m/Y",strtotime($record->polizavence));
                //echo "vence $vence";
                $input = new Input("polizavence",$vence,'text','form-control datepicker');
                 $input->setAttr("required","required");
                $inputWrapper = $this->Input($input, 'col-md-2');
            $formGroup->add($label);
            $formGroup->add($inputWrapper);
            
        $form->add($formGroup);
        
        //---
        $formGroup = $this->FormGroup();
                $label = $this->Label("Color",'col-md-2 control-label');
                $input = new Input("color",$record->color,'color','form-control');
                
                $inputWrapper = $this->Input($input, 'col-md-4');
            $formGroup->add($label);
            $formGroup->add($inputWrapper);
        
            $label = $this->Label("Kilometraje",'col-md-2 control-label');
                $input = new Input("kilometros",$record->kilometros,'text','form-control');
                $inputWrapper = $this->Input($input, 'col-md-4');
            $formGroup->add($label);
            $formGroup->add($inputWrapper);
        
        $form->add($formGroup);
        
        $formGroup = $this->FormGroup();
                $label = $this->Label("Conductor",'col-md-2 control-label');
                $options = $record->getAllDrivers();
                $selectedType = $record->getSelectedDriver();
                $input = new Multiselect("employee_id",$options, $selectedType);
                $input->setClass("form-control");
                $inputWrapper = $this->Input($input, 'col-md-4');
                $input->setAttr("required","required");
                $input->setClass("form-control");
                
                
            $formGroup->add($label);
            $formGroup->add($inputWrapper);
        
            $label = $this->Label("Servicio cada",'col-md-2 control-label');
                $input = new Input("servicio",$record->servicio,'text','form-control');
                $inputWrapper = $this->Input($input, 'col-md-4');
            $formGroup->add($label);
            $formGroup->add($inputWrapper);
        
        $form->add($formGroup);
        
        //verification
        $formGroup = $this->FormGroup();
                $label = $this->Label("Verificación",'col-md-2 control-label');
                $options = $record->getAllVerifications();
                $selectedType = $record->getSelectedVerification();
                $input = new Multiselect("verificationtype_id",$options, $selectedType);
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
        p($_POST);
        $params = params(2);
        //p($params);
        $id = isset($params["id"])?$params["id"]:null;
        $record = new $this->Model($id);
        
        $poliza = empty($_POST["polizavence"])?date("d/m/Y"):$_POST["polizavence"] ;
        #die($poliza);
        list($d,$m,$y) = preg_split("[/]", $poliza);
        
        $_POST["polizavence"] = "$y-$m-$d";
        
        if ($_POST['kilometros']=='')
            $_POST['kilometros']=0;
        
        if ($_POST['servicio']=='')
            $_POST['servicio']=0;
        
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
        return $this->load->view("js/{$this->getControllerName()}/{$this->getControllerName()}_js.php",$data,true);
    }
    
}