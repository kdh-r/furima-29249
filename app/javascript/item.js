function item(){
  const item = document.getElementById("item-price")
  item.addEventListener("input", () => {
  const price = document.getElementById("item-price").value;
  const fee = Math.floor( price / 10);
  console.log(fee)
  const profit = ( price - fee);
  document.getElementById("add-tax-price").textContent=fee;
  document.getElementById("profit").textContent=profit;
  });
}

window.addEventListener("load", item);