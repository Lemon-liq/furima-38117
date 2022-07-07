window.addEventListener('load', () => {
 
  const priceInput = document.getElementById("item-price");
    console.log(priceInput);
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById('add-tax-price');
      tax = inputValue * 0.1
      addTaxDom.innerHTML = Math.floor(tax);
    const profitDom = document.getElementById('profit');
      profitDom.innerHTML = Math.floor(inputValue - tax);
  })
   
});
