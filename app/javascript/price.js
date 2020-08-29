document.addEventListener("turbolinks:load", function () {
  $("#item-price").on("keyup", function () {
    console.log("ok");
    let price = $(this).val();
    let add_tax_price = Math.round(price * 0.1);
    let profit = price - add_tax_price
    $("#add-tax-price").text(add_tax_price);
    $("#profit").text(profit);
  });
});