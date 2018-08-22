<?php


class Log extends MY_Controller{
    
    function in(){
        
        $this->index();
        
    }
    
    function out(){
        
        session_destroy();
        $this->session->sess_destroy();
        redirect(site_url2("log/in"));
        
    }
    
    function check(){
        //p($_POST);
        $password = $this->input->post("password");
        $username = $this->input->post("email");
        
        $user = new User();
        $user->where("username",$username);
        $user->where("password",$password);
        $user->get();
        
        if(!empty($user->id)){
            //echo $user->name;
            //die();
            
            cisess("user_id", $user->id);
            redirect(site_url2("dashboard"));
        }
        else{
            message2_("Nombre de usuario o contraseña incorrectas");
            redirect(site_url2("log/in"));
            
        }
        
        
        
    }
    function getSide(){
        return;
    }
    function getLayout() {
        return "light/login_layout";
    }
    function getHead(){
        
        return "";
    }
    function getContent(){
        
        return "";
    }
    function getJs(){
        
    }
}