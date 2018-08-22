<?php
require_once APPPATH.'/controllers/super_controller.php';



class Dashboard extends super_controller{
    
    function getContent() {
        return "Tablero";
    }
            
    
    function getControllerName() {
        return strtolower(__CLASS__);
    }
}