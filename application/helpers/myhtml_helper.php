<?php
/*textsearch diferente de los demas que extienden a Elem*/

class Elem{

    public $content;
    public $id=null;
    public $openTagO='';
    public $openTagC='';
    
    public $closeTag='';
    public $classes =array();
    public $styles=array();
    public $children=array();
    public $atts = '';
   


    function __construct($content=null,$class=null,$id=null)
    {
            
         if (is_array($content))
         {
             foreach($content as $el)
             {
                 if ($el instanceof Elem)
                 {
                     $this->children[]=$el;
                 }
             }
         }

         else if ($content instanceof Elem )
         {
          
           
             $content = strval($content); // internally call its toString;
            //echo $content."---";
             $this->children[] = $content;
             
         }

         else if (is_numeric($content))
         {
              $this->children[] = $content;
               
         }    
         
         
         else if(!is_null($content) and !empty ($content) and is_string($content)){
         $this->children[] = $content;
            // p($this->children);
         }


       
         $this->classes[]=$class;

         
         $this->id=$id;

         //p($this->classes);
      

    }

    
    
    
    function setContentAt($content,$index = 0)
    {
        $this->children[$index]=$content;
    }

    function setId($id)
    {
        $this->id=$id;
        return $this;
    }


    function addChild($element,$index = null)
    {
          
        if (is_null($element))
        {
            return;
        }
        
        $this->children[]=$element;
        return $this;

    }
    
    //alias for AddChild
    function add($element)
    {
        return $this->addChild($element);
        
    }

    function setStyle($style)
    {  
        
        if (empty($style)) return;

        if (is_string($style))
        {
            $style = new Style($style);
        }

        $this->styles[] = $style;
        return $this;
    }

    function setClass($class)
    {
        $this->classes[] = $class;
        return $this;
    }

    function  __toString() {

       //p($this->children);
        
        
        $style='';
        if (count($this->styles)){
             $style = implode($glue=' ',$this->styles);
        }

        $classes ='';
        if (count($this->classes)){
            $classes = implode($glue=' ',$this->classes);
        }

        $classes = trim($classes);

        $this->content = '';



        foreach($this->children as $child)
        {
           // echo "[$child]";
            
            if (is_a($child, 'stdClass'))
            {
            $this->content.='';
           
            }
            else
            $this->content.=$child."";
           


        }


        $o =  $this->openTagO;
        $atts=   "";

        if (is_string($this->atts))
        {
            $atts.=$this->atts;
        }



        if (isset($this->id)){
        $atts.=   ' id="'.$this->id.'"';
        }
        if (!empty($classes)){
        $atts.=  ' class="'.$classes.'"';
        }
        if (!empty($style)){
        $atts.= ' style="'.$style.'"';
        }
        $c=  $this->openTagC."";

        $div= $o.$atts.$c;

        $div.=  $this->content;
        $div.=  $this->closeTag;

        return $div;
    }
    
    
    function setAttr($attr,$val='')
    {
        if ($val=='')
         $this->openTagO.=$attr;
        else
        $this->openTagO.= ' '.$attr.'="'.$val.'" ';
    }

    
    function editable($bool=true){
        
        if (!$bool){
            
            $this->setAttr('readonly','readyonly');
            
        }
    }
}


class Meta extends Elem 
{
    function __construct($atts='')
    {
        $this->openTagO="<meta $atts  ";
        $this->openTagC='';
        $this->closeTag='/>';
        
    }
    
    function setAttr($attr,$value='')
    {
        if ( is_string($attr) )
        $this->openTagO.= ' '.$attr.'="'.$value.'" ';
        //else array 
        
    }
    
}


class Link extends Elem 
{
    function __construct($atts='')
    {
        
        
        $this->openTagO='<link '.$atts.' rel="stylesheet" type="text/css" ';
        $this->openTagC='';
        $this->closeTag='/>';
        
    }
    
    function setAttr($attr,$value='')
    {
        if ( is_string($attr) )
        $this->openTagO.= ' '.$attr.'="'.$value.'" ';
        //else array 
        
    }
    
}

class CssLink extends Elem 
{
    function __construct($path='')
    {
        
        
        $this->openTagO='<link href="'.$path.'" rel="stylesheet" type="text/css" ';
        $this->openTagC='';
        $this->closeTag='/>';
        
    }
    
    function setAttr($attr,$value='')
    {
        if ( is_string($attr) )
        $this->openTagO.= ' '.$attr.'="'.$value.'" ';
        //else array 
        
    }
    
}

class JsLink extends Elem 
{
    function __construct($path='')
    {
            
        
        $this->openTagO='<script src="'.$path.'"  type="text/javascript" ';
        $this->openTagC='';
        $this->closeTag='></script>';
        
    }
    
    function setAttr($attr,$value='')
    {
        if ( is_string($attr) )
        $this->openTagO.= ' '.$attr.'="'.$value.'" ';
        //else array 
        
    }
    
}
// version 2, no need for base 
class CssLink2 extends Elem 
{
    function __construct($path='')
    {
        
        $path = base_url().$path;
        $this->openTagO='<link href="'.$path.'" rel="stylesheet" type="text/css" ';
        $this->openTagC='';
        $this->closeTag='/>';
    }
    
}


class Emptyelement extends Elem
{
    
    function __construct($content,$atts="")
    {
        parent::__construct($content);
        $this->openTagO="";
        $this->openTagC='';
        $this->closeTag='';
    }
    
}

class JsLink2 extends Elem 
{
    function __construct($path='')
    {
            
        $path = base_url().$path;
        $this->openTagO='<script src="'.$path.'"  type="text/javascript" ';
        $this->openTagC='';
        $this->closeTag='></script>';
        
    }
   
}

class FinderIncludes  
{
    
    
   
