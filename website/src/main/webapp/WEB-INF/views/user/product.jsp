<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.nqb.convert.ConvertData" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<c:url value="/assets/user/css/grid.css" />">
	<link rel="stylesheet" href="<c:url value="/assets/user/css/slick.css" />">
	<link rel="stylesheet" href="<c:url value="/assets/user/css/slick-theme.css" />">
	<link rel="stylesheet" href="<c:url value="/assets/user/css/header-footer.css" />">
	<link rel="stylesheet" href="<c:url value="/assets/user/css/home.css" />">
	<link rel="stylesheet" href="<c:url value="/assets/user/css/responsive.css" />">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	<title>Product</title>
</head>
<body>
	<jsp:include page="../user/header.jsp"></jsp:include>
	
	<div class="All-products">
		<div class="grid wide">
			<div class="row">
				<p class="All-products__title-sex">Sản Phẩm ${listProducts[0].category.name}</p>
			</div>
			<div class="row">
				<div class="col l-3 m-3">
					<div class="All-products__control">
						<p>Phân loại theo giá</p>
						<form id="form" method="post">
							<div class=""><input type="button" value="" name="filterPrice">Tất cả sản phẩm</div>
							<div class=""><input type="button" value="AND price > 1000000 " name="filterPrice">Lớn hơn 1.000.000đ</div>
							<div class=""><input type="button" value="AND price BETWEEN 700000 AND 1000000" name="filterPrice">700.000đ - 1.000.000đ</div>
							<div class=""><input type="button" value="AND price BETWEEN 500000 AND 699999" name="filterPrice">500.000đ - 700.000đ</div>
							<div class=""><input type="button" value="AND price < 500000 " name="filterPrice">Dưới 500.000đ</div>
						</form>
					</div>
				</div>

				<div class="col l-9 m-9">
					<c:set var="listProducts" value="${listProducts}"/>
					<c:set var="listSizeProducts" value="${fn:length(listProducts)}" />
					<c:set var="startProducts" value="0" />
					<c:set var="endProducts" value="8" />
					<c:forEach var="i" begin="0" end="${totalTypeProductPages}">
					<div class="row All-products--items">
						<c:forEach var="j" begin="${startProducts}" end="${endProducts - 1}">
							<div class="col l-3 m-6 c-6">
								<div class="All-products__item">
									<a class="All-products__item-content" href="">
										<img src="${pageContext.servletContext.contextPath}/assets/user/${listProducts[j].thumbnail}" alt="">
										<div class="All-products__item-body">
											<p>${listProducts[j].name}</p>
											<p>${ConvertData.convertToStr(listProducts[j].price)}đ</p>
											<div class="All-products__item-body-star">
												<hr>
												<i class="fa-solid fa-star"></i>
												<i class="fa-solid fa-star"></i>
												<i class="fa-solid fa-star"></i>
												<i class="fa-solid fa-star"></i>
												<i class="fa-solid fa-star"></i>
												<hr>
											</div>
											<div class="All-products__item-body-icon">
												<i class="fa-regular fa-heart"></i>
												<i class="fa-regular fa-eye"></i>
											</div>
											<div class="All-products__item-body-func">
											<a href="" class="All-products__item-body-func-add"><i class="fa-solid fa-cart-shopping"></i> Thêm vào giỏ hàng</a>
											</div>
										</div>
									</a>
								</div>
							</div>
							</c:forEach>
						</div>
						<c:set var="startProducts" value="${startProducts + 8}" />
						<c:set var="endProducts" value="${endProducts + 8}" />
						<c:if test="${endProducts > listSizeProducts}">
					        <c:set var="endProducts" value="${listSizeProducts}" />
					    </c:if>
					</c:forEach>
					
					<c:if test="${listSizeProducts > 0}">
					<div class="row">
						<div class="pagination">
							<ul>
								<li class="item-typeProduct">&laquo;</li>
								<ul id="page-item-typeProduct"></ul>
								<li class="item-typeProduct">&raquo;</li>
							</ul>
						</div>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../user/footer.jsp"></jsp:include>
	
	<script src="${pageContext.servletContext.contextPath}/assets/user/js/main.js"></script>
</body>
</html>