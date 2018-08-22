<script>

    $(document).ready(function(){
     
        shortlistproviders($("#provider_id"));
        $("#provider_id").change(function(){
            
            shortlistproviders($(this))   
        });
        
     
    });
    
    function shortlistproviders(obj){
        //$("#brands").empty();
        // $("#brands").append("<option>buscando marcas..</option>");
        
        var current_value = $(obj).val();
                //console.log("changed")
                var selected = $("#brands").val();
                var url = '<?= site_url()?>/services/providers_service/get_brands/'+current_value+'/'+selected;
                $.get(url,function(data){
                    
                    //console.log(data)
                    $("#brands").empty();
                    for(element in data){
                        var sel = '';
                        if (data[element].selected==1)
                            sel= 'selected'
                        $("#brands").append('<option  '+sel+' value='+data[element].id+'>'+data[element].name+'</option>');
                        
                    }
                    
                });
        
        
    }
    
    
    $(document).ready(function(){
        //initialize sliders 
        $(".slider-input").each(function(){
             
             setSliderValue($(this));
             
        });
        
        
        $(".slider-input").change(function(){
            //alert("ddd")
             setSliderValue($(this));
        
        });
        
        
    });

    function setSliderValue(obj){
       
            var parent = $(obj).closest('.slide-wrapper');
            //parent.css("border","1px solid blue");
            var span = parent.find(".slider-indicator");
            //span.css("border","1px solid red");
            span.html($(obj).val());
       
       
    }
</script>




<style>
    
.custom-header {
    text-align: center;
    padding: 3px;
    background: #999;
    color: #fff;
}

.slider-indicator{
    display: inline-block;
    border:1px solid #ccc;
    text-align: right;
    width: 34px;
    height: 30px;
    padding: 3px;
    margin-left: 10px;
}
    
</style>