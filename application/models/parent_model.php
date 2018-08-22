<?php

require_once  APPPATH."classes/uuid.php";

/**
 * Template DataMapper Model
 *
 * Use this basic model as a template for creating new models.
 * It is not recommended that you include this file with your application,
 * especially if you use a Template library (as the classes may collide).
 *
 * To use:
 * 1) Copy this file to the lowercase name of your new model.
 * 2) Find-and-replace (case-sensitive) 'Template' with 'Your_model'
 * 3) Find-and-replace (case-sensitive) 'template' with 'your_model'
 * 4) Find-and-replace (case-sensitive) 'templates' with 'your_models'
 * 5) Edit the file as desired.
 *
 * @license		MIT License
 * @category	Models
 * @author		Phil DeJarnett
 * @link		http://www.overzealous.com
 */
abstract class parent_model extends DataMapper {

	// Uncomment and edit these two if the class has a model name that
	//   doesn't convert properly using the inflector_helper.
	// var $model = 'template';
	// var $table = 'templates';

	// You can override the database connections with this option
	// var $db_params = 'db_config_name';

	// --------------------------------------------------------------------
	// Relationships
	//   Configure your relationships below
	// --------------------------------------------------------------------

    public  $controller_name=null;
    public static $controller= null;
    public static $dir = '';
    protected $CI ;
	// Insert related models that Template can have just one of.
	var $has_one = array();

	// Insert related models that Template can have more than one of.
	var $has_many = array();

	/* Relationship Examples
	 * For normal relationships, simply add the model name to the array:
	 *   $has_one = array('user'); // Template has one User
	 *
	 * For complex relationships, such as having a Creator and Editor for
	 * Template, use this form:
	 *   $has_one = array(
	 *   	'creator' => array(
	 *   		'class' => 'user',
	 *   		'other_field' => 'created_template'
	 *   	)
	 *   );
	 *
	 * Don't forget to add 'created_template' to User, with class set to
	 * 'template', and the other_field set to 'creator'!
	 *
	 */

	// --------------------------------------------------------------------
	// Validation
	//   Add validation requirements, such as 'required', for your fields.
	// --------------------------------------------------------------------

//	var $validation = array(
//		'example' => array(
//			// example is required, and cannot be more than 120 characters long.
//			'rules' => array('required', 'max_length' => 120),
//			'label' => 'Example'
//		)
//	);

	// --------------------------------------------------------------------
	// Default Ordering
	//   Uncomment this to always sort by 'name', then by
	//   id descending (unless overridden)
	// --------------------------------------------------------------------

	// var $default_order_by = array('name', 'id' => 'desc');

	// --------------------------------------------------------------------

	/**
	 * Constructor: calls parent constructor
	 */
        
    public $return_to_list = null;    
    /*QA:OK*/


    private $_edit="";


    function __construct($id = NULL,$controller=null)
	{
        
        
       
        // they send me the unique , look it up and instanciate the class 
        //echo "constructor    id [$id]";
        if (strpos($id, $needle='-')!==FALSE) //uniques have dashes
        {
            // "has dashes ... [$id] --<br>";
            $obj = $this->instanciate($id);
            parent::__construct($obj->id);
        }
        else{
           parent::__construct($id);
//         //  $id = intval($id);
//           if ($id ==null){
//              echo "NULL";
//               
//           } 
//            
//           else if ($id!=0){
//            parent::__construct($id);
//           }
//           else{
//               die("instanciate with zero id at parent_model ");
//           }
        }
        
        
        $this->CI = &get_instance();

    }



	// --------------------------------------------------------------------
	// Post Model Initialisation
	//   Add your own custom initialisation code to the Model
	// The parameter indicates if the current config was loaded from cache or not
	// --------------------------------------------------------------------
	function post_model_init($from_cache = FALSE)
	{
	}

	// --------------------------------------------------------------------
	// Custom Methods
	//   Add your own custom methods here to enhance the model.
	// --------------------------------------------------------------------

	/* Example Custom Method
	function get_open_templates()
	{
		return $this->where('status <>', 'closed')->get();
	}
	*/

	// --------------------------------------------------------------------
	// Custom Validation Rules
	//   Add custom validation rules for this model here.
	// --------------------------------------------------------------------

