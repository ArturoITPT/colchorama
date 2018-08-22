<?php


//require_once APPPATH."classes/msession.php";
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
class Payment extends parent_model {

    
    
	// Uncomment and edit these two if the class has a model name that
	//   doesn't convert properly using the inflector_helper.
	// var $model = 'template';
         var $table = 'payments';

	// You can override the database connections with this option
	// var $db_params = 'db_config_name';

	// --------------------------------------------------------------------
	// Relationships
	//   Configure your relationships below
	// --------------------------------------------------------------------

	// Insert related models that Template can have just one of.
	var $has_one = array('receipt',"image");

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
       
            
        
        
        
        
        public $images=array("number"=>1,
                             "column_name"=>'photo',
                             "field_name"=>'file',
                             "upload_folder"=>"",
                             "model"=>'self',   
                             'sizes'=>array( "thumb"=>array("width"=>181,"height"=>115),
                                             "medium"=>array("width"=>400,"height"=>300),
                                             "medium"=>array("width"=>500,"height"=>600)
                                 
                                            )
                            );
        
        
        /**
	 * Constructor: calls parent constructor
	 */
    function __construct($id = NULL)
	{
		parent::__construct($id);
                
//                ////
//              ////
//                ////
                
                
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



    
    function getFullName($broken="") {
        return "{$this->name}";
    }
    
    
   function getModelName() {
       return __CLASS__;
   }
   
   
   function getOrder(){
       
       $order = new Order($this->order_id);
       return $order->id;
       
   }
   function getTotal(){
       
       return nf($this->total_final);
       
   }
   
   //numero de piezas recibidas para este recibo
   function getReceived(){
       $total = 0;
       $all = $this->product->include_join_fields()->get()->all;
       foreach ($all as $product){
           
           $total+= $product->join_qty;
           
       }
       return $total;
   }
   function getTotalItemsReceived(){
       $total = 0;
       
       $products = $this->product->include_join_fields()->get()->all;
       //echo count($products);
       foreach($products as $product){
           
           $total += $product->join_qty;
           
       }
       
       return $total;
      
   }
   function getTotalPaid(){
       
      return nf($this->total);
      
   }
   function  getView(){
       
       $content =  "<i class='ti-zoom-in'></i>";
       $a = new Anchor($content,"#");
       $a->setAttr("data-receipt", $this->id);
       $a->setClass("open-order-view");
       return $a;
   }
   
    function getModalView(){
        
        
        $all = $this->product->include_join_fields()->get()->all;
        
        
      
       
        
        $headers = array("SKU/Model",
                         "Pzas Recibidas",
                         "Total");
        $columns = array(
                         array( 'function'=>'getFullName'),
                         array( 'field'=>'join_qty'),
                         array( 'field'=>'join_cost'),
                         array( 'function'=>'getJoinTotal'),
                         array( 'field'=>'id'),
                       
                         
                        );
        //pd($columns);
        $styles = array(
            
                        'text-align:right;width:40px',
                        'text-align:right;width:40px',
                        'text-align:right;width:80px',
                        'text-align:center;width:40px',
        );
        $config = array("headers"=> $headers,
                       "columns"=>$columns,
                        "rows"=>$all,
                        "styles"=>$styles
            );
        
        $table =new Table($config);
        $table->setId("piezas");
        //$table->setStyle("border:1px solid red;width:600px;");
        $table->setClass("table table-bordered");
        $style= new Css("table#piezas td{border:1px solid #ccc};"
                        . " table#piezas{border-collapse:collapse;"
                        . "border:1px solid #ccc}");
        $table->add($style);
        
      
        return $table;
        
    }
   
    function getPdf(){
        
        $pdf = $this->image->get();
        if (!empty($pdf->id))
        {
            $image = new Img(base_url("assets/images/pdf.png"));
            $image->setDim(20);
            $atts = array(
                'width'       => 800,
                'height'      => 600,
                'scrollbars'  => 'yes',
                'status'      => 'yes',
                'resizable'   => 'yes',
                'screenx'     => 0,
                'screeny'     => 0,
                'window_name' => '_blank'
            );
            $src = $pdf->getSrc();
            $a =  anchor_popup($src,$image, $atts);
            
            
            return $a;
        }
        else
            return null;
        
        
    }
    
    
    
    function getProductName(){
        
        return $this->product->get()->getFullName();
        
    }
    function getDepot(){
        $d = new Depot($this->depot_id);
        return $d->getFullName();
        
    }
    function getVentas(){
       
        return $this->product->include_join_fields()->get()->join_qty;
    }
    
    function getProvider(){
    
        $p = new Provider($this->provider_id);
       // $p = $o->provider->get();
        return $p->getFullName();
    
    }
    function getDays(){
    
        $p = new Provider($this->provider_id);
       // $p = $o->provider->get();
        return $p->days;
    
    }
    function getDate(){
        
        $date = strtotime($this->date);
        return date("d/M/Y",$date);
        
    }
    
}

/* End of file template.php */
/* Location: ./application/models/template.php */
