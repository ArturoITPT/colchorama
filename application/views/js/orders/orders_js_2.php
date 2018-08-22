<script src="<?=base_url()?>resources/js/handlebars.js"></script>
<script src="<?=base_url()?>resources/js/typeahead.js"></script>

<script>

$(document).ready(function(){
    
    var substringMatcher = function(strs) {
    return function findMatches(q, cb) {
    var matches, substringRegex;

    // an array that will be populated with substring matches
    matches = [];
    map = {};
    // regex used to determine if a string contains the substring `q`
    substrRegex = new RegExp(q, 'i');

    // iterate through the pool of strings and for any string that
    // contains the substring `q`, add it to the `matches` array
    $.each(strs, function(i, state) {
      if (substrRegex.test(state.name)) {
        map[state.name] = state
        matches.push(state);
      }
    });

    cb(matches);
  };
};

 var data = [{"id":1,"name":"belly","age":11,"desc":"a,v"},{"id":2,"name":"david","age":15,"desc":"h,k"}] /* <?= $patients ?>;*/
    
 
$('#paciente').typeahead({
  hint: true,
  highlight: true,
  minLength: 1
},
{
  name: 'states',
  display:'name',
  source: substringMatcher(data),
  templates: {
    empty: [
      '<div class="empty-message">',
        '<p style="padding:10px">No hay coincidencias.Haga\n\
        <a href="" class="btn"> click aqui</a> \n\
        para agregar un paciente</p>',
      '</div>'
    ].join('\n'),
    suggestion: Handlebars.compile('<div><strong>{{name}}</strong> – {{desc}} age {{age}}</div>')
  }
  
  
});
    
    
$('#paciente').bind('typeahead:select', function(ev, suggestion) {
   // alert(suggestion)
  selectedState = map[suggestion.name].id;  
  $("#patient_id").val(selectedState);
});    
    
$('#paciente').bind('typeahead:select', function(ev, suggestion) {
   // alert(suggestion)
  selectedState = map[suggestion.name].id;  
  $("#patient_id").val(selectedState);
});    
        
$('#studies').bind('typeahead:select', function(ev, suggestion) {
   
        console.log(suggestion)

});          
        
/*---------------------estudios sources -------------------------------------*/   


 var estudios = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  prefetch:'<?= site_url("operator/studies/expose_json")?>'
  
  
});

var paquetes = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('team'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
 // prefetch:'http://50.17.192.94/laboratorio/sistema/s/index.php/operator/bundles/expose_json',
  local: data
  
});

 paquetes.initialize();

$('#studies').typeahead({
  highlight: true
},
{
  name: 'nba-teams',
  display: 'name',
  source: estudios,
  templates: {
    header: '<h4 class="league-name">Estudios</h4>'
    
  }
},
{
  name: 'nhl-teams',
  display: 'name',
  source: paquetes,
  templates: {
    header: '<h4 class="league-name">paquetes</h4>',
    suggestion: Handlebars.compile('<div><strong>{{name}}</strong> – {{desc}}</div>')
  }
});   
/*------------------end studies ------------------------------*/ 

$('.#physician').typeahead({
    name: 'local-tt',
}, {
    source: function (query, cb) {
        $.ajax({
            url:'http://50.17.192.94/laboratorio/sistema/s/index.php/operator/bundles/expose_json',
            success: function(data){
                cb(data);
            }
        });
    },
    templates: {
        empty: [
            '<div class="empty-message">',
            'unable to find any Best Picture winners that match the current query',
            '</div>'].join('\n'),
        suggestion: Handlebars.compile('<p><strong>{{team}}</strong> – {{desc}}</p>')
    }
});

    
    
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