	/* Example Rule
	function _convert_written_numbers($field, $parameter)
	{
	 	$nums = array('one' => 1, 'two' => 2, 'three' => 3);
	 	if(in_array($this->{$field}, $nums))
		{
			$this->{$field} = $nums[$this->{$field}];
	 	}
	}
	*/
    function getControllerName(){
        
        //e(self::$controller,"controller");
        return self::$controller_name;
    }
    function getDir(){
        return self::$dir;
    }

    function getId(){
        
        if(!empty($this->unique)){
            return $this->unique;
        }
        
        return $this->id;
    }

    function getFullName()
    {
       return $this->name;
    }
    //@todo make the simple call first 
    function getCloneLink(){
        $params = $this->CI->uri->uri_to_assoc(2);
       
       
        $id = empty($this->id)?'null':$this->id;
        
        if (!empty($this->unique) and $id!='null'){
            $id = $this->unique;
        }
        
        
        $clone_params[getController()]='params';
        $clone_params['action']='clone';
        $clone_params['id']=$id;
        
        $url = $this->CI->uri->assoc_to_uri($clone_params);
        return site_url2($url);
    }

    /**
     * @param $params for example $params['controller_name']="function_name";
     * it merges with local arrau with id = 2 , etc
     * @return mixed
     *
     */



    function getNewLink($params){





       // $params = $params + $local_params;

        //die(print_r($params));

        return site_url(uri($params));



    }
    /*just adds the id */
    function getEditLink($params=array())
    {




        $id = empty($this->id)?'null':$this->id;

        if (!empty($this->unique) and $id!='null'){
            $id = $this->unique;
        }

        $local_params['id']=$id;


        $params = $params + $local_params;

        //die(print_r($params));

        return site_url(uri($params));





    }
    
    function getDelLink($params=array())
    {
        $id = empty($this->id)?'null':$this->id;
        if (!empty($this->unique) and $id!='null'){
            $id = $this->unique;
        }
        $local_params['id']=$id;
        $params = $params + $local_params;
        return site_url(uri($params));
    }
    
    
    function getEditLink1()
    {

        $params = $this->CI->uri->uri_to_assoc(2);
       
       
        $id = empty($this->id)?'null':$this->id;
        
        if (!empty($this->unique) and $id!='null'){
            $id = $this->unique;
        }
        
        $updateparams[$this->getControllerFromUri()]='params';
        $updateparams['action']='form';
        $updateparams['id']=$id;
        if (!empty($params['parent'])){
        $updateparams['parent']=$params['parent'];
        $updateparams['parent_id']=$params['parent_id'];
        }
        if (is_subclass_of($this, 'treemodel')){
            $related = $this->getRelated();
           
            $updateparams['related']=$this->getRelated();
            $updateparams['related_field']= $this->getRelatedField();
            
             
        }
        $url = $this->CI->uri->assoc_to_uri($updateparams);
        
        
        
        $e = self::$dir."/".$url;

        return site_url($e);
    }
    function getDeleteLink($mode='soft')
    {

        $params = $this->CI->uri->uri_to_assoc(2);
       
       
        $id = empty($this->id)?'null':$this->id;
        
        if (!empty($this->unique) and $id!='null'){
            $id = $this->unique;
        }
        
        $updateparams[$this->getControllerFromUri()]='params';
        $updateparams['action']=$mode=='soft'?'delete_soft':'delete';
        $updateparams['id']=$id;
        if (!empty($params['parent'])){
        $updateparams['parent']=$params['parent'];
        $updateparams['parent_id']=$params['parent_id'];
        }
        if (is_subclass_of($this, 'treemodel')){
            $related = $this->getRelated();
           
            $updateparams['related']=$this->getRelated();
            $updateparams['related_field']= $this->getRelatedField();
            
             
        }
        $url = $this->CI->uri->assoc_to_uri($updateparams);
        
        
        
        $e = self::$dir."/".$url;

        return site_url($e);
    }
    function getControllerFromUri(){
        
        $params = $this->CI->uri->uri_to_assoc(2);
        return key($params);
        
    }
    
    

    
    function encode($id)
    {
        return $id;
    }
    function setDir($dir){
        
        
       if (empty(self::$dir)){
          // echo 'it was empty';
           self::$dir = $dir;
       
       }
      
    }
    function setController($controller){

        self::$controller = $controller;
    }


