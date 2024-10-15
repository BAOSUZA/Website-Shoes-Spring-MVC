// Lấy danh sách dữ liệu loại kích thước từ jsp
var sizeListStr = document.querySelector('.content__detail-shoes').getAttribute('data-list-size');
var sizeItems = sizeListStr.split(";");
var sizeLists = [];
// Lấy class để xử lý thay đổi số lượng sản phẩm muốn mua
var decSpan = document.querySelector(".dec");
var incSpan = document.querySelector(".inc");
var amountInput = document.querySelector(".amount-product");
// Lấy id và class để xử lý chức năng thêm kiểm tra số lượng sản phẩm
var radioButtons = document.querySelectorAll('input[type="radio"][name="size_id"]');
var productSold = document.getElementById("productSold");
var remainProduct = document.getElementById("remainProduct");
var buyNowLink = document.getElementById("buyNowLink");

var sizeId = 0;
var quantity = 1;
var currentUrl = buyNowLink.getAttribute('href');

convertData();
setupDataBegin();
updateAmount()

// $(document).ready(function () {
//     $("#addToCartForm").submit(function (event) {
//         event.preventDefault();
//         var formData = $(this).serialize();

//         // Gửi yêu cầu AJAX để thêm sản phẩm vào giỏ hàng
//         $.ajax({
//             type: "POST",
//             url: addToCartURL,
//             data: formData,
//             success: function (response) {
//                 var quantityToPurchase = parseInt($(".amount-product").val());
//                 var selectedSize = $("input[type='radio'][name='size_id']:checked").attr("value-size");

//                 for (var i = 0; i < sizeLists.length; i++) {
//                     if (sizeLists[i].Size == selectedSize) {
//                         sizeLists[i].Quantity -= quantityToPurchase;
//                         sizeLists[i]['Quantity Purchased'] += quantityToPurchase;
//                         $("#productSold").text(sizeLists[i]['Quantity Purchased']);
//                         $("#remainProduct").text("Còn hàng (" + sizeLists[i].Quantity + " sản phẩm)");
//                         break;
//                     }
//                 }
//             },
//             error: function (error) {
//                 console.log(error);
//             }
//         });
//     });
// });

// Thêm dữ liệu vào sizeLists
function convertData() {
    for (var i = 0; i < sizeItems.length - 1; i++) {
        var sizeItem = sizeItems[i];
        var sizeInfo = {};
        var attributes = sizeItem.split(",");

        for (var j = 0; j < attributes.length; j++) {
            var attribute = attributes[j].split("=");
            var key = attribute[0];
            var value = attribute[1];
            sizeInfo[key] = isNaN(value) ? value : Number(value);
        }

        sizeLists.push(sizeInfo);
    }
}

// Lấy tổng số sản phẩm đã bán và còn lại trong kho
function setupDataBegin() {
    var totalProductSold = sizeLists.reduce(function (total, size) {
        return total + size['Quantity Purchased'];
    }, 0);
    var totalRemainProduct = sizeLists.reduce(function (total, size) {
        return total + size.Quantity;
    }, 0);
    productSold.textContent = totalProductSold;
    remainProduct.textContent = "Còn hàng (" + totalRemainProduct + " sản phẩm)";
    decSpan.classList.add("disabled");
    incSpan.classList.add("disabled");
    buyNowLink.classList.add("disabled");
}

// Thêm chức năng cho tất cả các thẻ input (radio)
function updateAmount() {
    radioButtons.forEach(function (radio) {
        radio.addEventListener('click', function () {
            for (var i = 0; i < sizeLists.length; i++) {
                var child = sizeLists[i];
                if (this.getAttribute('value-size') == child.Size) {
                    productSold.textContent = child['Quantity Purchased'];
                    this.value = child.ID;
                    sizeId = child.ID;
                    if (child.Quantity > 0) {
                        remainProduct.textContent = "Còn hàng (" + child.Quantity + " sản phẩm)";
                        buyNowLink.classList.remove("disabled");
                        decSpan.classList.remove("disabled");
                        incSpan.classList.remove("disabled");
                        amountInput.value = 1;
                        changeAmount(child.Quantity);
                    } else {
                        remainProduct.textContent = "Hết hàng";
                        buyNowLink.classList.add("disabled");
                        decSpan.classList.add("disabled");
                        incSpan.classList.add("disabled");
                        amountInput.value = 0;
                    }
                }
            }
        });
    });
}

// Thay đổi số lượng muốn mua
function changeAmount(remainAmount) {
    var currentValue = parseInt(amountInput.value);
    decSpan.addEventListener("click", function () {
        if (currentValue > 0) {
            currentValue--;
            amountInput.value = currentValue;
            if (currentValue == 0) {
                decSpan.classList.add("disabled");
                buyNowLink.classList.add("disabled");
            } else {
                decSpan.classList.remove("disabled");
                incSpan.classList.remove("disabled");
            }
        }
        quantity = currentValue;
        var newUrl = currentUrl + '/' + sizeId + '/' + quantity;
        buyNowLink.setAttribute('href', newUrl);
    });
    incSpan.addEventListener("click", function () {
        if (currentValue < remainAmount) {
            incSpan.classList.remove("disabled");
            buyNowLink.classList.remove("disabled");
            currentValue++;
            amountInput.value = currentValue;
            if (currentValue == remainAmount) {
                incSpan.classList.add("disabled");
            } else {
                decSpan.classList.remove("disabled");
                incSpan.classList.remove("disabled");
            }
        }
        quantity = currentValue;
        var newUrl = currentUrl + '/' + sizeId + '/' + quantity;
        buyNowLink.setAttribute('href', newUrl);
    });
    var newUrl = currentUrl + '/' + sizeId + '/' + quantity;
    buyNowLink.setAttribute('href', newUrl);
}