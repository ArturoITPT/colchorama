<script src="<?=base_url()?>resources/js/handlebars.js"></script>
<script src="<?=base_url()?>js/typeahead.bundle.js"></script>
<script>

 
    
  var remote = '<?= site_url('services/orders_service/get/'.rand(0, 10000));?>';  
  
  //var remote = '<?= site_url('services/orders_service/get/1');?>';  
   // prompt(remote,remote)
  var bestPictures1 = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('description'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  prefetch: remote,
 
});

bestPictures1.initialize();

// passing in `null` for the `options` arguments will result in the default
// options being used
$('#order_id').typeahead(null, {
  name: 'best-pictures',
  display: 'id',
  source: bestPictures1,
  templates: {
    empty: [
      '<div class="empty-message">',
        'unable to find any Best Picture winners that match the current query',
      '</div>'
    ].join('\n'),
    suggestion: Handlebars.compile('<div>Numero de Orden: <strong>{{id}}</strong><br>{{#productos}}{{name}}<br>{{/productos}}<hr></div>')
  }
});
    

</script>
    
<style>
    
    
.twitter-typeahead{
width: 100%;
}

.table-of-contents li {
  display: inline-block;
  *display: inline;
  zoom: 1;
}

.table-of-contents li a {
  /*font-size: 16px;*/
  color: #999;
}

p + p {
  margin: 30px 0 0 0;
}

/* site theme */
/* ---------- */

.title {
  margin: 20px 0 0 0;
  font-size: 64px;
}

.example {
  padding: 30px 0;
}

.example-name {
  margin: 20px 0;
  font-size: 32px;
}

.demo {
  position: relative;
  *z-index: 1;
  margin: 50px 0;
}
/*
.typeahead,
.tt-query,
.tt-hint {
  width: 396px;
  height: 30px;
  padding: 8px 12px;
  /*font-size: 24px;*/
  /*line-height: 30px;
  border: 2px solid #ccc;
  -webkit-border-radius: 8px;
     -moz-border-radius: 8px;
          border-radius: 8px;
  outline: none;
}
*/
.typeahead {
  background-color: #fff;
}

.typeahead:focus {
  border: 2px solid #0097cf;
}

.tt-query {
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
}

.tt-hint {
  color: #999
}

.tt-menu {
  width: 422px;
  margin: 12px 0;
  padding: 8px 0;
  background-color: #fff;
  border: 1px solid #ccc;
  border: 1px solid rgba(0, 0, 0, 0.2);
  -webkit-border-radius: 8px;
     -moz-border-radius: 8px;
          border-radius: 8px;
  -webkit-box-shadow: 0 5px 10px rgba(0,0,0,.2);
     -moz-box-shadow: 0 5px 10px rgba(0,0,0,.2);
          box-shadow: 0 5px 10px rgba(0,0,0,.2);
}

.tt-suggestion {
  padding: 3px 20px;
 /* font-size: 18px;*/
  line-height: 24px;
}

/***/

.tt-suggestion:hover {
  cursor: pointer;
  color: #fff;
  background-color: #0097cf;
}

.tt-suggestion.tt-cursor {
  color: #fff;
  background-color: #0097cf;

}

.tt-suggestion p {
  margin: 0;
}

.gist {
 font-size: 14px;
}

/* example specific styles */
/* ----------------------- */

#custom-templates .empty-message {
  padding: 5px 10px;
 text-align: center;
}

#multiple-datasets .league-name {
  margin: 0 20px 5px 20px;
  padding: 3px 0;
  border-bottom: 1px solid #ccc;
}

#scrollable-dropdown-menu .tt-menu {
  max-height: 150px;
  overflow-y: auto;
}

#rtl-support .tt-menu {
  text-align: right;
}


</style>

<script>
    $(document).ready(function(){
        var server = '<?= site_url("services/orders_service/table/")?>';
        
        console.log("server item "+server);
        
        
        $('#order_id').bind('typeahead:select', function(ev, selected_item) {
     
           
            var id = selected_item.id
            var resource = server+"/"+id;
            //prompt(resource,resource)
            $.get(resource,function(data){
                console.log(data)
                $("#products").html(data);
                
            });
           
    
        });
    
    });
  
       
    $(document).on("change", '.received', function(event) { 
        
            var parent = $(this).closest("tr");
            var cost = parent.find(".cost").val();
           //  console.log("cost" +cost)
            var qty = $(this).val();
            //   console.log("qty" +qty)
            qty = parseInt(qty);
            cost = parseFloat(cost);
            
            var total_fila = parent.find(".total_fila");
            $(total_fila).css("border","1px solid red");
           
            var total_ = qty * cost;
          //  total_l = total_.formatMoney()
            $(total_fila).val(total_)
            //
            // subtotal with the change
            var subtotal = 0;
            $(".total_fila").each(function(){
                
                var _total_parcial = $(this).val();
                _total_parcial = parseFloat(_total_parcial)
                if (!isNaN(_total_parcial)){
                    subtotal += _total_parcial;
                }
                
            });
            $("#subtotal").val(subtotal);
            
            // get me the discount 
            
            var discount = $("#discount").val();
            console.log("discount",discount)
            
            var total_minus_discounts = $("#total_minus_discounts").val();
            console.log(total_minus_discounts);
            
            total_minus_discounts = subtotal - subtotal*discount/100
            console.log("subtotal new is ",subtotal)
            
            $("#total_minus_discounts").val(total_minus_discounts)
            
            // tax 
            
            var iva = $("#iva").val();
            iva = parseInt(iva)
            console.log("iva parsed",iva)
            var total_de_iva = total_minus_discounts * iva/100
            $("#total_de_iva").val(total_de_iva);
            
            // total final 
            
            
            var total_final = total_de_iva + total_minus_discounts;
            total_final = priceLabel(total_final)
            $("#total_final").val(total_final);
            
            //alert(extractPrice(total_final))
            
            
       
    });
       
    $(document).on("keypress", ":input:not(textarea)", function(event) {
        return event.keyCode != 13;
    });   
    Number.prototype.formatMoney = function(c=2, d='.', t=','){
    var n = this, 
    c = isNaN(c = Math.abs(c)) ? 2 : c, 
    d = d == undefined ? "." : d, 
    t = t == undefined ? "," : t, 
    s = n < 0 ? "-" : "", 
    i = String(parseInt(n = Math.abs(Number(n) || 0).toFixed(c))), 
    j = (j = i.length) > 3 ? j % 3 : 0;
   return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
 };
 
 var extractPrice = function (price) {  
   return parseFloat(price.replace(/\./g, '.').replace(/,/g,'').replace(/[^\d\.]/g,''));
}

var priceLabel = function (price) { 
    var label = price.formatMoney();
    return '$ ' + label;
   //return '$' + price.toString().replace(/\./g,',');
}
 
 
$(document).ready(function(){
    
    $("form").on("submit",function(){
            
            
          // antes de buardar pasa de $ 4,580.56 a 4580.56  
          $(".saveNumeric").each(function(){
              
            toVal($(this))
              
          });
       
    });
    
    
    function toVal(obj){
        
       
       // alert($(obj).val())
        var s=  $(obj).val();
        var p = extractPrice(s);
        $(obj).val(p);
        
        
    }
    
}); 
 

 
 
</script>