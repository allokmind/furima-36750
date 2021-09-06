function itemPrice() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue*0.1)
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = inputValue - Math.floor(inputValue*0.1)
 })
};

window.addEventListener('load', itemPrice)