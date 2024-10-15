<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.nqb.convert.ConvertData"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="<c:url value="/assets/user/css/grid.css" />">
<link rel="stylesheet"
	href="<c:url value="/assets/user/css/slick.css" />">
<link rel="stylesheet"
	href="<c:url value="/assets/user/css/slick-theme.css" />">
<link rel="stylesheet"
	href="<c:url value="/assets/user/css/header-footer.css" />">
<link rel="stylesheet"
	href="<c:url value="/assets/user/css/home.css" />">
<link rel="stylesheet"
	href="<c:url value="/assets/user/css/responsive.css" />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Document</title>
</head>
<script>
	var contextPath = "${pageContext.servletContext.contextPath}";
	var createBillURL = contextPath + '/cart/createBill';
</script>

<body>
	<jsp:include page="../user/header.jsp"></jsp:include>
	<div class="cart">
		<div class="grid wide">
			<div class="row">
				<div class="col l-8">
					<div class="cart-detail">
						<h3 class="cart-detail-title">Giỏ hàng</h3>
					</div>
					<div class="cart--content">

						<c:forEach items="${sessionScope.myCartList}" var="item">
							<div class="cart__item">
								<div class="cart__item--checkbox">
									<input class="itemCheckbox" type="checkbox" name="" id="">
									<input class="itemValue" type="text" name="" id=""
										value="${item.id}">
								</div>
								<div class="cart__item--image">
									<img
										src="${pageContext.servletContext.contextPath}/assets/user/${item.product.thumbnail}"
										alt="">
								</div>
								<div class="cart__item--detail">
									<p class="title">${item.product.name}</p>
									<p class="size">Kích cỡ: ${item.size.type}</p>
								</div>
								<div class="cart__item--price">
									<p>${ConvertData.convertToStr(item.price)}đ</p>
								</div>
								<div class="cart__item--amount">
									<button>-</button>
									<input class="quantity" type="text" name="" id="" value="${item.quantity}">
									<button>+</button>
								</div>
								<div class="cart__item--remove">
									<a href=""><i class="fa-solid fa-trash"></i></a>
								</div>
							</div>
						</c:forEach>
					</div>

					<div class="cart--Choose">
						<input class="cart--Choose__all" type="checkbox" name="selectAll"
							id="selectAll"> 
						<label for="selectAll">Chọn tất cả</label> 
						<button class="cart--Choose__create">Tạo hóa đơn</button>
					</div>

				</div>
				<div class="col l-4 order-details" style="margin-top: 80px">
					<form action="createBill" method="post">
						<div class="order-summary">
							<div class="order-col">
								<div>
									<strong>Tên sản phẩm</strong>
								</div>
								<div>Số lượng x Giá</div>
							</div>

							<div id="orderContainer"></div>

							<div class="order-col">
								<div>
									<strong>Phí vận chuyển</strong>
								</div>
								<div>Miễn phí</div>
							</div>
							<div class="order-col">
								<div>
									<strong>Tạm tính</strong>
								</div>
								<div id="order-total__temp">0đ</div>
							</div>
							<hr
								style="border: 0; border-top: 2px solid #bababa; margin: 20px 0;">
							<div class="order-col">
								<div>
									<strong>Tổng tiền</strong>
								</div>
								<div>
									<strong class="order-total" id="order-total">0đ</strong>
								</div>
							</div>
						</div>
						<input id="idList" type="text" name="idList" id="" value="" style="display: none;">
						<input class="create-bill" type="submit" value="Thanh toán">
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../user/footer.jsp"></jsp:include>
	<script
		src="${pageContext.servletContext.contextPath}/assets/user/js/cart.js"></script>
</body>

</html>