    function __toString() {
        
        $js  = new JsLink2 ("js/admin/finder.js");
        $js2  = new JsLink2 ("js/admin/equalsize.js");
        
      
        $css = new CssLink2("css/admin/finder_table.css");
        
        return "$js $css $js2";
        
    }
   
}

class MyFinderIncludes  
{
    
    
   
    function __toString() {
        
        
        return (string) new FinderIncludes();
       
        
    }
   
}


class Html extends Elem
{
    public $doctype = '';
    public $extra = '';
    
    function __construct($content='',
                         $extra=null,
                         $doctype='<!DOCTYPE html>')
    {   
        $this->doctype = $doctype;
        
        $this->openTagO="{$this->doctype}".'<html '.$extra.' ';
        $this->openTagC='>';
        $this->closeTag='</html>';
      
        parent::__construct($content);
      
    }
    
    
    
}
class Head extends Elem
{
    function __construct($content='',$extra=null)
    {   
        
      
        parent::__construct($content);
        $this->openTagO='<head '.$extra.' ';
        $this->openTagC='>';
        $this->closeTag='</head>';
    }
    
}

class Pre extends Elem
{
    function __construct($content='',$extra=null)
    {


        parent::__construct($content);
        $this->openTagO='<pre '.$extra.' ';
        $this->openTagC='>';
        $this->closeTag='</pre>';
    }

}

class Title extends Elem
{
    function __construct($content='',$extra=null)
    {   
        
      
        parent::__construct($content);
        $this->openTagO='<title '.$extra.' ';
        $this->openTagC='>';
        $this->closeTag='</title>';
    }
    
}
class Body extends Elem
{
    function __construct($content='',$extra=null)
    {   
        
      
        parent::__construct($content);
        $this->openTagO='<body '.$extra.' ';
        $this->openTagC='>';
        $this->closeTag='</body>';
    }
    
}

class Script_ extends Elem
{
    function __construct($content='')
    {   
        
      
        parent::__construct($content);
        $this->openTagO='<script language="JavaScript" type="text/javascript" ';
        $this->openTagC='>';
        $this->closeTag='</script>';
    }
    
}




class H1 extends Elem
{

    function __construct($content,$atts="")
    {
        parent::__construct($content);
        $this->openTagO="<h1 $atts ";
        $this->openTagC='>';
        $this->closeTag='</h1>';
    }

}
class H2 extends Elem
{

    function __construct($content,$atts="")
    {
        parent::__construct($content);
        $this->openTagO="<h2 $atts ";
        $this->openTagC='>';
        $this->closeTag='</h2>';
    }

}


class H3 extends Elem
{

    function __construct($content,$atts="")
    {
        parent::__construct($content);
        $this->openTagO="<h3 $atts ";
        $this->openTagC='>';
        $this->closeTag='</h3>';
    }

}

class H4 extends Elem
{

    function __construct($content,$atts="")
    {
        parent::__construct($content);
        $this->openTagO="<h4 $atts ";
        $this->openTagC='>';
        $this->closeTag='</h4>';
    }

}

class H5 extends Elem
{

    function __construct($content,$atts="")
    {
        parent::__construct($content);
        $this->openTagO="<h5 $atts ";
        $this->openTagC='>';
        $this->closeTag='</h5>';
    }

}

class H6 extends Elem
{

    function __construct($content,$atts="")
    {
        parent::__construct($content);
        $this->openTagO="<h6 $atts ";
        $this->openTagC='>';
        $this->closeTag='</h6>';
    }

}


class Text extends Elem
{

    function __construct($content)
    {
        parent::__construct($content,null,null);
    }
    
}



class Input extends Elem {

    public $name;
    public $value;
    public $unique=null;
    function __construct($name,$value=null,$type='text',$class=null,$id=null,$extra=null)
    {
        $this->unique = uniqid();


            
        parent::__construct('',$class,$id);


        if ($extra instanceof Style)
        {
            //echo "trueee";
            $this->setStyle($extra);
            $extra='';
        }

        $this->openTagO='<input  name="'.$name.'" value="'.$value.'" type="'.$type.'" '.$extra.' ';
        $this->openTagC="";

        $this->closeTag=" />";
    }
    
    function setAttr($attr,$value='')
    {
        $this->openTagO.= ' '.$attr.'="'.$value.'" ';
        //echo "{$this->openTagO}";
    }


}


class InputMem extends Elem {

    public $name;
    public $value;
    public $unique=null;
    function __construct($name,$value=null,$type='text',$class=null,$id=null,$extra=null)
    {
        $this->unique = uniqid();

        $mem = cisess($this->unique);
        if (isset($mem)){

            $this->value = $mem;
        }

        if (isset($this->value)){

            cisess($this->unique,$this->value);
        }

        parent::__construct('',$class,$id);


        if ($extra instanceof Style)
        {
            //echo "trueee";
            $this->setStyle($extra);
            $extra='';
        }

        $this->openTagO='<input  name="'.$name.'" value="'.$value.'" type="'.$type.'" '.$extra.' ';
        $this->openTagC="";

        $this->closeTag=" />";
    }

    function setAttr($attr,$value='')
    {
        $this->openTagO.= ' '.$attr.'="'.$value.'" ';
        //echo "{$this->openTagO}";
    }


}

class Submit extends  Input {

    function __construct($value = "Submit me",$name = null)
    {
        parent::__construct($name,$value,'submit');
    }

}

class ActiveInput extends Input
{
          
        function __construct($value, $name='active')
        {
           
            if ($value==null) // es nuevo por defaul ponlo en 1
            {
                //echo "value es 1";
                $value= 1;
            }
           
            parent::__construct($name,$value,'checkbox');
            if ($value)
            $this->setAttr("checked","checked");
            $this->setStyle("margin-top:10px;");    
        }
        
        
    
}


