<?php

//echo "class GET loaded ";
define("DEBUG", false);
class Get
{


    public $CI;


    function __construct()
    {

        $this->CI = &get_instance();

        $this->CI->load->database();


    }
    
    /*tested working well , atomic value, row and column*/
    
    function one($sql, $id = null)
    {
       

        $q = $this->CI->db->query($sql, true);

        

        if ($q->num_rows() > 0) {

            $k = $q->list_fields();// get the header of the column, for example id, or menu_id or name
            $field = current($k);
            
            $val = $q->row()->$field;
            return $val;
            

        } else
            
        return null;

    }


    function assoc($sql, $before_array = null, $label = 'name')
    {
         /*all sql must name it AS result */
        //echo "legando [$sql ]<br />";
        if (stripos($sql, 'SELECT') === false) { // $sql would be just the table
            //echo "no tienes tiene select <br />";
            $sql = "SELECT `id` , `" . $label . "` FROM  `$sql` ";
        } else {
            //echo "Di  tienes tiene select [$sql][]";
            $sql = $sql;
        }

        // echo "[$sql]";
        $array = array();
        $q = $this->CI->db->query($sql, true);
        //

        $k = $q->list_fields();

        //echo "<pre>";print_r($k); echo "</pre>";


        $key = $k[0];
        $value = $k[1];

        //echo "$key $value ";

        $r = $q->result_array();

        //print_R($r);

        if ($q->num_rows() > 0) {
            foreach ($r as $k => $v) {
                $array[$v[$key]] = $v[$value];
            }

            //print_r($array);
            if (!empty($before_array))
                return array($before_array + $array);
            else
                return $array;
        } else
            return null;

    }


    function row($sql)
    {
        $resultado = array();
        if (DEBUG)
            echo "get one sql : $sql <br />";

        $q = $this->CI->db->query($sql, true);
        if ($q->num_rows() > 0) {

            $fields = $q->list_fields();
            $r = $q->result_array();
            foreach ($fields as $field) {

                //echo "$field = {$r[0][$field]} <br />";
                $resultado[$field] = $r[0][$field];

            }
            //print_r($resultado);
            return $resultado;

        } else
            return null;

    }


    function all($query = '')
    {


        $q = $this->CI->db->query($query, true);
        return $q->result_array();
    }
    
    function query($sql = ''){
        echo "in query";
        $this->CI->db->query($sql);
    }

}
?>