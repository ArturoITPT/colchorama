<?php

trait msession {


    function exist($key)
    {
        
        //dvd($_SESSION);
        if (!empty($_SESSION($key))){
          return true;
        }
        else
            return FALSE;
    }

    function sess_set($key,$value){

        $_SESSION[$key]=$value;
    }
    
    // todo , redirect to proper dir, either teacher , admin ,student, super admin
    function sess_get($key,$force=false,$redirect = 'admin/log/in'){
        if (!empty($_SESSION[$key])){
            return $_SESSION[$key];
        }
        else{

            if ($force)
                redirect($redirect);
            else
            return false;
        }
    }
    
    function set($key,$val){
        $this->session->set_userdata($key,$val);
    }
    function get($key){
        //echo "gettt";
        return $this->session->userdata($key);
    }
    function flash($key,$val=null){
        
        if (is_null($val)){
            return $this->session->flashdata($key); 
        }
        else{
            $this->session->set_flashdata($key,$val);
        }
       
    }
    function sess($key,$val=null){
        if (is_null($val)){
            return $this->session->userdata($key); 
        }
        else{
            $this->session->set_userdata($key,$val);
        }
    }
    
   
    function getUserId(){
       $id =  $this->get('user_id');
      
      // pd($this->session->userdata);
        if (empty($id)){
          $id=  $_SESSION['user_id'];
          if (empty($id))
              redirect (site_url2("log/in"));
        }
        else{
            return $id;
        }
        
    }
    
    function log($type,$message){
        
        $data['type']=$type;
        $data['content']=$message;
        $data['date']=@date("Y-m-d H:i:s");
        $this->db->insert("logs",$data);
    }
    /*uses $_SESSION instead of frameworks*/
    function _sess($key,$val = null){
         
        if (!is_null($val)){
            $_SESSION[$key]=$val;
        }
        else{
            return $_SESSION[$key];
        }
        
        
    }
    
    
}