class Formelement extends Elem
{
    public $action='';
    public $multipart =false;
    public $enctype =' enctype="multipart/form-data" ';

    function __construct( $content=null,$action=null,$class='',$id='',$extra ='')
    {
       $this->action = $action;
       parent::__construct($content,$class,$id);

        $this->openTagO='<form   '.$extra.' '.$this->enctype;



        $this->setAttr("method","post");
            
        $this->openTagC=">";

        $this->closeTag="</form>";
    }
    
      

    
}


class Fieldset extends Elem
{

    function  __construct($legend = "",$class=null,$id=null,$extra = '')
    {
         parent::__construct('',$class,$id);

         if (!empty($legend))
         $legend = "<legend >$legend</legend>";

          $this->openTagO="<fieldset $extra";
          $this->openTagC=">$legend";

          $this->closeTag="</fieldset>";
    
    }
    
}

class Br2 extends Elem
{
  
 
    function __construct()
    {
      $this->openTagO = "<br ";
      $this->openTagC = "/>";
      $this->closeTag="";
    }

    

}
class Br
{
    private $clear=false;
    private $clearBoth ='style="clear:both;"';
    function __construct($clear=false)
    {
       $this->clear=$clear;
    }

    function __toString()
    {
        if ($this->clear)
        return "<br {$this->clearBoth} />";
        else return "<br />";
    }

}
///** same as Lbl
class Label extends Elem
{

    function __construct($content,$for='',$class=null,$id=null,$exta='')
    {
        parent::__construct($content,$class,$id);
        if (!empty($for))
        $for='for="'.$for.'"';
        $this->openTagO="<label $for";
        $this->openTagC=" $exta >";

        $this->closeTag="</label>";
    }

}
class Lbl extends Elem
{

    function __construct($content,$for='',$class=null,$id=null,$exta='')
    {
        parent::__construct($content,$class,$id);
        if (!empty($for))
        $for='for="'.$for.'"';
        $this->openTagO="<label $for";
        $this->openTagC=" $exta >";

        $this->closeTag="</label>";
    }

}



class Pair {

    public $config;
    public $pair=null;

    function __construct($config_name,$value='',$label='',$type='text',$text='', $class='')
    {
       

        if (is_array($config_name))
        $this->config=$config_name;
        else
        $this->createPair($config_name,$value='',$label,$type,$text, $class);
    }


    function createPair($name,$value,$label,$type,$text, $class)
    {
       
        $container = new Div();
        $lbl = new Lbl($label);

        if ($type!='textarea')
        $input = new Inputelement($name,$value,$type, $class);
        else
        $input = new Textarea($name,$value, $class);

        $container->addChild($lbl);
        $container->addChild($input);
        
        if (!empty ($text))
        {
           
            $container->addChild(new Text($text));
        }

        $this->pair = strval($container);
    }



    function __toString()
    {

        if (!empty ($this->pair))
                return $this->pair;

        $div = new Div();
        foreach($this->config as $k=>$element)
        {

            if ($element['type']=='plaintext'){
            $div->addChild (new Text($element['label']));
            continue;
            }
          

            $atts = $element['attributes'];

            $class = '';

            if (array_key_exists('class', $atts))
            {
                $class=$atts['class'];
            }

            

            $label = new Lbl($element['label']);
            $input = new Inputelement($element['attributes']['name'],'');
            if (isset($element['style']))
            $input->setStyle($element['style']);

            if (isset($element['class']))
            $input->setClass($element['class']);


           
            $div->addChild($label);
            $div->addChild($input);
       }
        

        return strval($div);

    }

}


class Span extends Elem
{
    function __construct($content,$class=null,$id=null,$extra='')
    {
        parent::__construct($content,$class,$id);
      


        $this->openTagO='<span '."$extra";
        $this->openTagC=">";

        $this->closeTag="</span>";

    }
    
}

class AnchorT extends Elem
{

    public $url;
    public $atts ='';


    function   __construct($content,$url,$atts="")
    {
       //  echo "[[content:{$content} [[[$atts]]"; 
        
        $this->atts = $atts;
     //  echo "[[$this->atts]]"; 
        
      $class = '';
      $id ='';
       
        parent::__construct($content,$class,$id);

        if (!empty($url)){
            
             
     
            
            $this->url = $url;
            if (strstr($url,'http')===false and strstr($url,'#')===false)// is not url , so it is local
            {
                $this->url = site_url()."/".$url;
            }
            
              
                
            $this->openTagO='<a href="'.$this->url.'"   '.$this->atts.' ';
            $this->openTagC=">";
        }else{
            $this->openTagO='<a href="#" '.$this->atts.' ';
            $this->openTagC=">";
        }
        $this->closeTag="</a>";

    }


    function setAttr($name,$value=null)
    {
        $this->atts.=' '.$name.'="'.$value.'" ';
    }


     
}


class Anchor extends Elem
{

    public $url;
    public $atts ='';


    function   __construct($content,$url,$class=null,$id=null,$atts=null)
    {
      
       $this->atts = $atts;
       
        parent::__construct($content,$class,$id);

        if (!empty($url)){
            
             
     
            
            $this->url = $url;
            if (strstr($url,'http')===false and strstr($url,'#')===false)// is not url , so it is local
            {
                $this->url = site_url()."/".$url;
            }
            
              
                
            $this->openTagO='<a href="'.$this->url.'"   '.$this->atts.' ';
            $this->openTagC=">";
        }else{
            $this->openTagO='<a href="#" '.$this->atts.' ';
            $this->openTagC=">";
        }
        $this->closeTag="</a>";

    }


    function setAttr($name,$value=null)
    {
         $this->atts.= $this->atts . ' '.$name.'="'.$value.'" ';
    }


     
}


