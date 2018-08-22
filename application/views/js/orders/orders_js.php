<script src="<?=base_url()?>resources/js/handlebars.js"></script>
<script src="<?=base_url()?>resources/js/typeahead.js"></script>
<!-- colchorama -->
<script>
  

 var matchStudies = function(data) {
    return function findMatches(q, cb) {
    var matches, substringRegex;

    // an array that will be populated with substring matches
    matches = [];
    mapStudies = {};
    // regex used to determine if a string contains the substring `q`
    substrRegex = new RegExp(q, 'i');

    // iterate through the pool of strings and for any string that
    // contains the substring `q`, add it to the `matches` array
    $.each(data, function(i, obj) {
       // if the code ot the name match, put them in the suggestion list 
      if (substrRegex.test(obj.name) || substrRegex.test(obj.modelo)) {
        mapStudies[obj.name] = obj
        matches.push(obj);
      }
    });

    cb(matches);
  };
};
    
    
 data_products =<?= $products ?>; 
    




$(document).ready(function(){
    


    
    
     $(".studies").typeahead({
  hint: true,
  highlight: true,
  minLength: 1
},{
  name: 'studies',
  display:'description',
  source: matchStudies(data_products),
  templates: {
 
    empty: [
      '<div class="empty-message">',
        '<p style="padding:10px">No hay coincidencias.Haga\n\
        <a href="" class="btn"> click aqui</a> \n\
        para agregar un nuevo <b>producto</b></p>',
      '</div>'
    ].join('\n'),
    suggestion: Handlebars.compile('<div>{{name}} <b>{{modelo}}</b> <img width="60px" src="{{image}}"></div>')
  }
  
  
});
   
    

  




    
    
    
/*-------------studies----------------------*/












$('.studies').bind('typeahead:select', function(ev, selected_item) {
  // fill in the study or the bundle, if the 
  // bundle is selected then we habe to clr the styu and vicevesa
  
    console.log(selected_item);
        $(this).attr("id",selected_item.id);
        
        
        
        var price = (selected_item.price)
        var image = selected_item.image;
        var parent = $(this).closest("tr");
        var price_cell = $(parent).find(".price");
        var qty_cell = $(parent).find(".qty");
        var image_cell = $(parent).find(".image");
        var remove_item = $(parent).find(".removeItem");
        $(remove_item).attr("deletes",selected_item.id);
        
        var selected_id = $(parent).find(".selected_id");
        // set the parent id
        $(parent).attr("id",selected_item.id);
        
        $(selected_id).val(selected_item.id);
        
        
        var theimage = $("<img src='"+image+"'>").attr("width",50);
        console.log(theimage)
        image_cell.append(theimage)
        
        // initially set it to 1
        $(qty_cell).val(1).trigger("change");
        
        price_cell.val(price).trigger("change");
       
       
        
});   
    /*estos son los hiddens que se van al form*/
  

 
    
/*-----------------------------------------------------------------*/



    
/*------------------end function ------------------------------*/    
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
    /*compute the grand total for this operation*/
    $(document).ready(function(){
        
        $('.price').change(function(){
            computeTotal();
        });
        $('.qty').change(function(){
            //alert("qty changed")
            _discountChange();
        });
    });
    
    function computeTotal(){
        var total = 0;
        var parent  = null;
        $(".price").each(function(){
                
                //if (parent==null)
                parent = $(this).closest('tr');
        
                var qty =  parent.find('.qty');
                var qtyVal = 1;
                if ($(qty).val()!=''){
                    
                    qtyVal = parseInt($(qty).val());
                    
                }
                var val = ($(this).val());
                if (val!='')
                {
                    val = parseFloat(val)
                }
                total = total +( qtyVal*val );
            });
            
        $("#grand-total").val(total);
        
    }

</script>

<script>

$(document).ready(function(){

    $(".discount").change(function(){
       _discountChange(); 
    });
    
    $("form").on("submit",function(){
        
        return confirm("¿Guardar la orden?");
        
    });
    

});
    
function _discountChange(){
    var descuento = $("input[name='descuento[]']");
    
    var arr = $(descuento).map(function () {
    return this.value; // $(this).val()
}).get();
    
    console.log(arr);
    $("#discounts").val(arr.join(","));
    var total_order = $("#grand-total").val();
    
    var total_discount=  0; 
    $(".discount").each(function(){
       
       var val = $(this).val();
       val = parseFloat(val);
       if (!isNaN(val)){
           total_discount = total_discount + val;
        }
    });
    computeTotal();
    var total = $("#grand-total").val();
    var final_total = total - total*(total_discount/100); 
    console.log("total discount "+total_discount);
    $("#grand-total").val(final_total);
}    

</script>

<script>

$(document).ready(function(){
    
    
    //alert("i am ready");
    
    var discounts = $("#discounts").val();
    if (discounts != undefined){
    discounts_array = discounts.split(",");
    elements = $('input[name="descuento[]"]');
    for(e in discounts_array){
        
       var dis = discounts_array[e]
       
       if (!isNaN(dis)){
           
         $(elements[e]).val(dis);
       }
       else{
           
           console.log(dis + " us not a number");
       }
        
    }
    }
    _discountChange();
   
    $(".removeItem").on("click",function(){
        
        var res = confirm("¿ Quitar este producto de la orden? ");
        if (res){
            var removes = $(this).attr("deletes"); 
            $("#"+removes).css("font-weight","bold");
            $("#"+removes).remove();
            _discountChange();
        }
        return false;
    });
    
});

</script>