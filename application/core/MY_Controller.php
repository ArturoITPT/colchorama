<?php

abstract  class MY_Controller extends CI_Controller{
    
    
   function index(){
     
        echo $this->buildPage();
        
    }
    
    function buildPage(){
        //echo "building page ";
        $data["head"]= $this->getHead();
        $data["aside"]= $this->getSide();
        
        $data["content"]= $this->getContent();
        $data["js"]= $this->getJs();
        return $this->load->view($this->getLayout(),$data,true);
        
        
    }
    
    abstract function getLayout();
}