class Div extends Elem
{

    function __construct($content=null,$class=NULL, $id = Null,$extra=null)
    {
        $this->openTagO="<div $extra";
        $this->openTagC=">";
        
        $this->closeTag="</div>";
        parent::__construct($content,$class,$id);
    }


}

class Strong extends Elem
{
    function __construct($content)
    {
        
        
        $this->openTagO="<strong>";
        $this->openTagC="";
        
        $this->closeTag="</strong>";
        
        parent::__construct($content);
    }
    
}

/*paragraphs */
class P extends Elem
{

    function __construct($content=null,$class=NULL, $id = Null)
    {
        $this->openTagO="<p";
        $this->openTagC=">";

        $this->closeTag="</p>";
        parent::__construct($content,$class,$id);
    }


}



class Img extends Elem
{

    public $width ;
    public $height;
    public $dimX='';
    public $dimY='';
    function __construct($src=null,$id=NULL, $class = Null,$title = "")
    {
      
        if (strstr($src,'http')===false){ // is not a URL image
            $base =  base_url();
           
            $src = $base."".$src; // for example if source = image/icon.gif it changes it to http://localhost/images/icon.gif
      
            }
        parent::__construct($content='',$id,$class);
               // echo "***";
                $this->openTagO='<img style="border:none" src="'.$src.'" id="'.$id.'" alt="'.$title.'" title="'.$title.'" class="'.$class.'"';

                

                $this->openTagC="";

                $this->closeTag="/>";

    }

    function  __toString()
    {

        if (!empty($this->dimX))
                $this->openTagC.= ' width="'.$this->dimX.'" ';

         if (!empty($this->dimY))
                $this->openTagC.= ' height="'.$this->dimY.'" ';


        return parent::__toString();

    }

    function setDim($width,$height=null)
    {

        $this->dimX=$width;


        if (!empty($height))
        {
            $this->dimY = $height;
        }
        //echo $this->dim;
        
    }




    


}

// imag2 same as one but with modifyble style;
class Img2 extends Elem
{

    public $width ;
    public $height;
    public $dimX='';
    public $dimY='';
    function __construct($src=null,$id=NULL, $class = Null, $title = "")
    {
      
        if (strstr($src,'http')===false){ // is not a URL image
            $base =  base_url();
           
            $src = $base."".$src; // for example if source = image/icon.gif it changes it to http://localhost/images/icon.gif
      
            }
        parent::__construct($content='',$id,$class);
               // echo "***";
                $this->openTagO='<img src="'.$src.'" id="'.$id.'"  alt="'.$title.'" title="'.$title.'"  class="'.$class.'"';

                

                $this->openTagC="";

                $this->closeTag="/>";

    }

    function  __toString()
    {

        if (!empty($this->dimX))
                $this->openTagC.= ' width="'.$this->dimX.'" ';

         if (!empty($this->dimY))
                $this->openTagC.= ' height="'.$this->dimY.'" ';


        return parent::__toString();

    }

    function setDim($width,$height=null)
    {

        $this->dimX=$width;


        if (!empty($height))
        {
            $this->dimY = $height;
        }
        //echo $this->dim;
        
    }




    


}


/*
 * pasa la cadena tal cual y le injecta valores a los tags
 */
class Template extends Elem
{
    
    function __construct($html = '',$data=array())
    {
        $this->openTagC='';
        $this->openTagO='';
        $this->closeTag='';
        
        
        if (!empty($data))
        {
            
            $html = str_replace($search =  array_keys($data),
                                $replace=  array_values($data),
                                $subject=$html);
            //echo "[$html]";
        }
        
        parent::__construct($html);
    }
    
}

class Ul extends Elem
{

    function __construct($content=null,$class=null,$id=null)
    {
        parent::__construct($content,$class,$id);

          $this->openTagO='<ul';
          $this->openTagC=">";
          $this->closeTag="</ul>";

    }



}

class Li extends Elem
{

    function __construct($content=null,$class=null,$id=null)
    {
        parent::__construct($content,$class,$id);

          $this->openTagO='<li';
          $this->openTagC=">";
          $this->closeTag="</li>";

    }

   
}


class Cell extends Elem
{


    function __construct($c)
    {
      
       $this->openTagO="<td ";
       $this->openTagC=" >";
       
       $this->closeTag="</td>";
        parent::__construct($c);
    }

    
}

class Td extends Elem
{

   

    function __construct($c ='',$extra='')
    {
        parent::__construct($c);
       $this->openTagO="<td  $extra ";
       $this->openTagC=">";

       $this->closeTag="</td>";
       
    }

    



}


class TH extends Elem{




    function __construct($c,$extra='')
    {
      
       $this->openTagO="<th $extra"; // TODO revisar/hacer que sea coherente con los demas de su tipo
       $this->openTagC=" >";
       
       $this->closeTag="</th>";
        parent::__construct($c);
    }

}


class Textarea extends Elem
{

    function __construct($name,$value="",$class=null,$id=null,$rows=5,$cols=15)
    {
        parent::__construct($value,$class,$id);
        $this->openTagO='<textarea name="'.$name.'" rows="'.$rows.'" cols="'.$cols.'" ';
        $this->openTagC='>';
        $this->closeTag='</textarea>';
        
                
    }

}
class Row
{

    public $cells = array();


    function __construct()
    {
        //echo "@ row";

    }

    function addCell($cell)
    {
        //    echo "at a tdd cell";
        $this->cells[]=$cell;

    }


    function  __toString() {

        $row  = '<tr>';
        foreach ($this->cells as $cell)
        {

            $row.=$cell;

        }
        $row.='</tr>';
        return $row;
    }


}

/*same as Row */

class Tr extends Elem
{

   

