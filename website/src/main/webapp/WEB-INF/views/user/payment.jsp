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
<title>Document</title>
</head>

<body>
	<jsp:include page="../user/header.jsp"></jsp:include>
	<c:set var="total" value="0" />
	<c:set var="totalDiscount" value="0" />
	
	<div class="payment">
		<form action="paymentbill" method="POST">
			<div class="grid wide">
				<div class="row">
					<div class="col l-7">
						<div class="billing-details">
							<div class="billing-details-title">
								<h3 class="title">Địa chỉ thanh toán</h3>
							</div>
							<input class="input-ThanhToan" type="text" id="name" name="name"
								placeholder="Họ tên" value="" required/> 
							<input class="input-ThanhToan" type="text" id="address" name="address"
								placeholder="Địa chỉ" value="" required/> 
							<input class="input-ThanhToan" type="number" id="phone" name="phone"
								placeholder="Số điện thoại" value="" required/> 
							<input class="input-ThanhToan" type="email" id="email" name="email"
								placeholder="Email" value="" required/>
						</div>
					</div>
					<div class="col l-5 order-details">
						<div class="order-details-title">
							<h3 class="title">Đơn hàng</h3>
						</div>

						<div class="order-summary">
							<div class="order-col">
								<div>
									<strong>Sản phẩm</strong>
								</div>
								<div>
									<strong>Loại x SL x Tổng</strong>
								</div>
							</div>

							<div class="order-products">

								<c:if
									test="${not empty allDataCart && empty myBill && empty infoDetailToPay}">
									<c:set var="orderdetail_id" value="" />
									<c:forEach items="${allDataCart}" var="item">
										<div class="order-col">
											<div>
												<a href="">${item.product.name}</a>
											</div>
											<div>${item.size.type}x ${item.quantity} x
												${ConvertData.convertToStr(item.price)}đ</div>
										</div>
										<c:set var="total"
											value="${total + item.price * item.quantity}" />
										<c:set var="totalDiscount"
											value="${totalDiscount + item.quantity * ConvertData.discountCal(item.price, item.product.discount)}" />
										<c:set var="orderdetail_id" value="${orderdetail_id}${item.id} " />
									</c:forEach>
									<input type="text" name="orderdetail_id" id="" value="${orderdetail_id}" style="display: none;">
								</c:if>


								<c:if test="${not empty myBill}">
									<c:set var="orderdetail_id" value="" />
									<c:forEach items="${myBill}" var="item">
										<div class="order-col">
											<div>
												<a href="">${item.product.name}</a>
											</div>
											<div>${item.size.type}x ${item.quantity} x
												${ConvertData.convertToStr(item.price)}đ</div>
										</div>
										<c:set var="total"
											value="${total + item.price * item.quantity}" />
										<c:set var="totalDiscount"
											value="${totalDiscount + item.quantity * ConvertData.discountCal(item.price, item.product.discount)}" />
										<c:set var="orderdetail_id" value="${orderdetail_id}${item.id} " />
									</c:forEach>
									<input type="text" name="orderdetail_id" id="" value="${orderdetail_id}" style="display: none;">
								</c:if>

								<c:if test="${not empty infoDetailToPay}">
									<div class="order-col">
										<div>
											<a href="">${infoDetailToPay.product.name}</a>
										</div>
										<div>${infoDetailToPay.size.type}x
											${infoDetailToPay.quantity} x
											${ConvertData.convertToStr(infoDetailToPay.price)}đ</div>
									</div>
									<c:set var="total"
										value="${total + infoDetailToPay.price * infoDetailToPay.quantity}" />
									<c:set var="totalDiscount"
										value="${totalDiscount + infoDetailToPay.quantity * ConvertData.discountCal(infoDetailToPay.price, infoDetailToPay.product.discount)}" />
									<input type="text" name="orderdetail_id" id="" value="${infoDetailToPay.id}" style="display: none;">
								</c:if>

							</div>

							<div class="order-col">
								<div>Phí vận chuyển</div>
								<div>
									<strong>Miễn phí</strong>
								</div>
							</div>
							<div class="order-col">
								<div>Giá gốc</div>
								<div>
									<del>${ConvertData.convertToStr(total)}</del>
								</div>
							</div>
							<div class="order-col">
								<div>
									<strong>Thành tiền</strong>
								</div>
								<div>
									<strong class="order-total">
										${ConvertData.convertToStr(totalDiscount)}đ </strong>
								</div>
							</div>
						</div>

						<div class="payment-method">
							<div class="input-radio">
								<input type="radio" name="payment" id="payment-1" checked>
								<label for="payment-1"> <span></span> Thanh toán khi
									nhận hàng
								</label>
							</div>
							<div class="input-radio">
								<input type="radio" name="payment" id="payment-2"> <label
									for="payment-2"> <span></span> Thẻ tín dụng
								</label>

							</div>
							<div class="input-radio">
								<input type="radio" name="payment" id="payment-3"> <label
									for="payment-3"> <span></span> Ví MOMO
								</label>
							</div>
						</div>

						<button type="submit" class="checkout-submit" name="total"
							value="${totalDiscount}">Thanh toán</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<jsp:include page="../user/footer.jsp"></jsp:include>

</body>

</html>