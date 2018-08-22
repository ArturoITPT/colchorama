<!-------------multi starts ------------------>
<script src="<?= base_url() ?>assets/js/jquery.multi-select.js" type="text/javascript"></script>
<script>

    $('select.multi').multiSelect({
        selectableHeader: "<div class='custom-header'>Disponibles</div>",
        selectionHeader: "<div class='custom-header'>Seleccionados</div>",
    });

</script>
<link href="<?= base_url() ?>assets/css/multi-select.css" rel="stylesheet" type="text/css"/>
<!--------------multi ends----------------->

<script>
    
    

    $(document).ready(function(){
        //alert("eady")
        
        
       
        
        shortlistchildren($("#state_id"));
        $("#state_id").change(function(){
            
            shortlistchildren($(this));
            
        });
        
     
    });
    
    function shortlistchildren(obj){
        var updates = $(obj).attr("updates");
            var selected = $("#"+updates).val();
            var update_url = $(obj).attr("update_url");
            update_url =  update_url.replace("{parent_id}", $(obj).val());
            update_url =  update_url.replace("{child_id}", selected);
            //alert(update_url)
            $.get(update_url,function(data){
                //alert(data)
                //aconsole.log(data);
                $("#"+updates).empty();
                for(element in data){
                        var sel = '';
                        if (data[element].selected==1)
                            sel= 'selected'
                        $("#"+updates).append('<option  '+sel+' value='+data[element].id+'>'+data[element].name+'</option>');
                        
                    }
            });
        
        
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