    function __construct($content="",$extra = '')
    {
        parent::__construct($content);
        $this->openTagO = "<tr  $extra ";
        $this->openTagC = ">";
        
        $this->closeTag = "</tr>";
        
    }

    


}


class Tbody extends Elem{


    function  __construct($content = null,$class=null,$id=null,$atts='' ) {


        $this->openTagO="<tbody $atts ";
        $this->openTagC='>';
        $this->closeTag='</tbody>';

        parent::__construct($content,$class,$id);


    }



}

class Tfoot extends Elem{


    function  __construct($content = null,$class=null,$id=null,$atts='' ) {


        $this->openTagO="<tfoot $atts ";
        $this->openTagC='>';
        $this->closeTag='</tfoot>';

        parent::__construct($content,$class,$id);


    }



}

class Thead extends Elem{


    function  __construct($content = null,$class=null,$id=null,$atts='' ) {


        $this->openTagO="<thead $atts ";
        $this->openTagC='>';
        $this->closeTag='</thead>';

        parent::__construct($content,$class,$id);


    }



}

class Table extends Elem{

    private $config  = array();
    private $columns = null;
    private $rows = null;
    private $headers = null;
      private $table_styles = null;
    function  __construct($content = null,$class=null,$id=null ,$extra = '') {


        if (is_array($content)){
            
            $this->config = $content;
            $this->table_styles = $this->config["styles"];
            $this->headers = $this->config["headers"];
            
            //var_dump($this->config);
            //die();
            $this->setUp();
        }
        
        $this->openTagO='<table '.$extra.'  ';
        $this->openTagC='>';
        $this->closeTag='</table>';

        parent::__construct($content,$class,$id);


    }
   
    function setUp(){
        
        $all  = $this->config["rows"];
        $this->columns = $this->config["columns"]; 
        $this->headers = $this->config["headers"];
       
      // p($this->table_styles);
        $tr= new Tr();
        
        foreach($this->headers as $header){
           
            $header = new TH($header);
            $tr->add($header);     
        }
        if (count($all)>0)
        $this->add($tr);
       
        foreach($all as $row){
            
            $tr = new Tr();
            
            foreach($this->columns as $key=> $column)
            {
                //echo "inner for $key";
                $type =  key($column);
                $attribute = current($column);
                //echo $type;
                if ($type == 'field')
                   
                    $content = $row->$attribute;
                else
                    $content  = $row->$attribute();
                
                $td =new Td($content);
                $styles = !empty($this->table_styles[$key])?$this->table_styles[$key]:null;
               
                $td->setStyle($styles);     

               
                
                $tr->add($td);
                
            }
            
            $this->add($tr);
        }
        
        
        
    }
    

}

class Style{

    public $properties = array();
    public $index = 0;
    function  __construct($params) {

        if (is_array($params))
        {
            foreach($params as $k =>$value )
            {

                $this->properties[$this->index]=$value;
                $this->index++;
            }
        }
        else if (is_string($params))
        {
            $this->properties[$this->index]=$params;
            $this->index++;
        }

    }


    function  __toString() {


       // print_r($this->properties);

        if (!count($this->properties)>0)
        return "";

        $style= '';
        foreach($this->properties as $pk => $pval)
        {
            $style.=$pval.";";


        }
        $style.='';
        return $style;
    }


}
// utility classes
class Dropdown extends Elem
{
    public $options;
    public $selected='';

    function __construct($name,$options,$selected='',$class=null,$id=null,$extra=''){
        //echo "optins inside";
        //p($options);
        
       
        $this->options = $options;

      

        $this->selected=$selected;
        
          
        
        $content = $this->parseOptions();
        parent::__construct($content,$class,$id);
        $this->openTagO='<select name="'.$name.'" '.$extra.' ';
        $this->openTagC='>';
        $this->closeTag='</select>';

        if (!empty ($id))
        $this->setId ($id);
        else
        $this->setId ($name);

    }

    function parseOptions()
    {
        $options = '';
        if (count($this->options)>0)
        foreach ($this->options as $k=>$v)
        {
            $selected = '';
            
            if ($this->selected==$k)
            {
             $selected = 'selected = "selected" ';
            }
            
            $options.='<option value = "'.$k.'" '.$selected.' >'.$v.'</option>';
         
        }
        return $options;
        
    }
   


}

// add an attribute to the value apart from the value, this is for the tax

class Dropdown3 extends Elem
{
    public $options;
    public $selected='';

    function __construct($name,$options,$selected='',$class=null,$id=null,$extra=''){
        //echo "optins inside";
        //p($options);
        
       
        $this->options = $options;

      

        $this->selected=$selected;
        
          
        
        $content = $this->parseOptions();
        parent::__construct($content,$class,$id);
        $this->openTagO='<select name="'.$name.'" '.$extra.' ';
        $this->openTagC='>';
        $this->closeTag='</select>';

        if (!empty ($id))
        $this->setId ($id);
        else
        $this->setId ($name);

    }

    function parseOptions()
    {
        
        
        $options = '';
        if (count($this->options)>0)
        foreach ($this->options as $k=>$v)
        {
            $selected = '';
            
            if ($this->selected==$k)
            {
             $selected = 'selected = "selected" ';
            }
            
            $options.='<option value = "'.$k.'" '.$selected.' attr="'.$v['attr'].'"   >'.$v['en'].' ('.$v['attr'].'%) </option>';
         
        }
        return $options;
        
    }
   


}

/*Noiguala Cero con NULL o cadena vacia */
 //Dropdown2   diferencia entre "" y 0 como valoires distintos,Drop1 los toma como iguales y entonces se marca inactive por default
     
class Dropdown2 extends Elem
{
    public $options;
    public $selected='';

