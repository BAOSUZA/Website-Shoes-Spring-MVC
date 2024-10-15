// Lấy ra các phần tử DOM cần thiết
const selectAllCheckbox = document.getElementById('selectAll');
const itemCheckboxes = document.querySelectorAll('.itemCheckbox');
const btnCreateBill = document.querySelector('.cart--Choose__create');
const elementIdList = document.querySelector('#idList');

// Các biến lưu trữ thông tin về sản phẩm được chọn
var idList = "";
var nameList = "";
var priceList = "";
var quantityList = "";

// Hàm cập nhật trạng thái của checkbox "Chọn tất cả"
function updateSelectAllCheckbox() {
    selectAllCheckbox.checked = Array.from(itemCheckboxes).every(checkbox => checkbox.checked);
}

// Sự kiện khi checkbox "Chọn tất cả" thay đổi
selectAllCheckbox.addEventListener('change', function () {
    // Chọn hoặc bỏ chọn tất cả các checkbox sản phẩm
    itemCheckboxes.forEach(function (checkbox) {
        checkbox.checked = selectAllCheckbox.checked;
    });
    updateSelectAllCheckbox();
    updateDisplay(); // Cập nhật hiển thị sau mỗi thay đổi
});

// Sự kiện khi một checkbox sản phẩm thay đổi trạng thái
itemCheckboxes.forEach(function (checkbox) {
    checkbox.addEventListener('change', function () {
        updateSelectAllCheckbox();
        updateDisplay(); // Cập nhật hiển thị sau mỗi thay đổi
    });
});

// Hàm cập nhật thông tin và hiển thị sản phẩm được chọn
function updateDisplay() {
    // Khởi tạo các danh sách thông tin sản phẩm
    idList = "";
    nameList = "";
    priceList = "";
    quantityList = "";

    // Duyệt qua từng checkbox sản phẩm
    itemCheckboxes.forEach(function (checkbox, index) {
        // Lấy thông tin sản phẩm từ DOM
        const itemValue = document.querySelectorAll('.itemValue')[index];
        const cartItem = itemValue.closest('.cart__item');
        const itemName = cartItem.querySelector('.title').innerHTML;
        const itemQuantity = cartItem.querySelector('.quantity').value;
        const itemPrice = cartItem.querySelector('.cart__item--price p').innerHTML;

        // Xử lý khi checkbox được chọn hoặc bỏ chọn
        if (checkbox.checked) {
            // Cập nhật danh sách thông tin sản phẩm được chọn
            idList += itemValue.value + " ";
            nameList += itemName + "*";
            quantityList += itemQuantity + "*";
            priceList += itemPrice + "*";
            cartItem.style.border = '1px solid red';
        } else {
            cartItem.style.border = '1px solid #bababa';
        }
    });

    // Chuyển đổi chuỗi thông tin thành mảng 
    nameList = nameList.trim().split("*");
    quantityList = quantityList.trim().split("*");
    priceList = priceList.trim().split("*");
    idList = idList.trim().split(" ").join(",");

    // Cập nhật giá trị của trường input "idList"
    elementIdList.value = idList;
}

// Sự kiện khi nút "Tạo hóa đơn" được click
btnCreateBill.addEventListener('click', function () {
    // Tạo danh sách sản phẩm từ thông tin đã chọn
    var productList = [];
    for (let i = 0; i < nameList.length - 1; i++) {
        const product = {
            name: nameList[i],
            quantity: quantityList[i],
            price: priceList[i]
        };
        productList.push(product);
    }
    displayProductList(productList); // Hiển thị danh sách sản phẩm
});

// Hàm hiển thị danh sách sản phẩm và tổng giá trị
function displayProductList(productList) {
    var productListDiv = $("#orderContainer");
    var totalAmount = 0;

    // Xóa nội dung hiện tại của container sản phẩm
    productListDiv.empty();

    // Duyệt qua từng sản phẩm để hiển thị và tính tổng giá trị
    productList.forEach(function (product) {
        var orderCol = $("<div class='order-col'></div>");
        var nameContainer = $("<div></div>");
        var nameElement = $("<strong class='order-col__name'></strong>").text(product.name);
        nameContainer.append(nameElement);
        var priceElement = $("<div class='order-col__price'></div>").text(product.quantity + " x " + product.price);
        orderCol.append(nameContainer, priceElement);
        productListDiv.append(orderCol);

        // Chuyển đổi chuỗi thành số và tính tổng giá trị
        var quantity = parseInt(product.quantity.replace(",", ""));
        var price = parseInt(product.price.replace("đ", "").replace(",", ""));
        totalAmount += quantity * price;
    });

    // Hiển thị tổng giá trị
    $("#order-total__temp").text(totalAmount.toLocaleString('en-US') + 'đ');
    $("#order-total").text(totalAmount.toLocaleString('en-US') + 'đ');
}
