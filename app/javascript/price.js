function price(){
  const priceInput = document.getElementById("item-price");
  const fee = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener("input", function(){
    const input_value = priceInput.value;

    let money = input_value * 0.1;
    let gains = input_value - money;
    
    fee.innerHTML = money
    profit.innerHTML = gains
  })
};

window.addEventListener(`load`, price);