    function __construct($name,$options,$selected='',$class=null,$id=null,$extra=''){
        //echo "optins inside";
        //p($options);
        
     
        $this->options = $options;

      

        $this->selected=$selected;
        
          
        
        $content = $this->parseOptions();
        parent::__construct($content,$class,$id);
        $this->openTagO='<select name="'.$name.'" '.$extra.' ';
        $this->openTagC='>';
        $this->closeTag='</select>';

        if (!empty ($id))
        $this->setId ($id);
        else
        $this->setId ($name);

    }

    function parseOptions()
    {
        $options = '';
        if (count($this->options)>0)
        foreach ($this->options as $k=>$v)
        {
            $selected = '';
          
            if ($this->selected==$k)
            {
               if ($this->selected == "" and $k==0)
                { echo  $selected = "";
             
                }
                else  $selected = 'selected = "selected" ';
            }
            
            $options.='<option value = "'.$k.'" '.$selected.' >'.$v.'</option>';
         
        }
        return $options;
        
    }
   


}

class Css extends Elem
{
   
    function __construct($content)
    {
        
        parent::__construct($content);
        
        $this->openTagO='<style>';
        $this->closeTag='</style>';
    }
    
    
    
    
}


class Js extends Elem
{
   
    function __construct($content)
    {
        
        parent::__construct($content);
        
        $this->openTagO='<script>';
        $this->closeTag='</script>';
    }
    
    
    
    
}
/*same as JS*/
class Script extends Elem
{
   
    function __construct($content='',$src='')
    {
        $src = trim($src);
        parent::__construct($content);
        
        $o  = '<script language="JavaScript" type="text/javascript" >';
        if (!empty($src))
        {
            $o = '<script language="JavaScript" type="text/javascript" src="'.$src.'" >';
        }
        $this->openTagO=$o;
        $this->closeTag='</script>';
    }
    
    
    
    
}





// compuesta , depende de Jquery 

class CalendarJSA
{
    public $input;
    public $name = '';
    public $format = "en"; 
    public $formatString;
    public $formats;
    function __construct($name='date',$val='0000-00-00',$format = "en")
    {
        
        
        $this->name = $name;
        
        
            
            
        $val2 = explode(' ', $val);
       
        $Date = $val2[0];
        
       
        
        $this->input = new Inputelement($this->name, $val2[0]);
        $this->input->setStyle("width:70px;");
        $this->input->setClass("datepicker input");
        
        $this->input->setId($this->name);
        
        
        $this->format = $format; 
        
        
      
        
        $this->formats["en"]="mm/dd/yy";
        $this->formats["sp"]="dd/mm/yy";
     
        
    }
    function setFormat($format)
    {
        $this->format= $format;
    }
    function __toString()
    {   
        
       
        
        $this->formatString = $this->formats[$this->format];
        
        
        $js = new Js("
                $(function() {
              
                    $('#{$this->name}').datepicker({ dateFormat: '{$this->formatString}',changeYear: true});
		});
        ");
        return "{$this->input} $js";
    }
    
    
}

class CalendarJS2 extends Input
{
    public $input;
    public $name = '';
    public $format = "en"; 
    public $formatString;
    public $formats;
    function __construct($name='date',$val="",$format = "en",$required = '')
    {
        // echo "[$val]";
        
        
         $this->name = $name;
       
         if (empty ($val) or ($val=="-"))
         {
            $val = @date("Y-m-d"); 
            // $val  = $this->format(@date("Y-m-d"),$format);
            
         }
                // cambio para no poner none en todas las llamadas 
                $mystring = $val;
                $findme   = '/';
                $pos = strpos($mystring, $findme);
                
                if ($pos !== false) 
                { // si esta , ya esta formated
                } 
                else
                {
                   $val = $this->format($val,$format);
                }    
         
		// if($format != "none"){
         	//$val = $this->format($val,$format);
                
                
                
                
       	 
      
         $this->formats["en"]="mm/dd/yy";
         $this->formats["sp"]="dd/mm/yy";
        
        
         parent::__construct($name, $val,'',$required);
        
     
     
        
    }
    
    function format($date,$format = "en") // yyyy-mm-dd
    {
        
        //echo "[[$date]]";
        @list($date,$hour) = @split(" ",$date);
        
        
        list($y,$m,$d)= @split("-",$date);
        
        if ($format == "en" or $format=="none")
        {
            return "$m/$d/$y";
        }
        else
        {
            return "$d/$m/$y";
        }
        
    }
    
    function setFormat($format)
    {
        $this->format= $format;
    }
    function __toString()
    {   
        $this->setId($this->name);
        
        //echo "[[[{$this->name}]]]";
        $this->formatString = $this->formats[$this->format];
        
        //echo "[ {$this->formatString}]";
        $js = new Js("
                $(function() {
              
                    $('#{$this->name}').datepicker({ dateFormat: '{$this->formatString}',changeYear: true});
		});
        ");
        return parent::__toString()." $js";
    }
    
  
    
        function MyCheckDate( $postedDate ) {
       
             if ( preg_match('/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/', $postedDate) ) {
      list($year , $month , $day) = explode('-',$postedDate);
      return checkdate($month , $day , $year);
   } else {
      return false;
   }
            
        }
    
}


class CalendarJS extends Input
{
    public $input;
    public $name = '';
    public $format = "en"; 
    public $formatString;
    public $formats;
    function __construct($name='date',$val="0000-00-00",$format = "en",$required = '')
    {
     
        
        if ($val == "0000-00-00")
        {
            $val = ($format=='en')?@date("m/d/Y"):@date("d/m/Y");
        }
        
        $this->name = $name;
      
        $this->format = $format; 
        
        
         parent::__construct($name, $val,'',$required);
        
        $this->formats["en"]="mm/dd/yy";
        $this->formats["sp"]="dd/mm/yy";
     
        
    }
    function setFormat($format)
    {
        $this->format= $format;
    }
    function __toString()
    {   
        $this->setId($this->name);
        
        
        $this->formatString = $this->formats[$this->format];
        
        
        $js = new Js("
                $(function() {
              
                    $('#{$this->name}').datepicker({ dateFormat: '{$this->formatString}',changeYear: true});
		});
        ");
        return parent::__toString()." $js";
    }
    
    
}


class TimeJS {
    
