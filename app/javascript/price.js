window.addEventListener('load', function(){
    const price = document.getElementById("item-price");
   
    price.addEventListener('keyup', function(){
      let input_price = price.value;

      let num = 0.1
      let add_tax_price = input_price * num;
      let profit = input_price - add_tax_price;
        
      let tax = document.getElementById("add-tax-price");
      let sale = document.getElementById("profit");

      tax.textContent = Math.trunc(add_tax_price);
      sale.textContent = Math.trunc(profit);
    })
    
})
