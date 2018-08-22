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
class Order extends parent_model {

    
    
	// Uncomment and edit these two if the class has a model name that
	//   doesn't convert properly using the inflector_helper.
	// var $model = 'template';
         var $table = 'orders';

	// You can override the database connections with this option
	// var $db_params = 'db_config_name';

	// --------------------------------------------------------------------
	// Relationships
	//   Configure your relationships below
	// --------------------------------------------------------------------

	// Insert related models that Template can have just one of.
	var $has_one = array();

	// Insert related models that Template can have more than one of.
	var $has_many = array('branch','depot','product','receipt');

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
        public $model_name = NULL;
        
        
        
        
        
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
        //var_dump($this->date);
                if ($this->date==NULL)
                    $this->date = @date("d/m/Y");
                    //var_dump($this->date);
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
        return "{$this->last_name} {$this->second_last_name} {$this->name}";
    }
    
    
   function getModelName() {
       return __CLASS__;
   }
   
   function getDepots(){
       
       $all = $this->depot->get()->all;
       
       $table = new Table();
       foreach($all as $depot){
           $td = new Td($depot->getFullName());
           $tr = new Tr($td);
           $table->add($tr);
           
       }
       return $table;
   }
   function getBranches(){
       
       $all = $this->branch->get()->all;
       
       $table = new Table();
       foreach($all as $depot){
           $td = new Td($depot->getFullName());
           $tr = new Tr($td);
           $table->add($tr);
           
       }
       return $table;
   }
   
   
   function getProvider(){
       
       
       $p = new Provider($this->provider_id);
       return $p->getFullName();
       
       
   }
   
   function getProductList(){
       
       $l= "";
      
       $all = $this->product->include_join_fields()->get()->all;
       $products = array();
       foreach($all as $product){
           
          $products[]= array("name"=>"$product->join_qty " . $product->getFullName());
           
       }
       
       return $products;
       
   }
   function getProductDescription(){
       
       $l= "$this->id ";
      
       $all = $this->product->include_join_fields()->get()->all;
       $products = array();
       foreach($all as $product){
           
         $l.= "".$product->getFullName()." ";
           
       }
       
       return $l; 
   }
   
   /*this is the order, rows , it is send ad ajax */
   
   function getProductsBody(){
       
       
       
       return $tbody;
       
       
   }
   
   function getPiezas(){
       
       $total = 0;
       
       $products = $this->product->include_join_fields()->get()->all;
       foreach($products as $product){
           
           $total += $product->join_qty;
           
       }
       return $total;
   }
   
    function getReceived(){
       
        $total = 0;
        $r = new Receipt();
        $receipts = $r->where('order_id', $this->id)->get()->all;
        foreach($receipts as $receipt){
            
            $total += $receipt->getReceived();
            
        }
        
        return $total;
   }
   function getRestantes(){
       
       $pedidos= $this->getPiezas();
       $entregados = $this->getReceived();
       return $pedidos - $entregados;
       
   }
   function receiptTableHead(){
       
        $thead = new Thead();
        $tr = new Tr();
        $th = new Th("Producto");
        $tr->add($th);
        
        $th = new Th("Cantidad <br>Solicitada");
        $tr->add($th);
        
        $th = new Th("Cantidad <br>Recibida");
        $tr->add($th);
       
        $th = new Th("Costo Unitario");
        $tr->add($th);
       
        $th = new Th("Subtotal");
        $tr->add($th);
        
        
        $thead->add($tr);
        return $thead;
       
   }
   function getReceiptTable(){
      
        $table = new Table();
        $table->setClass("table table-bordered table-striped ");
        $table->add($this->receiptTableHead());
        
        $tbody = new Tbody();
       // $tbody->setStyle("border:2px solid red");
        $tbody->setId("products");
        
       
        
        
        //////////
        $tbody = new Tbody();
         ///echo $total_discounts;
       
        $tax = new Tax($this->tax_id);
        $total = 0;
       

        //$iva =   ($tax->percent); // = > pexample 0.16
     
        $all = $this->product->include_join_fields()->get()->all;

        $total_discounts = 0;
        // get the discounts 
        $discounts  = explode(",",$this->discounts);
        foreach ($discounts as $discount){

            $total_discounts  +=  intval($discount);

        }
        $total_discounts_label = $total_discounts;
         
       
       // get the tax
      //  $total_received = $this->getTotalReceived();
       
     
       $total = 0;
       $subtotal  = 0 ;
       
       foreach ($all as $product){
           $total_fila = 0;
           $tr  = new Tr();
           
           $td = new Td($product->getFullName());
           
           $tr->add($td);
           
           $input = new Input("qty[]",$product->join_qty,'number');
           $input->setAttr("readonly","readyonly");
           $input->setClass("form-control qty");
           
           $td = new Td($input);
           
           $tr->add($td);
           
           $received_so_far = $this->totalReceivedForProduct($product->id);
           //echo "[$received_so_far]";
            $max = $product->join_qty-$received_so_far;
           
            $input = new Input("received[$product->unique]","$max",'number');
            $input->setAttr("required","required");
            $input->setAttr("max",$max);
            $input->setAttr("min",0);
            $input->setClass("form-control received");
           
           
           
            $td = new Td($input);
            $tr->add($td);
           
            $input = new Input("price[$product->unique]","$product->cost",'number');
            $input->setAttr("required","required");
            $input->setAttr("readonly","readonly");
             $input->setStyle("text-align:right");
            $input->setClass("form-control cost");
            $td = new Td($input);
            $tr->add($td);
           
            $total_fila = $product->cost*$product->join_qty;
           
            $subtotal = $subtotal+ $total_fila;
            
            //$subtotal = nf($subtotal);
            $input = new Input("subtotal[$product->unique]",$total_fila,'text');
            $input->setAttr("required","required");
            $input->setStyle("text-align:right");
            
           // $input->setAttr("disabled","disabled");
            $input->setClass("form-control total_fila");
            $td = new Td($input);
            $tr->add($td);
           
           
           $tbody->add($tr);
           
       }  
      
       
             
        $foot = new Tfoot();
        
        $tr = new Tr();
			        $td = new Td("Subtotal ");
			        $td->setAttr("colspan",4);
			        $td->setStyle("text-align:right");
	        $tr->add($td);
	        
			        $input = new Input("subtotal","$subtotal");
                                $input->setId("subtotal");
			        $input->setStyle("text-align:right");
			        $input->setClass("form-control");
	        
        		$td =new Td($input);
        	$tr->add($td);
        
        $foot->add($tr);
        
        
        $tr = new Tr();
        
            $td = new Td("Descuentos (%)");
            $td->setAttr("colspan",4);
            $td->setStyle("text-align:right");
        $tr->add($td);
        
            $input = new Input("desc","$total_discounts_label");
            $input->setId("discount");
            $input->setStyle("text-align:right");
            $input->setClass("form-control");
        
            $td =new Td($input);
        $tr->add($td);
        
        $foot->add($tr);
        
        $tr = new Tr();
        
            $td = new Td("Subtotal - Descuentos ");
            $td->setAttr("colspan",4);
            $td->setStyle("text-align:right");
        $tr->add($td);
        
        $total_minus_discounts = $subtotal - ($subtotal * $total_discounts/100);
            $input = new Input("total_minus_discounts","$total_minus_discounts");
            $input->setId("total_minus_discounts");
            $input->setStyle("text-align:right");
            $input->setClass("form-control");
        
            $td =new Td($input);
        $tr->add($td);
        
        $foot->add($tr);
        
        
        // iva row 
            $iva  = ($tax->percent/100)*$total_minus_discounts;
            $tr = new Tr();
			       
                                $hidden_iva = new Input("iva",$tax->percent,"hidden");
                                $hidden_iva->setId("iva");
                                
                                $td = new Td("IVA (".($tax->percent*1)."%)".$hidden_iva);
			        $td->setAttr("colspan",4);
			        $td->setStyle("text-align:right");
	        $tr->add($td);
	        
			        $input = new Input("desc","$iva");
                                $input->setId("total_de_iva");
			        $input->setStyle("text-align:right");
			        $input->setClass("form-control");
	        
        		$td =new Td($input);
        	$tr->add($td);
        
        $foot->add($tr);
        
        
            $total = $iva + $total_minus_discounts;
        
            $tr = new Tr();
		        $td = new Td("Total");
		        $td->setAttr("colspan",4);
		        $td->setStyle("text-align:right");
	        
			$tr->add($td);
	        
					$input = new Input("total_final","$total");
                                        $input->setId("total_final");
			        $input->setStyle("text-align:right");
			        $input->setClass("form-control saveNumeric");
		        
	        	$td =new Td($input);
        
			$tr->add($td);
        
        
        
        $foot->add($tr);
        
        
        
        
        
        
        
        
        $table->add($tbody);
        $table->add($foot);
        
        return $table;
        
    }
    
   
   /*para desplegar en el listado frontal de las ordentes*/
   function getRecibosTable()
   {
        $all = $this->receipt->get()->all;
      
       
        
        $headers = array("No.",
                         "Pzas",
                         "Total","","");
        $columns = array(
                         array( 'field'=>'id'),
                         array( 'function'=>'getTotalItemsReceived'),
                         array( 'function'=>'getTotalPaid'),
                         array( 'function'=>'getPdf'),
                         array( 'function'=>'getView'),
                        
            
                         
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
        $table->setClass("table table-bordered subtable");
        $style= new Css(".subtable th{text-align:center}");
        $table->add($style);
        
      
        return $table;
        
   }
   
   
   function totalReceivedForProduct($product_id){
       $total = 0;
       $receipts = $this->receipt->include_join_fields()->where_related("product","id",$product_id)->get();
       foreach ($receipts as $receipt){
          // echo $receipt->join_qty;
          $total += $receipt->join_qty;
           
       }
      // echo $total;
       return $total;
       
   }
}

/* End of file template.php */
/* Location: ./application/models/template.php */
