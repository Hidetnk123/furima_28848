window.addEventListener('load', function(){
    const price = document.getElementById("item-price");
   
    price.addEventListener('keyup', function(){
      let input_price = price.value;
      let tax = document.getElementById("add-tax-price");
      let sale = document.getElementById("profit");
      let num = 0.1
      let add_tax_price = input_price * num;
      let profit = input_price - add_tax_price;
      let comma_tax = Math.trunc(add_tax_price);
      let comma_profit = Math.trunc(profit);

      tax.textContent = Number(comma_tax).toLocaleString();
      sale.textContent = Number(comma_profit).toLocaleString();
    })
    
})
