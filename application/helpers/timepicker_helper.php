<?php

function hourOption($selected = null){
    
    $l= "<option val=''></option>";

    // is mysql time format like 12:30:00
    if (!is_null($selected) and strpos($selected,':')!==false ){

        list($hour,$minute,$second) = preg_split("[:]",$selected);
        if ($hour>12)
        $selected = $hour-12;
        else
        $selected = $hour;

    }

    for($i=1;$i<=12;$i++){
        $sel='';
        if ($selected == $i){
            $sel ='selected';
        }
        $l.='<option  '.$sel.'>'.str_pad($i, 2, "0", STR_PAD_LEFT).'</option>';
    }

    return $l;

}

function minuteOption($selected = ''){

     //  echo "selected min[[ $selected ]]";
    $l= "";

    if (!is_null($selected) and strpos($selected,':')!==false ){

        list($hour,$minute,$second) = preg_split("[:]",$selected);

        $selected = $minute;
        //sdvd($selected);
        //var_dump($selected);
          //  die("min".$selected);   
       
        if ($selected=='00')
        {
            $selected = 0;
        }
        /*if I make it zero, it will always pick up zero */
        if ($hour == '00' and $minute==00){
          $selected= '';
        }
    }

    for($i=0;$i<60;$i=$i+5){
        //echo "i  is $i <br>";
        $sel='';
        //vd($selected);
        //vd($i);
        if (intval($selected) === $i ){
           
            $sel = "selected";    
        }
        $l.='<option '.$sel.'>'.str_pad($i, 2, "0", STR_PAD_LEFT).'</option>';
    }

    return $l;

}
function meridianOption($selected = ''){

    $l= "";
    $options['AM']='AM';
    $options['PM']='PM';

    if (!is_null($selected) and strpos($selected,':')!==false ){

        list($hour,$minute,$second) = preg_split("[:]",$selected);

        if ($hour>=13){
            $selected="PM";
        }
        else if ($hour!='00' or $minute!='00') {
            $selected="AM";
        }

    }


    foreach($options as $key=> $option){


        $sel='';
        if ($selected == $key){
            $sel ='selected';
        }
        $l.='<option '.$sel.' value="'.$option.'">'.$option.'</option>';
    }

    return $l;

}

/*selected null cause it could be zero */
function selectTime($name = "time",$selected = null){

    $l = "<select  name='{$name}[hour]' class='form-control' style='max-width:100px;display:inline-block' >";
    $l.= hourOption($selected);
    $l.='</select> ';

    $l.= "<select   name='{$name}[minute]' class='form-control' style='max-width:100px;display:inline-block' >";
    $l.= minuteOption($selected);
    $l.='</select> ';

    $l.= "<select   name='{$name}[meridian]' class='form-control' style='max-width:100px;display:inline-block' >";
    $l.= meridianOption($selected);
    $l.='</select>';

    return $l;

}

/* $time is like
 * [mon_beg] => Array
        (
            [hour] => 01
            [minute] => 00
            [meridian] => AM
        )
*/

function selectToTime($time = array()){
    
    //p($time);

    $hour = $time['hour'];
    $minute = $time['minute'];
    $meridian = $time['meridian'];
   // echo "h [$hour] m [$minute] me $meridian";
    if ($hour=="")
    {
        //echo "EMPTY";
        return NULL;
    }
    else
    {   
        //echo "Not empty";
        $t = strtotime("$hour:$minute $meridian");
        //echo "t is [$t]";
        
        $d =  date("H:i:s",$t);
        //echo "d is [$d]";
        return $d;
    }


}