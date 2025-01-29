  const price = () => {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profitDisplay = document.getElementById("profit");

  const updatePrices = () => {
    const priceValue = parseFloat(itemPrice.value) || 0;
    const fee = Math.round(priceValue * 0.1); 
    const profit = priceValue - fee; 
  
    addTaxPrice.textContent = fee; 
    profitDisplay.textContent = profit;
  };

  itemPrice.addEventListener("input", updatePrices);
  updatePrices(); 

};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);