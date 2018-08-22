<?php

function getuserid(){
    
    $ci = & get_instance();
   
    //p($ci->session->userdata);  
    //p($_SESSION); 
    
    $u = $ci->session->userdata("user_id");
    ///echo "//// in session [$////]";
    
    return $u;
}
function getprofile($dir = 'admin'){
    
    $ci = & get_instance();
   
    //p($ci->session->userdata);  
    //p($_SESSION); 
    
    $data = $ci->session->userdata("profile");
   
    return $data;
}

function message($message = ""){
    
    $ci = & get_instance();
   
    
    $data = $ci->session->user_flashdata("profile");
    ///echo "//// in session [$////]";
    return $data;
}