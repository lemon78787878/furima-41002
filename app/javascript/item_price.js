const pay = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    // 販売手数料を計算（例として10%を手数料とする）
    const tax = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = tax;

      // 販売利益を計算（金額-販売手数料で求められる）
    const addTaxDomI = document.getElementById("profit");
    const taxi = Math.floor(inputValue * 0.1);
    const abc = inputValue - taxi;
    addTaxDomI.innerHTML = abc;
  })

}

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);