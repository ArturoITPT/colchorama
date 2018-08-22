<?php 


function print_rows($children,$right_columns=null,$level=0,$colspan=5){
   //    p($children);
   
    foreach($children as $child){
        echo "<tr>";
        $max_dev = 5;
        echo padd($level);
        echo '<td colspan="'.($max_dev-$level).'" >'.$child->getFullName().'</td>';
        if (!empty($right_columns)){
            foreach($right_columns as $column){
                echo "<td>{$child->$column()}</td>";
            }
        }
        echo "</tr>";
        if (!empty($child->children)){
           print_rows($child->children,$right_columns,$level+1); 
        }
        
    }
    
}

function print_table($children,$right_columns=null){
    
    echo '<table border>';
    print_rows($children,$right_columns);
    echo '</table>';
    
}

function print_rows_old($records,$level = 0,$columns = array(),$model_name=null){
    
   //e("returnning");
    //return;
    //p($records,"records");
    $max_depth = 5;
    
    foreach($records as $record){
       //
        
        $object = new $model_name($record['id']); // this is from a tree
        echo "<tr>";
        //pd($record);
        echo padd($level);
        echo "<td colspan='".($max_depth-$level)."'>
        <a href='{$object->getEditLink()}'>{$record['name']}</a>
        </td>";
        if (!empty($columns)){
            $object = new  $model_name($record['id']);
            foreach($columns as $key=>$column){
                    echo $object->getColumn($column);
            }
        }
        echo "</tr>";
        if (!empty($record['children'])){
            
            print_rows($record['children'],$level+1,$columns,$model_name);
        }
        
    }    
    
}

function padd($times){
    $l="";

    for($i=0;$i<$times;$i++){
        $l.="<td >-</td>";
    }
    
    return $l;
}