<script src="<?= base_url() ?>assets/js/jquery.multi-select.js" type="text/javascript"></script>
<script>

    $('select').multiSelect({
        selectableHeader: "<div class='custom-header'>Disponibles</div>",
        selectionHeader: "<div class='custom-header'>Seleccionados</div>",
    });

</script>
<link href="<?= base_url() ?>assets/css/multi-select.css" rel="stylesheet" type="text/css"/>

<style>
    
.custom-header {
    text-align: center;
    padding: 3px;
    background: #999;
    color: #fff;
}
    
</style>