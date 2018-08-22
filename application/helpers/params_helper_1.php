<?php

function params($offset=1){
    
        $ci =& get_instance();
        
        $params = $ci->uri->uri_to_assoc($offset);
        return $params;
    
}
function spl($string){

    return preg_split("[:]",$string);

}
function uri($params){

    $ci =& get_instance();

    $params = $ci->uri->assoc_to_uri($params);
    return $params;

}
function parse_redirect($uri){

    return str_replace(':','/',$uri);

}

function assoc($string_of_params){



}

function getDir(){
    
    $params = params(1);
    
    //p($params);
    $d = key($params);
    //echo $d;
    
    return $d;
}

function getController(){
    
    $params = params(2);
    
    $d = key($params);
    
    if (!empty($d))
    
    return $d;
    else{
        j("Error. No Controller FOUNd");
        die("Error. No controller Found! ");
    }
}

function site_url2($uri){
    
    return site_url()."/". getDir()."/$uri";
    
}