    public $input;
    public $name = '';
    function __construct($name='hour',$val='00:00:00') {
        $this->name = $name;
        $this->input = new Inputelement($this->name,$val);
        $this->input->setStyle("width:70px;");
        $this->input->setClass("input");
        
        $this->input->setId($this->name);
    }
    
    function __toString() {
        $js = new Js("
            $(function() {
                $('#{$this->name}').timepicker({timeFormat: 'hh:mm:ss', showSecond: true});
            });
        ");
        return "{$this->input}".$js;
    }
    
}


class Relleno
{
    
    static function create($n = 100)
    {
        $ul = new Ul();
        $ul->setStyle("margin:0 auto;width:100px;");
        for($k = 0; $k <$n; $k++)
        {
            $li = new Li("$k");
            $li->setStyle("border:1px solid red;display:block;height:20px;margin:0;");
            $ul->addChild($li);
        }
        
        return "$ul";
    }
    
    static function generate($n=100 )
    {
        return Relleno::create($n);
    }
    
}

//-------------functions ----------------------------

function    _p($r,$m = null)
{
    echo "<hr />";
    echo "<pre> $m \n";
    print_r($r);
    echo "</pre>";
}

function nf ($n)
{
    return "".number_format($n, $decimals=2,".",",");
}

// necesita saber la ruta a sspry y necesita 
class SpryMenu
{
    public $items = array("home"=>"Home");
    public $menu = '';
    function __construct($items =null,$path = "")
    {
        if (is_string($items))
        $this->menu = $items;
        
        else
        {
        $this->pathToSpry=$path; 
        $this->items= $items;
        }
        
        $this->path = base_url()."css/admin/SpryAssets/";
        if (!empty($path))
        $this->path=$path;   
        
    }
    
    
    function __toString()
    {
       return $this->fromString();
    }
    function fromString()
    {
        $div = new Div();
        $js = new JsLink($this->path."SpryMenuBar.js");
        $div->addChild($js);
        $cs = new CssLink($this->path."SpryMenuBarHorizontal.css");
        $div->addChild($cs);
        
        $div->addChild($this->menu);
        
        $script = new Script('
       
        var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"'.$this->path.'SpryMenuBarDownHover.gif", imgRight:"'.$this->path.'SpryMenuBarRightHover.gif"});
      
        '
        );
       
        $div->addChild($script);
       
        return "$div";
    }
    
    function fromArray()
    {
         $div = new Div();
        $js = new JsLink($this->path."SpryMenuBar.js");
        $div->addChild($js);
        $cs = new CssLink($this->path."SpryMenuBarHorizontal.css");
        $div->addChild($cs);
        
        
        $ul = new Ul();
        $ul->setid("MenuBar1");
        $ul->setClass("MenuBarHorizontal");
        
        foreach($this->items as $url =>$label)
        {
            $li = new Li();
            $a = new Anchor($url,$label);
            $li->addChild($a);
            
            $ul->addChild($li);
        }
        
       $div->addChild($ul);
        
       
       $script = new Script('
           jQuery(function(){});
        var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"'.$this->path.'SpryMenuBarDownHover.gif", imgRight:"'.$this->path.'SpryMenuBarRightHover.gif"});
        });
        '
        );
       
       $div->addChild($script);
       
       return "$div";
        
    }
    
}

    class Option extends Elem
    {
        
        function __construct($content,$value='', $extra='')
        {
            $this->openTagO='<option value="'.$value.'" '.$extra;
            $this->openTagC='>';
            $this->closeTag = '</option>';
            parent::__construct($content);
        }
        
        
        
        
    }
    
    class MDate
    {
        /*cambia las fechas de 2001-01-21 a 21/01/2001*/
        static function  format($date,$sep = '-')
        {   
            if (!empty($date))
            {
                @list($year,$month,$day) = @split($sep, $date);
                return "$day/$month/$year";
            }
            return "-";
        }
         static function  toInput($date,$lang="en", $sep= '-')
        {    
            //p($date);
            @list($date,$hour) = @split(" ",$date); 
            
            //echo "[$date]";
             
            if (!empty($date))
            {
                if ($lang=='en'){
                @list($year,$month,$day) = @split($sep, $date);
                return "$month/$day/$year";
                }
                else 
                {
                @list($year,$month,$day) = @split($sep, $date);
                return "$dat/$month/$year";
                } 
            }
            return "-";
        }
        
        static function today()
        {
            return @date("m/d/Y");
        }
        
        static function toSQL($date,$sep = '/')
        {
             if (!empty($date))
            {
                @list($day,$month,$year) = @split($sep, $date);
                return "$year-$month-$day";
            }
            return @date("Y-m-d"); // default to today
        }
        
        
        static function toSQL2($date,$lang="en",$sep = '/')
        {
             //echo "[{$date}]";
            
             if (!empty($date))
            {
                if ($lang =="en") // i know format is m/d/Y 
                {   
                    @list($month,$day,$year) = @split($sep, $date);
                    
                } 
               else 
               {
                    @list($day,$month,$year) = @split($sep, $date);// i know format is d/m/Y 
                   
               }   
                return "$year-$month-$day";
            }
            
            
            
            return @date("Y-m-d"); // default to today
        }
        
    }
class Html2 extends Elem
{
    public $doctype = '';
    public $extra = '';
    
