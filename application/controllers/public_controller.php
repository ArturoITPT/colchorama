<?php

require_once APPPATH.'/controllers/super_controller.php';

class public_controller extends  super_controller{

    public $requires_log_in = false;

    public $theme_path = "public/front/theme/";
    public $assets_path = "themes/front/assets/";
    public $view = 'home';
            
    function __construct()
    {

        parent::__construct();
    }

    function Content()
    {
        $data['data']='Data';
        
        return $this->load->view($this->theme_path.''.$this->view,$data,true);
    }
     function buildPage()
    {

        $data['js']=$this->Scripts();
        $data['css']=$this->Css();
        $content = $this->Content();

       
        $data['dir']=$this->dir;
        $data['content']=$content;
        $data['subtitle']="Subtitle";
       // $data['menu_items']=$this->MenuItems();
        
        $data['assets_path']= $this->assets_path;
        
        return $this->load->view("{$this->dir}/{$this->getLayout()}",$data,true);
    }
    
    function getMainContent(){
    
       return "nada";
        
    }
    
    function getLayout($file='layout') {
        return $this->theme_path.$file;
        return 'layout';//return ($this->theme_path.$file);
    }
    /*public class dont depend on model */
    function init(){

    }
    function Lists()
    {

    }
    function MenuItems(){
        
        return "";
        
    }
    
    function getControllerName() {
        return strtolower(__CLASS__);
    }
}