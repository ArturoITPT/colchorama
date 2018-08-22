<?php



abstract class super_controller extends MY_Controller
{
   
    protected  $title = "Set title in child ";
    function __construct() {
        parent::__construct();
       
        $user_id = cisess("user_id");
        if (empty($user_id)){
            //echo "empty";
            redirect("operator/log/in");
        }
        
        
    }
    function getLayout() {
        return "light/layout";
    }
       
    function getSide(){
        $dir = getDir();
        if (empty($dir))
            $dir = 'operator';
        $data[""]="";
        //return ;
        return $this->load->view("$dir/menu",$data,true);
        
    }
    function getContent(){
        
        return "OK";
        
    }
    
    function getJs(){
        
        return "<!-- add js  -->";
        
    }
    function getHead(){
        
        return "<!-- get elements for head-->";
        
    }
    abstract function getControllerName();
    
    
    function do_upload($file_name)
    {
            $config['upload_path'] = './uploads/';
            $config['allowed_types'] = 'gif|jpg|png|pdf';
           // $config['max_size']	= '100';
            //$config['max_width']  = '1024';
            //$config['max_height']  = '768';

            $this->load->library('upload', $config);

            if ( ! $this->upload->do_upload($file_name))
            {
                
                
                return $this->upload->display_errors();
            }
            else
            {
                $data =  $this->upload->data();
                // resize 
                $config_resize['image_library'] = 'gd2';
                $config_resize['source_image']	= $data['full_path'];
                $config_resize['create_thumb'] = TRUE;
                $config_resize['maintain_ratio'] = TRUE;
                $config_resize['width']	= 75*2;
                $config_resize['height']	= 50*2;

                $this->load->library('image_lib', $config_resize); 

                $this->image_lib->resize();
                
                return $data;
                

            }
    }
    function Input($input,$class_wrapper='col-md-1'){
        
        $div = new Div($input);
        $div->setClass($class_wrapper);
        return $div;
        
    }
    function Label($label, $class='col-md-2 control-label'){
   
        $label = new Label($label);
        $label->setClass($class);
        return $label;
        
    }
    function FormGroup(){
        
        $div= new Div();
        $div->setClass("form-group");
           
        
        return $div;
        
        
        
    }
}