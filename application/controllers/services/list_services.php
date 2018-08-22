<?php


class List_services extends CI_Controller{
    
    function __construct() {
        parent::__construct();
    }
    
    function index(){
        
        
        $link = site_url("services/cities_service/get/21");
        $anchor = new Anchor("States  - cities ",$link);
        echo $anchor;
        echo new Br();
        $link = site_url("services/providers_service/get_brands/1");
        $anchor = new Anchor("Providers - brands",$link);
        echo $anchor;
        echo new Br();
        
        
        
    }
    
    
}

