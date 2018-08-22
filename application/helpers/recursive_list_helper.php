<?php 

require_once APPPATH."classes/template.php";

/*give it the tree of nodes, and it will get you back the UL list */
function recursive_li_items($tree,$level = 0){
    
   echo  $this->parser->parse("admin/menu_lis",null,true);
    
    
}

/*give it the tree of nodes, and it will get you back the UL list */
function recursive_li_itemss($tree,$level = 0){
    $path = APPPATH."views/admin/menu_li.php";
   // echo $path;
    //p($records,"records");
    $li = '<ul>';
    $out = array();;
    foreach ($tree  as $node) {
        $t = new SimpleTemplate($path);
        $t->set("element", $node->getFullName());
        $out[]=$t;
        $li.="<li>{$node->getFullName()}</li>";
    }
    $li.="</ul>";
    return SimpleTemplate::merge($out);
    
    
}

function print_ul($records,$level = 0){
    
    //p($records,"records");
    $max_depth = 5;
    
    foreach($records as $record){
        $element = new Menu($record['id']);
       // e( $element::$dir,"ELEMENT DIR");
        
        
        echo "<ul>
                <li >
                    <a href='".site_url($element->getUrl())."'>{$record['name']}</a>
                </li>";
        echo "</ul>";
        if (!empty($record['children'])){
            print_ul($record['children'],$level+1);
        }
        
    }    
    
}

function padsd($times){
    $l="";

    for($i=0;$i<$times;$i++){
        $l.="<td style='width:80px' align='center'>-</td>";
    }
    
    return $l;
}