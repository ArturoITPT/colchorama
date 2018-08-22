<?php

    function get_date_range($settings=array()){
        
        //$start,$end,$text,$textKey='title',$encode=true
        
        $start = empty($settings['start'])?die("must define start"):$settings['start'];
        $end = empty($settings['end'])?die("must define end"):$settings['end'];
        $textKey = empty($settings['textkey'])?'title':$settings['textkey'];
        $encode = isset($settings['encode'])?$settings['encode']:true;
        
        //var_dump($encode);
        
        $startKey = empty($settings['startKey'])?'start':$settings['startKey'];
        $endKey = empty($settings['endKey'])?'end':$settings['endKey'];
        $text = empty($settings['text'])?die("define text"):$settings['text'];
        $content = $settings['content'];
        
                
        
        $l=array();
        
        $begin = new DateTime( $start );
        $end = new DateTime($end );
        $end = $end->modify( '+1 day' ); 

        $interval = new DateInterval('P1D');
        $daterange = new DatePeriod($begin, $interval ,$end);

        foreach($daterange as $date){
            
            $date = $date->format("Y-m-d");
            
//            echo $date;
//            echo "<br>";
            $l[]=array($startKey=>$date,$endKey=>$date,$textKey=>$text,'content'=>$content);
        }
        if ($encode){
            return json_encode($l);
        }
        else {
            return $l;
        }
    }