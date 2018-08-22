<?php

function index_test($obj,$path='tests/'){
    
    $class_methods = get_class_methods($obj);

            foreach ($class_methods as $method_name) {
                echo anchor(site_url($path.$method_name));
                echo "<br>";
                
            }
    
    
}