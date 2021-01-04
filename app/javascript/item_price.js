window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDOM = document.getElementById("profit");

    console.log(inputValue);
    addTaxDom.innerHTML = Math.round(inputValue * 0.1)
    profitDOM.innerHTML = Math.ceil(inputValue * 0.9)
  })
})
