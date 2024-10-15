<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.nqb.convert.ConvertData" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/assets/user/css/grid.css" />">
    <link rel="stylesheet" href="<c:url value="/assets/user/css/header-footer.css" />">
    <link rel="stylesheet" href="<c:url value="/assets/user/css/home.css" />">
    <link rel="stylesheet" href="<c:url value="/assets/user/css/responsive.css" />">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Detail</title>
</head>
<script>
    var contextPath = "${pageContext.servletContext.contextPath}";
    var addToCartURL = contextPath + '/detail/addToCart';
</script>
<body>
    <jsp:include page="../user/header.jsp"></jsp:include>

    <div class="content__detail-shoes" data-list-size="${listSizeStr}">
        <div class="grid wide">
            <div class="row">
                <p class="content__detail-shoes-title">${productInfo.name}</p>
            </div>
            <div class="row">
                <div class="col l-4 m-12 C-12">
                    <div class="product-img">
                        <img src="${pageContext.servletContext.contextPath}/assets/user/${productInfo.thumbnail}" alt="">
                    </div>
                </div>
                <div class="col l-8 m-12 C-12">
                    <div class="product-info">
                        <form action="addToCart" id="addToCartForm" method="post">
                        	<input type="text" name="product_id" value="${productInfo.id}" style="display: none;">
                            <div class="product-info-price">
                                <p>${ConvertData.convertToStr(ConvertData.discountCal(productInfo.price, productInfo.discount))} VNĐ 
                                	<c:if test="${productInfo.discount > 0}">
                                		<span class="product-info-discount">${ConvertData.convertToStr(productInfo.price)} VND</span>
                                		<span class="product-info-percent">Giảm ${productInfo.discount}%</span>
                                	</c:if>
                                </p>
                                <p class="product-info-promotion">
                                    <i class="fa-sharp fa-solid fa-truck-fast"></i>Giao hàng siêu tốc, miễn phí đổi trả 7 ngày</p>
                                <p class="product-info-promotion">
                                    <i class="fa-solid fa-credit-card"></i>Giảm giá 5% khi thanh toán qua ngân hàng 
                                    <img src="${pageContext.servletContext.contextPath}/assets/user/images/logo/tpbank.jpg" alt="">
                                </p>
                            </div>
                            <div class="product-info-size">
                                <p>Kích thước: </p>
                                <div><input type="radio" name="size_id" value="" value-size="36">36</div>
	                            <div><input type="radio" name="size_id" value="" value-size="37">37</div>
	                            <div><input type="radio" name="size_id" value="" value-size="38">38</div>
	                            <div><input type="radio" name="size_id" value="" value-size="39">39</div>
	                            <div><input type="radio" name="size_id" value="" value-size="40">40</div>
	                            <div><input type="radio" name="size_id" value="" value-size="41">41</div>
	                            <div><input type="radio" name="size_id" value="" value-size="42">42</div>
                            </div>
                            <div class="product-info-amount">
                                <p>Số lượng: </p>
                                <span class="dec">-</span>
                                <input class="amount-product" name="amount-product" type="text" value="0">
                                <span class="inc">+</span>
                            </div>
                            <div class="product-info-sold">
                                <p>Đã bán: <span id="productSold"></span></p>
                            </div>
                            <div class="product-info-remain">
                                <p>Tình trạng: <span id="remainProduct"></span></p>
                            </div>
                            <c:if test="${ not empty sessionScope.user_id}">
                            <div class="product-info-action">
                                <a href="${pageContext.servletContext.contextPath}/payone/${productInfo.id}" id="buyNowLink">Mua ngay</a>
                                <button type="submit"><i class="fa-solid fa-cart-shopping"></i>
                                    <p>Thêm vào giỏ hàng</p>
                                </button>
                            </div>
                            </c:if>
                        </form>   
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col l-5 m-12 c-12">
                    <div class="product-info-detail1">
                        <p class="product-info-detail-des"><i class="fa-solid fa-store"></i>Hàng chính hãng, chất lượng cao</p>
                        <p class="product-info-detail-des"><i class="fa-solid fa-truck-fast"></i>Miễn phí giao hàng cho đơn hàng > 500.000 VND</p>
                        <p class="product-info-detail-des"><i class="fa-solid fa-rotate-left"></i>Chính sách đổi trả 30 ngày, thủ tục đơn giản</p>
                        <p class="product-info-detail-des"><i class="fa-solid fa-circle-check"></i>Bảo hành sản phẩm lên đến 12 tháng</p>
                    </div>
                </div>
                <div class="col l-7 m-12 c-12">
                    <img class="imgBanner" src="${pageContext.servletContext.contextPath}/assets/user/images/logo/black-friday.jpg" alt="">
                </div>
            </div>
            <div class="row">
                <div class="col l-7 m-12 c-12">
                    <div class="product-info-detail">
                        <p class="product-info-detail-title">Thông tin chi tiết</p>
                        <p class="product-info-detail-des">Air Jordan 1 KO Orange được xây dựng trong một kết
                            cấu bằng vải với Swooshes bằng da và cổ chân có đế màu trắng với lớp phủ màu Cam
                            Rush. Đế giữa của Cánh buồm trên đỉnh đế ngoài bằng cao su màu Cam hoàn thiện thiết
                            kế.</p>
                    </div>
                </div>
                <div class="col l-5 m-12 c-12">

                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../user/footer.jsp"></jsp:include>
    <script src="${pageContext.servletContext.contextPath}/assets/user/js/ajax-detail-product.js"></script>
</body>

</html>