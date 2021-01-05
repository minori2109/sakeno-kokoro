if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  function calcPrice() {
    const itemPrice = document.getElementById("item-price");
  
    itemPrice.addEventListener("input", ()=> {
      const inputValue = itemPrice.value;
      
      const addTaxDom = document.getElementById("add-tax-price");
      const addTaxPrice = inputValue * 0.1;
      addTaxDom.innerHTML = Math.floor(addTaxPrice);
      
      const profit = document.getElementById("base-price");
      profit.innerHTML = Math.floor(inputValue - addTaxPrice); 
    });
  }
}

setInterval(calcPrice, 1000);