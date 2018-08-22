var extractPrice = function (price) {  
   return parseFloat(price.replace(/\./g, '').replace(/,/g,'.').replace(/[^\d\.]/g,''));
}

var priceLabel = function (price) {  
   return '$' + price.toString().replace(/\./g,',');
}