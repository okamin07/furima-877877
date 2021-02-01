window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    inputValue = Number(priceInput.value);
    const addTaxDom = document.getElementById("add-tax-price");
    const addProfitlDom = document.getElementById("profit");
    const tax = Math.round(inputValue * 0.1)
    addTaxDom.innerHTML = `${tax}`
    addProfitlDom.innerHTML = `${inputValue - tax}`
  })
});
