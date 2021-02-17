function calc_profit() {
  let price = document.getElementById("item-price").value;
  document.getElementById("add-tax-price").innerHTML = parseInt(price * 0.1);
  document.getElementById("profit").innerHTML = price - parseInt(price * 0.1);
};
setInterval(calc_profit, 500);