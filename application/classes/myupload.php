<?php


trait MyUpload {
    
  
    function myupload($record){
        
        //make sure we have the dirs to write to 
        $this->set_directories();
        

        // since it is going to be used in the controller
        // it knows the load property
        $this->load->library("upload");
        
        $file_name = $record->images['field_name'];
        $upload_folder = $record->images['upload_folder'];
        $column_name = $record->images['column_name'];
        
        //die($upload_folder);//i.e. uploads/colegio_europeo
        $config['upload_path'] = $upload_folder;
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_size']     = '10000';
        $config['max_width'] = '2048';
        $config['max_height'] = '1200';

        $this->upload->initialize($config);    
        
        if(!$this->upload->do_upload($file_name,$upload_folder)){
            $error = array('error' => $this->upload->display_errors());
            //var_dump($error);
           // die();
        }
        else{
            
           $upload_data = $this->upload->data();
           $size_folder='medium';
           $file_name = $upload_data['file_name'];
           $record->$column_name = $file_name;
           $record->save();
           $this->resize($upload_data['full_path'],$file_name,$upload_folder,'medium');
           $this->resize($upload_data['full_path'],$file_name,$upload_folder,'small');
           $this->resize($upload_data['full_path'],$file_name,$upload_folder,'square');
           
           //$path = $_SERVER['DOCUMENT_ROOT'].'/s/uploads/original/'.$file_name;
           //die(); 
        }
       
        
    }
    
    /*size and folder are the same, for instance, there must be a medium folder for the medum size images
    a small folder for small size and so for, sizes in config/images.php
     *      */
    
    
    public function resize($original,$name,$folder,$size="medium") {
        
        // basic info
        $path = $folder."/"."$size/";
        // die($path);
        $pathinfo = pathinfo($path);
        //$size = "small";
       // $original = $pathinfo["dirname"] . "/" . str_ireplace("-" . $size, "", $pathinfo["basename"]);
        
        // original image not found, show 404
        if (!file_exists($original)) {
            show_404($original);
        }
        
        // load the allowed image sizes
        $this->load->config("images");
        $sizes = $this->config->item("image_sizes");
        $allowed = FALSE;
        
        if (stripos($size, "x") !== FALSE) {
            // dimensions are provided as size
            @list($width, $height) = explode("x", $size);
            
            // security check, to avoid users requesting random sizes
            foreach ($sizes as $s) {
                if ($width == $s[0] && $height == $s[1]) {
                    $allowed = TRUE;
                    break;
                }
            }
        } else if (isset($sizes[$size])) {
            // optional, the preset is provided instead of the dimensions
            // NOTE: the controller will be executed EVERY time you request the image this way
            @list($width, $height) = $sizes[$size];
            $allowed = TRUE;
            
            // set the correct output path
            //$path = str_ireplace($size, $width . "x" . $height, $path);
            
           // die($path);
        }
        //var_dump($allowed);
        //die();
        // only continue with a valid width and height
        if ($allowed && $width >= 0 && $height >= 0) {
            // initialize library
            $config["source_image"] = $original;
            $config['new_image'] = "$path$name";
            //die($config['new_image']);
            $config["width"] = $width;
            $config["height"] = $height;
            $config["dynamic_output"] = FALSE; // always save as cache
            
            $this->load->library('image_lib');
			$this->image_lib->initialize($config);
			
            $this->image_lib->fit();
        }
        
        
    }
    function set_directories(){
       
        
    }
    
     function set_document_directory(){
        
    }
    
    function mk_dir($base){
        if (!file_exists($base)) {
                mkdir($base, 0777, true);
               // echo "creted[$base]";
        }
    }
    
    function upload_document($record){
        $base = $this->set_document_directory();
        
         // since it is going to be used in the controller
        // it knows the load property
        $this->load->library("upload");
        
        $upload_folder= $base."/documents";
       // die($upload_folder);
        $file_name='filename';// this is the field column in table documents
        //die($upload_folder);//i.e. uploads/colegio_europeo
        $config['upload_path'] = $upload_folder;
        $config['allowed_types'] = 'gif|jpg|png|pdf';
        $config['max_size']     = '10000';
        $config['max_width'] = '2048';
        $config['max_height'] = '1200';

        $this->upload->initialize($config);    
        
        if(!$this->upload->do_upload('file',$upload_folder)){
            $error = array('error' => $this->upload->display_errors());
            //var_dump($error);
            p($error);
            die("Ocurrio un error al subir el archivo ");
        }
        else{
            
           $upload_data = $this->upload->data();
           $size_folder='medium';
           $file_name = $upload_data['file_name'];
          
           $document = new Document();
           $document->filename = $file_name;
          // full_path
           $document->is_image = $upload_data['is_image'];
           $document->full_path = $upload_data['full_path'];
           $document->save($record);
           
           
           //$path = $_SERVER['DOCUMENT_ROOT'].'/s/uploads/original/'.$file_name;
           //die(); 
        }
       
        
        
        
    }
    
}