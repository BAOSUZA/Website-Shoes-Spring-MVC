let nav = document.getElementById('header');
let items = document.querySelectorAll('.item');
let itemsTab = document.querySelectorAll('.itemTab');
document.addEventListener('scroll', (event) => {
    if (window.scrollY > 400) {
        nav.classList.add('toFixed');
    } else {
        nav.classList.remove('toFixed');
    }
    items.forEach(item => {
        if (item.offsetTop - window.scrollY < 700) {
            item.classList.add('active');
        }
    })
    itemsTab.forEach(itemTab => {
        if (itemTab.offsetTop - window.scrollY < 600) {
            itemTab.classList.add('activeTab');
        }
    })
})


// Hàm phân trang chung
function paginate(itemSelector, itemsPerPage, currentPage, paginationId, paginationClass) {
    var itemProducts = document.querySelectorAll(itemSelector);
    var allElements = document.querySelectorAll(paginationClass);

    function hideAllItems() {
        itemProducts.forEach(function (item) {
            item.style.display = "none";
        });
    }

    function showItemsOnPage() {
        hideAllItems();
        var startIndex = (currentPage - 1) * itemsPerPage;
        var endIndex = startIndex + itemsPerPage;
        for (var i = startIndex; i < endIndex; i++) {
            if (itemProducts[i]) {
                itemProducts[i].style.display = "flex";
            }
        }
    }

    // Xử lý sự kiện khi nút "Trở lại" được nhấn
    if (allElements.length > 0) {
        allElements[0].addEventListener("click", function () {
            var totalPages = Math.ceil(itemProducts.length / itemsPerPage);
            if (currentPage > 1) {
                currentPage--;
            } else {
                currentPage = totalPages;
            }
            showItemsOnPage();
            updatePagination(); // Cập nhật màu sắc của phân trang
        });
    }

    // Xử lý sự kiện khi nút "Tiếp theo" được nhấn
    if (allElements.length > 0) {
        allElements[allElements.length - 1].addEventListener("click", function () {
            var totalPages = Math.ceil(itemProducts.length / itemsPerPage);
            if (currentPage < totalPages) {
                currentPage++;
            } else {
                currentPage = 1;
            }
            showItemsOnPage();
            updatePagination(); // Cập nhật màu sắc của phân trang
        });
    }
    
    function createPagination() {
        var totalPages = Math.ceil(itemProducts.length / itemsPerPage);
        var pagination = document.getElementById(paginationId);

        for (var i = 1; i <= totalPages; i++) {
            var li = document.createElement("li");
            li.textContent = i;
            li.onclick = function (event) {
                currentPage = parseInt(event.target.textContent);
                showItemsOnPage();
                updatePagination(); // Cập nhật màu sắc của phân trang
            };
            if (i === currentPage) {
                li.classList.add("current-page");
            }
            pagination.appendChild(li);
        }
    }

    function updatePagination() {
        var liElements = document.querySelectorAll("#" + paginationId + " li");
        liElements.forEach(function (li) {
            if (parseInt(li.textContent) === currentPage) {
                li.classList.add("current-page");
            } else {
                li.classList.remove("current-page");
            }
        });
    }

    showItemsOnPage();
    createPagination();
}

// Phân trang cho sản phẩm khuyến mãi
paginate(".Promotion-products--item", 1, 1, "page-item-discount", ".item-discount");

// Phân trang cho tất cả sản phẩm
paginate(".All-products__shop--item", 1, 1, "page-item-all", ".item-all");

// Phân trang cho các loại sản phẩm
paginate(".All-products--items", 1, 1, "page-item-typeProduct", ".item-typeProduct");
