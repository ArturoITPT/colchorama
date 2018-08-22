<?php

/*code igniter session */

function cisess_keys(){

    $ci = &get_instance();
    return array_keys($ci->session->userdata);

}
function cisess_set_post_vars(){

    #echo "setting variables ";
    foreach ($_POST as $key=>$item):
        if (!empty($_POST[$key])){

            cisess($key,$_POST[$key]);

        }
    endforeach;

}


function cisess($key,$val=null){
    
    $ci = &get_instance();
    if (isset($val))
    $ci->session->set_userdata($key,$val);
    else{
        return $ci->session->userdata($key);
    }
    
}

function ciflash($key,$val=null){
    
    $ci = &get_instance();
    if (isset($val)){
        $ci->session->set_flashdata($key,$val);
        echo "setting $key ".implode(",", $val);
    }
    else{
        return $ci->session->flashdata($key);
    }
    
}


function cisess_out(){
    $ci = &get_instance();
    echo "<pre style='border:1px solid red'>CI cession \n";
    print_r($ci->session->userdata);
    echo "</pre>";
    
}

/*en el set es el message y la bandera 
en el get es vacio 
FLASH MESSAGE TO SHOW ERRORS, ALERTS, ETC
 *  */
function message_($message=null,$flag = MESSAGE_ERROR_){
    $std_object = new stdClass();
    if ($message){
        ciflash("message_", $message);
        ciflash("message_flag_", $flag);
    }
    else{
        
        $std_object->message =  ciflash("message_");
        $std_object->flag = ciflash("message_flag_");
    }
    
}

function message2_($message=null,$flag = MESSAGE_ERROR_){
    $std_object = new stdClass();
    if ($message){
        ciflash("message2_", $message);
        ciflash("message_flag2_", $flag);
    }
    else{
        
        $std_object->message =  ciflash("message2_");
        
        $std_object->flag = ciflash("message_flag2_");
        if(!empty($std_object->message))
        return _show_alert($std_object);
        
    }
    
}

function _show_alert($message){
    
    $flags[MESSAGE_ERROR_]='Error!';
    $flags[MESSAGE_ALERT_]='Alerta!';
    $flags[MESSAGE_INFO_]='Info!';
    $flags[MESSAGE_SUCCESS_]='Exito!';
   
    #these are class messages
    $alert[MESSAGE_ERROR_]='danger';
    $alert[MESSAGE_ALERT_]='warning';
    $alert[MESSAGE_INFO_]='info';
    $alert[MESSAGE_SUCCESS_]='success';
    
    $s = '
    <div class="alert alert-'.$alert[$message->flag].'">
    <strong>'.$flags[$message->flag].'</strong>  '.$message->message.'
    </div>
    ';      
            
    return $s;
}