    function getFormAction($params,$offset=2){

        $local_params=array();

        if (!empty($this->id) and !empty($this->unique))
        $local_params['id']=$this->unique;

        $params  = $params + $local_params;

        foreach($params as $param=>$val){
            if (empty($val)){
                unset($params[$param]);
            }
        }
        return  ($this->CI->uri->assoc_to_uri($params));

    }

    function getFormAction_(){
        
        //take the intial params
        $params = $this->CI->uri->uri_to_assoc(2);
        $controller =  self::$controller->getControllerName();
        $params[$controller]='params';
        
       
        
        //override what needs to be overriden 
        $params['action']='save';
        $params['id']= empty($this->id)?'null':$this->id;
       
        if (!empty(self::$controller->parent)){
            
            $params['parent']=self::$controller->parent;
            $params['parent_id']=self::$controller->parent_id;
            
        }
        
        
        
        
        $url = $this->CI->uri->assoc_to_uri($params);
        
        return site_url(self::$dir."/".$url); 
        
    }
    function getCloneAction(){
        
        //take the intial params
        $params = $this->CI->uri->uri_to_assoc(2);
        $controller =  self::$controller->getControllerName();
        $params[$controller]='params';
        
       
        
        //override what needs to be overriden 
        $params['action']='save';
        $params['id']= 'null';
       
        if (!empty(self::$controller->parent)){
            
            $params['parent']=self::$controller->parent;
            $params['parent_id']=self::$controller->parent_id;
            
        }
        
        
        
        
        $url = $this->CI->uri->assoc_to_uri($params);
        
        return site_url2($url); 
        
    }
    function getFormReturnUrl(){
        
        return $this->CI->uri->uri_string();
        
    }
    



    function allToOptions($all,$selected = '',$empty=false){
            
        $l="";
        
        if ($empty){
            $l.="<option>Seleccione</option>";
        }

        foreach ($all as $k=>$item){
            $sel="";
            if ( (is_string($selected) or is_int($selected)) and $selected == $item->id)
            {

                $sel="selected";
            }
            else if(is_array($selected)){
                if (in_array($item->id,$selected) ){
                    $sel="selected";
                }
            }
            $l.="<option $sel value='".$item->id."'>".$item->getFullName()."</option>";
        }

        return $l;
    }
    
    
    
    function getTotalChildren($parent_id, $parent_table_id=null,$child_table=null){
          $sql = "select count(id) from $child_table
          where  $parent_table_id = $parent_id ";
            
        
          $this->query($sql);  
        
    }
    
    function getThumb($field_name= "file"){
            
            
	    return base_url("uploads/{$this->$field_name}");
    }
     function getMedium($field_name= "file"){
       
            //die($s->getFullName());
            
	    return base_url("uploads/{$s->code_name}/{$this->$field_name}");
    }
    
    function check(){
        
        $this->check_last_query();
    }
    function getShowChildren($child){
                       
        
        $params[$child]='params';
        $params['action']='list';
        $params['parent']=self::$controller->getModelName();
        $params['parent_id']= $this->id;
        
        $url = $this->CI->uri->assoc_to_uri($params);
        
        // = site_url("{$this->getDir()}/$url");
        
        
                
        
        
        return site_url("{$this->getDir()}/$url");
        
    }
    
    function getTest(){
        $editLink = $this->getEditLink();
        return "<a href='$editLink'>Edit </a>";
    }
    

    
    /*QA:OK requires a unique id use uuid:v4() to generate it. In table , field is 'unique' */
    function instanciate($id){
        //echo "model name {$this->model_name} id d [$id]sddsssFFF";
        
        $this->model_name = $this->getModelName();
        
        if (empty($this->model_name))
        {
            
            $class = get_called_class();
            //dvd($class);
           // die("set up model name [$this->model_name]");
           $this->model_name = $class;
        }
        
        $obj = new $this->model_name();
        $obj->where('unique',$id)->get();
       
        return $obj;
    }
    
