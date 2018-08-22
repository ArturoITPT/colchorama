<?php
require_once APPPATH.'/controllers/super_controller.php';
class Units extends super_controller{
    
    private $view = "list";
    private $id = null;
    private $dir = 'operator';
    private $controller='units';
    private $Model = 'Unit';
    protected $title = "Unidades de Medida";
    private $add_label = "Agregar Medida";
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
       
       
        $label = "Nombre";
        $input = new Input("name",$record->name,'text','form-control');
        $input->setAttr("required","required");
        
        
        $element = $this->FormElement($label,$input);     
        $form->add($element);
       
        $label = "Bodegas";
        $options = parent_model::options("Depot");
        $selected_branches = parent_model::selected($record->depot->get()->all);
        $select = new Multiselect("depots[]",$options,$selected_branches);
        $select->setAttr("multiple","multiple");
        $select->setClass("form-control");
        $element = $this->FormElement($label,$select);     
        $form->add($element);
        
        /// 
        $label = "Sucursales";
        $options = parent_model::options("Branch");
        $selected_branches = parent_model::selected($record->branch->get()->all);
        $select = new Multiselect("branches[]",$options,$selected_branches);
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
        
      
        
        $params = params(2);
        //p($params);
        $id = isset($params["id"])?$params["id"]:null;
        $record = new $this->Model($id);
        //echo $record->name;
        $record->assignFromPost();
        
        $record->save();
        
        $depots = $this->input->post("depots");
        $record->delete_depot($record->depot->get()->all);
        foreach ($depots as $key => $depot) {
            //echo "[--[$branch]";
            $b = new Depot($depot);
            $record->save($b);
        }
        
        $branches = $this->input->post("branches");
        $record->delete_branch($record->branch->get()->all);
        foreach ($branches as $key => $branch) {
            //echo "[--[$branch]";
            $b = new Branch($branch);
            $record->save($b);
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
       
       $th = new Th("Sucursales");
       $header->add($th);
       
        $th = new Th("Bodegas");
       $header->add($th);
       
       $th = new Th("");
       $header->add($th);
       
       
       $table->add($header);
       foreach ($all as $key=> $record){
            $tr = new Tr();
            
                $td = new Td($record->getFullName());
                $tr->add($td);
                
                
                $params_["operator"]="branches";
                $params_["action"]="list";
                
                $params_["parent_id"]=$record->unique;
                $bodega_uri = uri($params_);
                
                $linkBodegas = site_url($bodega_uri);
                
               
                $td = new Td($record->getDepots());
                $tr->add($td);
                
                $td = new Td($record->getBranches());
                $tr->add($td);
                
                $editParams["$this->dir"]="$this->controller/form";
                $editLink = $record->getEditLink($editParams);
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
        $data[""]="";
        return $this->load->view("js/companies/companies_js.php",$data,true);
        
    }
}