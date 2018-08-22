<?php



class EmailFactory{
    
    protected  $settings = array();
    protected $data;
    protected $template;
    protected $ci; 
    protected $email; 
    
    function __construct($settings) {
        $this->ci = & get_instance();
        $this->settings = $settings;
        foreach($settings as $key=> $value){
            
            $this->$key = $value;
            
        }
        
        
    }
    public function send(){
        
        $this->ci->load->library('email');

        $this->ci->email->from($this->email->from);
        $this->ci->email->to($this->email->to);
        $this->ci->email->subject($this->email->subject);
        
        $message = $this->ci->load->view($this->template, $this->data,true);
       
        $this->ci->email->message($message);

        $response = $this->ci->email->send();


        echo "sething emaul to {$this->email->to}";
        
        //$this->ci->email->print_debugger();
    }
    
}