    function save($object = '', $related_field = '') {
        
        //echo "$this->unique";
        if (empty($this->unique)){
           // $d =new Debug();
            //$d->message = "empty unique ";
            $this->unique = uuid::v4();
            
            
        }
        else{
            
            //$d =new Debug();
            //$d->message = "not empty unique is $this->unique "; 
        }
       // print("saving ...");
        //pd($this);
        if (isset($this->update) && $this->update ==''){
            $this->updated = @date("Y-m-d H:i:s");
        }
        if (isset($this->created) && $this->created ==''){
            $this->created = @date("Y-m-d H:i:s");
        }
        
        if (!is_null($this) and is_null($this->id)){
            
            $this->created = @date("Y-m-d H:i:s");
            $this->updated = @date("Y-m-d H:i:s");
            
        }
        else{
            $this->updated = @date("Y-m-d H:i:s");
        }
        return parent::save($object, $related_field);
    }
    static function allToOptions2($all, $selected = '') {
      
        $l = "";
        foreach($all as $item){
            $sel = '';
            if ($selected == $item->id)
                    $sel = 'selected';
            $l.='<option '.$sel.' value="'.$item->id.'" >'.$item->getFullName().'</option>';
        }
        return $l;
    }
    
    
    function getEditCell(){
        $uri = $this->getEditLink();
        
        return anchor($uri, $title='edit');
        
    }
    
    function toSimpleArray($all){
        $array= array();
        foreach ($all as $v ){
            
            $array[]=$v->id;
            
        }
        return $array;
    }
    
    


    function setControllerName($controller_name){
        self::$controller_name = $controller_name;

    }


    function getPagination($base_url,$total,$limit,$segment){

        $this->CI->load->library('pagination');

        //$pag_params = $this->CI->uri->assoc_to_uri($assoc);
        $config['uri_segment'] = $segment;
        $config['base_url'] = ($base_url);//$base_url;
        $config['total_rows'] = $total;
        $config['per_page'] = $limit;
        $config['prefix']='off/';

        $this->CI->pagination->initialize($config);

        return  $this->CI->pagination->create_links();



    }


    function assignFromPost($post = null){
        
        if (is_null($post)){

            $post = $_POST;
        }
        //pd($post);
        foreach ($post as $var => $value){
            if (isset($post['updated']) and $post['updated']==''){
                unset($post['updated']);
            }
            if (isset($post['created']) and $post['created']==''){
                unset($post['created']);
            }
            $this->$var = $value;

        }


    }

    /*clients can override for custom usage in drop downs or other */
    function getNameLabel(){

        return $this->getFullName();

    }

    function getUnique($just_id = false){
        
        if ($just_id){
            return $this->id;
        }
        
        if (!empty($this->unique))
            return $this->unique;
        else
            return $this->id;

    }

    /*I know it will traverse twice, but want to separate responsabilities and standarize calls*/
    function toIdName($all ){

        $array  = array();
        foreach ($all as $object){

            $array[$object->getUnique($just_id=true)]=$object->getNameLabel();

        }

        return $array;
    }


    function getKey($column,$params){

        $url = $params['edit_url'];
        if ($this->id){
            $url = $url."/id/{$this->getId()}";
        }

        if ($column=='_edit'){

            return new Anchor("edit",$url);

        }

        return $this->$column;

    }
    
    static function toIdName2(){
        
        return parent_model::allToOptions2($this->get()->all);
        
    }
    
    static function toIdNameAssoc($all){
        $options = array();
        foreach($all as $option){
            
            $options[$option->id]=$option->getFullName();
            
        }
        return $options;
    }
    static function options($model){
        
        $object = new $model();
        $all =  $object->get()->all;
        return self::toIdNameAssoc($all);
        
    }
    static function selected($items){
        
        
        
        $selected = array();
        foreach($items as $item){
            //echo $item->getFullName();
            $selected[]=$item->getId();
           
        }
        return $selected;
    }
    
    abstract function getModelName();
    
    // states and cities for addresses, depends on the model, but at least branches and depots use it 
    
    function getStates(){
       
       $s = new State();
       $all = $s->get()->all;
       $blank[""]="Seleccione";
       $all = $blank+$this->toIdName($all);
       return $all;
       
   }
   function getCities(){
       
       $c= new City();
       $all = $c->get()->all;
       $blank[""]="Seleccione";
       $all = $blank+$this->toIdName($all);
       return $all;
       
   }
   
   
   function allToIdName(){
       
       $all = $this->get()->all;
       return self::toIdNameAssoc($all);
   }
    
   
}

/* End of file template.php */
/* Location: ./application/models/template.php */
