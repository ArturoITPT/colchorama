<form enctype="multipart/form-data" method="post" 
    action="<?=$action?>" id=""
    class="form-horizontal">
    
    <div class="form-group">
      <div class="col-sm-12">
		<input name="" value="Guardar" type="submit"
                       class="btn btn-default pull-right">
	  </div>
   </div>
    
    <div class="form-group">
        <label class="col-sm-2 control-label">SKU</label>
        <div class="col-sm-4">
            <input name="name" value="<?=$record->name?>" 
                   type="text" 
                 class="form-control">
        </div>
        <label class="col-sm-2 control-label">Unidad</label>
        <div class="col-sm-4">
            <select name="unitsofmeasure_id" class="form-control">
                <?= $record->selectUnitsOfMeasure();?>
            </select>
        </div>
        
        
    </div>
   <div class="form-group">
        <label class="col-sm-2 control-label">Modelo</label>
        <div class="col-sm-4">
            <input name="modelo" value="<?=$record->modelo ?>" 
                   type="text" 
                 class="form-control">
        </div>
      
        <label class="col-sm-2 control-label">Impuesto</label>
        <div class="col-sm-4">
            <select name="tax_id"  class="form-control">
                <?= $record->displayOptions("Tax","tax_id") ?>
            </select>
        </div>
       
      
      
   </div>
   <div class="form-group">
      <label class="col-sm-2 control-label">Proveedor</label>
      <div class="col-sm-4">
          <select name="provider_id"  id="provider_id" class="form-control">
             <option value="" >Seleccione</option>
             <?= $record->displayOptions("Provider","provider_id") ?>
         </select>
      </div>
      <label class="col-sm-2 control-label">Categorias</label>
      <div class="col-sm-4">
         <select name="category_id" id="categories" class="form-control">
           <?= $record->displayOptions("Category","category_id"); ?>
         </select>
      </div>
      
   </div>
   <div class="form-group">
      <label class="col-sm-2 control-label">Marca</label>
      <div class="col-sm-4">
         <select name="brand_id" id="brands" class="form-control">
            <?= $record->displayOptions("Brand","brand_id");?>
         </select>
      </div>
      <label class="col-sm-2 control-label">Dias de Garantía</label>
        <div class="col-sm-4">
            <input name="garantee" value="<?= $record->garantee?>" 
                   type="number" 
                 class="form-control">
        </div>
   </div>
    
    <div class="form-group">
        <label class="col-sm-2 control-label">Descripción</label>
        <div class="col-sm-4">
            <textarea name="desc" rows="5" cols="15" 
                    class="text form-control"><?= $record->desc?></textarea>
        </div>
        
        <label class="col-sm-2 control-label">Imagen</label>
        <div class="col-sm-4">
            <input name="image" value="" 
                   type="file" 
                 class="form-control">
            <div class="image">
               <?= $record->getImage()?> 
            </div>
        </div>
        
   </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Codigo de Barras</label>
        <div class="col-sm-4">
            <input name="barcode" value="<?= $record->barcode; ?>" class="form-control">
        </div>
        
        <label class="col-sm-2 control-label">Color</label>
        <div class="col-sm-4">
            <input type="color" id="html5colorpicker"
                   class="form-control"
                   name="color"
                   onchange="clickColor(0, -1, -1, 5)" 
                   value="<?= $record->color ?>" 
                   style="">
        </div>
   </div>
    
    <div class="form-group">
        <label class="col-sm-2 control-label">Catalogo SAT </label>
        <div class="col-sm-4">
            <input name="catalogosat" value="<?= $record->catalogosat; ?>" class="form-control">
        </div>
        <label class="col-sm-2 control-label">Costo base </label>
        <div class="col-sm-4">
            <input name="cost" required="required" value="<?= $record->cost; ?>" class="form-control">
        </div>
      
   </div>
    
    
    <div class="form-group">
        <div class="slide-wrapper">
            <label class="col-sm-2 control-label" class="slider-control">
                Parametro 1:<span id="" class="slider-indicator">
                  
                </span></label>
            <div class="col-sm-2">
            <input type="range" c min="0" max="1" step="0.01"
                   value="<?= $record->param1 ?>"
                   name="param1"
                   class="slider-input " style="margin-top: 14px;"  >
            </div>
        </div>      
        <div class="slide-wrapper">
            <label class="col-sm-2 control-label" class="slider-control">
                Parametro 2:<span id="" class="slider-indicator">
                  
                </span></label>
            <div class="col-sm-2">
            <input type="range" c min="0" max="1" step="0.01" 
                    value="<?= $record->param2 ?>"
                   name="param2"
                   class="slider-input " style="margin-top: 14px;"  >
            </div>
        </div>  
         <div class="slide-wrapper">
            <label class="col-sm-2 control-label" class="slider-control">
                Parametro 3:<span id="" class="slider-indicator">
                  
                </span></label>
            <div class="col-sm-2">
            <input type="range" c min="0" max="1" step="0.01"
                   
                    value="<?= $record->param3 ?>"
                   name="param3"
                   class="slider-input " style="margin-top: 14px;"  >
            </div>
        </div>  

    </div>
    
     <div class="form-group">
        <div class="slide-wrapper">
            <label class="col-sm-2 control-label" class="slider-control">
                Parametro 4:<span id="" class="slider-indicator">
                  
                </span></label>
            <div class="col-sm-2">
            <input type="range" c min="0" max="1" step="0.01"
                   
                    value="<?= $record->param4 ?>"
                   name="param4"
                   class="slider-input " style="margin-top: 14px;"  >
            </div>
        </div>    
        <div class="slide-wrapper">
            <label class="col-sm-2 control-label" class="slider-control">
                Parametro 5:<span id="" class="slider-indicator">
                  
                </span></label>
            <div class="col-sm-2">
            <input type="range"  min="0" max="1" step="0.01" 
                   
                    value="<?= $record->param5 ?>"
                   name="param5"
                   class="slider-input " style="margin-top: 14px;"  >
            </div>
        </div>  
         <div class="slide-wrapper">
            <label class="col-sm-2 control-label" class="slider-control">
                Parametro 6:<span id="" class="slider-indicator">
                  
                </span></label>
            <div class="col-sm-2">
            <input type="range" c min="0" max="1" step="0.01"
                   
                   value="<?= $record->param6 ?>"
                   name="param6"
                   
                   class="slider-input " style="margin-top: 14px;"  >
            </div>
        </div>  

    </div>
    
   
    
    
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-6">
		<input name="" value="Guardar" type="submit" class="btn btn-default">
	  </div>
   </div>
</form>
