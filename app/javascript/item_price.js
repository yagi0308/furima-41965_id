window.addEventListener("load", () => {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profitDisplay = document.getElementById("profit");

  itemPrice.addEventListener("input", () => {
    const price = parseFloat(itemPrice.value) || 0;
    const fee = price * 0.1;
    const profit = price - fee;

    addTaxPrice.textContent = Math.floor(fee);
    profitDisplay.textContent = Math.floor(profit);
  });
});
