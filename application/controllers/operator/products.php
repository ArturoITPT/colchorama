<?php
require_once APPPATH.'/controllers/super_controller.php';
class Products extends super_controller{
    
    private $view = "list";
    private $id = null;
    private $Model = "Product";
    private $insertLabel = "Agregar Producto";
    private $views=array("form"=>'operator/products/form_product');
            
    function getWrapper($content=""){
        //die("***");
        $div = new Div();
        $div->setClass("row");
        //$div->setStyle("margin-top:80px;");
        
        $cols = new Div();
       
        $cols->setClass("col-md-12");
        //$cols->setStyle("border:1px solid #ccc");
        
        
        $h1 = new H1("Productos");
        
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
    /*as this is tto complicated, i will resort on a traditional view*/
    function formContent(){
        
        $record = new $this->Model($this->id);
        $id = !empty($this->id)?"id/$this->id":"";
        $action = site_url("operator/".$this->getControllerName()."/save/$id");
        
        $data["record"]=$record;
        $data["action"]=$action;
        
        
        
        $form = $this->load->view($this->views['form'],$data,true);
        
        return $form;
        
    }
    function FormElement($labelContent, $input){
        
        $div= new Div();
        $div->setClass("form-group");
            $label = new Label($labelContent);
            $label->setClass("col-sm-2 control-label");
        $div->add($label);
        $divInput = new Div();
        $divInput->setClass("col-sm-4");
        
        $divInput->add($input);
       // $div->add(new Br());    
        $div->add($divInput);
        
        
        return $div;
        
        
        
    }
    function save(){
        //echo "p save";
        //p($_POST);
        //pd($_POST);
        $params = params(2);
        //p($params);
        $id = isset($params["id"])?$params["id"]:null;
        $record = new $this->Model($id);
        
        $provider_id = $this->input->post("provider_id",null);
        if ($provider_id==''){
            unset($_POST['provider_id']);
        }
        if (isset($_POST['garantee']) and $_POST['garantee']=='')
            $_POST['garantee']=0;
        
         if (isset($_POST['created']) and $_POST['created'] =='')
            $_POST['created']=@date("Y-m-d");
        
        if (isset($_POST['brand_id']) and $_POST["brand_id"]==''){
            unset($_POST["brand_id"]);
        }
        $record->assignFromPost();
        $record->save();
       
        
        
        //echo "pro--";
        //var_dump($_POST['provider_id']);
        //die("ppro");
       
        if (!empty($provider_id)){
            $provider = new Provider($provider_id);
            $record->save($provider);
        }
        
        $category = new Category($this->input->post("category_id"));
        $record->save($category);
       
        /// save image
        if (!empty($_FILES['image']['name'])){
            $upload_data = $this->do_upload("image");
            if (isset($upload_data["file_name"])){
                
                $image = new Image();
                // save in the images table the properties of the saved image
                foreach($upload_data as $keyI=>$valI){
                    $image->$keyI = $valI;
                }
                $image->save();
                $record->save($image);
            }
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
        
        $record = new $this->Model();
        $all = $record->get()->all;
        $table = $this->entable($all);
        
        return $table;
        
        
    }
   
    
   
   function entable($all){
       
       $table = new Table();
       $table->setClass("table table-striped table-bordered");
       $header = new Tr();
       
       $th = new Th("");
       $header->add($th);
       
       
       
       $th = new Th("Modelo");
       $header->add($th);
       
       $th = new Th("Nombre/SKU");
       $header->add($th);
       
       $th = new Th("Costo base");
       $header->add($th);
       
       $th = new Th("");
       $th->setStyle("width:200px");
       $header->add($th);
       
       $table->add($header);
       
       foreach ($all as $key=> $record){
            $tr = new Tr();
            
                $td = new Td($record->getImage(false,50));
                $tr->add($td);
            
                $td = new Td($record->modelo);
                $tr->add($td);   
            
                
                $td = new Td($record->getFullName());
                $tr->add($td);
                
                $td = new Td(nf($record->cost));
                $td->setStyle("text-align:right");
                $tr->add($td);
              
                $editParams["operator"]=$this->getControllerName()."/form";
                $editLink = $record->getEditLink($editParams);
                
                
                $edit = new Anchor("Modificar",$editLink);
                $edit->setClass("btn btn-default");
                $delParams["operator"]=$this->getControllerName()."/del";
                $delLink = $record->getDelLink($delParams);
                
                $del = new Anchor("Borrar",$delLink);
                $del->setClass("btn btn-default deleteMe");
                $td = new Td($edit." ".$del);
                $td->setStyle("text-align:center");
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
        return $this->load->view("js/products/products_js.php",$data,true);
   }
   
   function del(){
       $params = params(4);
      
       $product = new Product($params["id"]);
       $product->deleted=1;
       $product->save();
       redirect(site_url2("products"));
   }
}