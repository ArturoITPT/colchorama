<script>
    
    $(document).ready(function(){
        
         $("#filter_receipts_orders").change(function(){
             
            $("form").submit();
             
         });
        
    });
    
    
</script>    

<style>
    
    .sidebar-navigation{
       /* display: none;*/
    }
    
</style>

<script>
    $(document).ready(function(){
        
        $(".open-order-view").on("click",function(){
        
                var receipt_id = $(this).data('receipt');
                    //console.log(myBookId)
                var endpoint = '<?= site_url("services/receipts_service/serve/") ?>'+'/'+ receipt_id;    
                console.log("endpoint",endpoint);
                $('#myModal').find('.modal-body')
                             .html('loading...')
                             .load(endpoint,function(){
                                 
                                 console.log("loadedd")
                                 
                             });
                     
                    
               
                $('#myModal').modal('show');
            
        });
            
        
        
        
    });
</script>



<div  id="myModal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Recibo</h4>
      </div>
      <div class="modal-body">
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