    function __construct($content='',$extra=null,$doctype='')
    {   
        $this->openTagO="<!doctype html>".'<html '.$extra.' ';
        $this->openTagC='>';
        $this->closeTag='</html>';
      
        parent::__construct($content);
      
    }
  
    
}

  
    class CalendarJS3 extends Input
    {
        public $input;
        public $name = '';
        public $format = "en"; 
        public $formatString;
        public $formats;
        function __construct($name='date',$val='0000-00-00',$format = "en")
        {


            $this->name = $name;

            $this->format = $format; 


            parent::__construct($name, $val);

            $this->formats["en"]="mm/dd/yy";
            $this->formats["sp"]="dd/mm/yy";


        }
        function setFormat($format)
        {
            $this->format= $format;
        }
        function __toString()
        {   
            $this->setId($this->name);


            $this->formatString = $this->formats[$this->format];


            $js = new Js("
                    $(function() {

                        $('#{$this->name}').datepicker({ dateFormat: '{$this->formatString}',changeYear: true});
                    });
            ");
            return parent::__toString()." $js";
        }


    }

    
    class MyRadio2 {
    
    public $config;
    public $name; 
    public $checked;
    public $class_prefix;
    function __construct($name,$array,$checked,$class_prefix="radio")
    {
        $this->config; 
        $this->config=$array;
        $this->checked = $checked;
        $this->class_prefix = $class_prefix;
        
        $this->name = $name;
    }
    
    function __toString()
    {
        
        $l = "";
        $value = "";
        foreach($this->config as $k=>$e)
        {
            $label = new Lbl($e);
            $label->setClass("{$this->class_prefix}_label");
            
            $e = new Inputelement("{$this->name}","$k","radio");
            $e->setClass("{$this->class_prefix}_radio");
            if ($this->checked == $k)
            {
                $e->setAttr("checked","checked");
            }
            $l.=$e." ".$label;
            $l.="<br style='clear:both' />";
        }
        return $l;
    }
    
    
    
    
}


class TextSearch3 extends Elem
    {
        public $name  = '';
        public $value = '';
        public $style = 'width:60px;height:26px;border:none;outline:none;';
        public $id = '';
        public $class ='';
        public $extra = '';
    
        function __construct($name, $value)
        {
            $this->name = $name;
            $this->value= $value;
            
        }
        
         function setExtra($extra)
        {
            $this->extra= $extra;
        }
        
        function setId($id)
        {
            $this->id= $id;
        }
        
        function setClass($class)
        {
            $this->class= $class;
        }
        
        function setStyle($style)
        {
            $this->style= $style;
        }
        function __toString() {
            
            $a = new Anchor("&nbsp;","#");
            $a->setId($this->name."_anchor");
            $a->setStyle("display:block;float:right");
            $a->setStyle("width:16px;");
            $a->setStyle("height:16px;");
            
            
         
            $path = base_url()."images_admin/search_find.png";
            $a->setStyle("background-image:url($path)");
         
            
            return '<input name="'.$this->name.'"  value="'.$this->value.'" style="'.$this->style.'" />'.$a;
            
            
        }
    }

    
    
class TextSearch extends Input
    {
       
        
    function __toString() {
        $s = parent::__toString();
        
        $path = base_url()."images_admin/search_find.png";
       
        $a = new Anchor("&nbsp;","#");
        $a->setStyle("background-image:url($path)");
        $a->setStyle("margin-top:6px;");
        
        $a->setClass("finder_anchor");
        
        $a->setId($this->name."_anchor");
        $a->setStyle("display:block;float:right");
        $a->setStyle("width:16px;");
        $a->setStyle("height:16px;");
        
            
        return $s."$a";
    }
        
       
        
}

class Multiselect extends Elem{
    private $options = array();
    private $selected = array();
    function __construct($name="multiselect",$options=array(),$selected=array())
    {
        $content = "";
        parent::__construct($content);
        
        $this->openTagO="<select  ";
        $this->openTagC='>';
        $this->closeTag='</select>';
        
        if (!empty($name)){
            $this->setAttr("name",$name);
        }
        
        foreach ($options as $key=>$option)
        {
            $anOption = new Option($option, $key);
            if (in_array($key, $selected))
            {
                $anOption->setAttr("selected");
            }
            
            
            $this->add($anOption);
        }
        
        
    }
}    
class BSLabel extends Label{
    
    function __construct($content, $colspan = 2 , $for = '') {
        
        $class = 'form-label control-label';
        parent::__construct($content, $for, $class);
        $this->setSpan($colspan);
    }
    function setSpan($span){
        $this->setClass("col-md-{$span}");
    }
    
    function setOffset($span){
        $this->setClass("col-md-offset-{$span}");
    }
}


class BSFormGroup extends Div{
        
    protected  $config = array();

    function __construct($config){
        $this->config = $config;
    }
    
    function __toString() {
     
        $div = new Div();
     
        $div->setClass($this->config["class"]);
        
        $children = $this->config["children"];
       // echo count($children);
        foreach($children as $type => $child){
            //echo "type is $type";
            
            if (is_array($child)){
                //p($child);
                $divInner = new Div();
                $divInner->add($child['element']);
                $divInner->setClass($child['class']);
                $div->add($divInner);
            }
            else{
                $div->add($child);
            }
            
            
            
            
        }
        
        
        return "$div";
            
            
    }
        
        
}    
   
/*same as dropdown except this uses CI code inside */

class DD extends Elem{
    
    
    function __construct($name = null, $options = null, $selected = null,$class=null,$id=null) {
        
        $this->openTagO = "<select name='$name'  ";
        $this->openTagC =">";
        $this->closeTag = '</select>';
        
        $content = options($options, $selected);
        
       
        
        parent::__construct($content, $class, $id);
    
        
    }
    
    
    
    
}



    
?>
