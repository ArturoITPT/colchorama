<?php

function p($object, $string  = ""){
    $bt =  debug_backtrace();
    echo "<pre> $string <br>\n";
    if (is_string($object)){
        echo "[$object] ";
    }
    else{
        print_r($object);
    }
    echo "\n";
    echo "Calling file: ". $bt[0]['file'] . ' line  '. $bt[0]['line'];
    echo "$string ends \n</pre>";
}
function pd($object, $string  = ""){
     $bt =  debug_backtrace();
    echo "<pre> $string function pd <br>\n";
    if (is_string($object)){
        echo "[$object] ";
    }
    else{
        print_r($object);
    }

    echo "Calling file: ". $bt[0]['file'] . ' line  '. $bt[0]['line'];
    echo "$string ends function pd \n</pre>";
    die();
}

function dvd($var){
    echo "var dump [";
    (var_dump($var));
    echo "]";
    die;
}
function vd($var){
    echo "var dump [";
    (var_dump($var));
    echo "]";
    //die;
}
function e_log($string , $mesasage=null){
     $l= "$string ,$mesasage ";
     $l.= get_caller_info();
     return $l;
}

function j($object,$message=null){
    //return;
    $bt =  debug_backtrace();
    $message =  "[$message] Calling file: ". $bt[0]['file'] . ' line  '. $bt[0]['line'];
    $object = json_encode($object, JSON_PRETTY_PRINT);
    echo '<script>console.log("'.$message.':")</script>';
    echo '<script>console.log('.$object.')</script>';
   
    
    
}
function e($object, $string  = ""){
    echo "<pre> $string begins -> <br>\n";
        $bt =  debug_backtrace();

    if (is_string($object)){
        
  
        
        echo "[[$object]] \n I am at \n: ";
    }
    else{
        print_r($object);
    }

    echo "Calling file: ". $bt[0]['file'] . ' line  '. $bt[0]['line'];
    echo "\n $string ENDS <- </pre>";
}
function ed($object, $string  = ""){
    $bt =  debug_backtrace();
    echo "<pre> $string <br>\n";
    if (is_string($object)){
        echo "[$object] ";
    }
    else{
        print_r($object);
    }

    echo "</pre>";
    echo "Calling file: ". $bt[0]['file'] . ' line  '. $bt[0]['line'];
    echo "\n $string ENDS <- </pre>";
    die();
}
function get_caller_info() {
    $c = '';
    $file = '';
    $func = '';
    $class = '';
    $trace = debug_backtrace();
    if (isset($trace[2])) {
        $file = $trace[1]['file'];
        $func = $trace[2]['function'];
        if ((substr($func, 0, 7) == 'include') || (substr($func, 0, 7) == 'require')) {
            $func = '';
        }
    } else if (isset($trace[1])) {
        $file = $trace[1]['file'];
        $func = '';
    }
    if (isset($trace[3]['class'])) {
        $class = $trace[3]['class'];
        $func = $trace[3]['function'];
        $file = $trace[2]['file'];
    } else if (isset($trace[2]['class'])) {
        $class = $trace[2]['class'];
        $func = $trace[2]['function'];
        $file = $trace[1]['file'];
    }
    if ($file != '') $file = basename($file);
    $c = $file . ": ";
    $c .= ($class != '') ? ":" . $class . "->" : "";
    $c .= ($func != '') ? $func . "(): " : "";
    return($c);
}

function nl(){
    echo '<br>';
}

function hr(){
    echo '<hr>';
}