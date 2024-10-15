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


<body>
	<jsp:include page="../user/header.jsp"></jsp:include>
	<div class="cart">
		<div class="grid wide">
			<div class="row">
				<div class="col l-8">
					<div class="cart-detail">
						<h3 class="cart-detail-title">Lịch sử đặt hàng</h3>
					</div>
					<div class="cart-content">
						<table>
							<thead class="history">
								<tr>
									<th>Đơn hàng</th>
									<th>Số điện thoại</th>
									<th>Ngày đặt</th>
									<th>Trạng thái</th>
									<th>Tổng tiền(VNĐ)</th>
									<th>Xem chi tiết</th>
								</tr>
								<tr>
									<td colspan="6"><hr></td>
								</tr>
							</thead>
							<tbody>
									<c:set var="index" value="1"/>
									<c:forEach items="${orderHistoryList}" var="item">
									<tr>
										<td>${index}</td>
										<td>${item.phone}</td>
										<td>${item.order_date}</td>
										<td>${item.status}</td>
										<td>${ConvertData.convertToStr(item.total_money)}</td>
										<td><a href="${pageContext.servletContext.contextPath}/order-history/${item.id}"><i class="fa-regular fa-eye"></i></a></td>
									</tr>
									<c:set var="index" value="${index + 1}"/>
									</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col l-4 order-details" style="margin-top: 80px">
					<div class="order-summary">
						<div class="order-col1">
							<div>
								<strong>Chi tiết đơn hàng</strong>
							</div>
						</div>
						
						<div class="order-col">
							<div>
								<strong>Sản phẩm</strong>
							</div>
							<div>
								<strong>Loại x SL x Tổng</strong>
							</div>
						</div>
						
						<c:forEach items="${detailList}" var="item">
	                        <div class="order-col">
	                            <div><a href="${pageContext.servletContext.contextPath}/detail/${item.product.id}">${item.product.name}</a></div>
	                            <div>${item.size.type} x ${item.quantity} x ${ConvertData.convertToStr(ConvertData.discountCal(item.product.price, item.product.discount))}đ</div>
	                        </div>
						</c:forEach>
                       
						<hr
							style="border: 0; border-top: 2px solid #bababa; margin: 20px 0;">
						<div class="order-col">
							<div>
								<strong>Tổng tiền </strong>
							</div>
							<div>
								<strong class="order-total" id="tongTien-GioHang"> ${ConvertData.convertToStr(detailList[0].order.total_money)}đ
								</strong>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../user/footer.jsp"></jsp:include>
	
</body>

</html>