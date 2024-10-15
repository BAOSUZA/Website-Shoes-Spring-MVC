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
	<div class="All-products__shop">
		<div class="grid wide">
			<c:set var="allProducts" value="${allProducts}" />
			<c:set var="lengthAllProduct" value="${fn:length(allProducts)}" />
			<c:set var="startProducts" value="0" />
			<c:set var="endProducts" value="10" />
			<c:if test="${lengthAllProduct < 11}">
				<c:set var="endProducts" value="${lengthAllProduct}" />
			</c:if>
			<c:forEach var="i" begin="0" end="${totalPageProducts}">
			
				<div class="row All-products__shop--item">

					<c:forEach var="j" begin="${startProducts}"
						end="${endProducts - 1}">
						<div class="col l-2-4 m-4 c-6">
							<div class="All-products__item">
								<a class="All-products__item-content"
									href="${pageContext.servletContext.contextPath}/detail/${allProducts[j].id}">
									<img
									src="${pageContext.servletContext.contextPath}/assets/user/${allProducts[j].thumbnail}"
									alt="Hình ảnh không tồn tại">
									<div class="All-products__item-body">
										<p>${allProducts[j].name}</p>
										<p>${ConvertData.convertToStr(allProducts[j].price)}đ</p>
										<div class="All-products__item-body-star">
											<hr>
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
											<hr>
										</div>
										<div class="All-products__item-body-icon">
											<a href=""><i class="fa-regular fa-heart"></i></a> <i
												class="fa-regular fa-eye"></i>
										</div>
										<div class="All-products__item-body-func">
											<a href="" class="All-products__item-body-func-add"><i
												class="fa-solid fa-cart-shopping"></i> Thêm vào giỏ hàng</a>
										</div>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>

				</div>
				<c:set var="startProducts" value="${startProducts + 10}" />
				<c:set var="endProducts" value="${endProducts + 10}" />
				<c:if test="${endProducts > lengthAllProduct}">
					<c:set var="endProducts" value="${lengthAllProduct}" />
				</c:if>
			</c:forEach>
			
			<c:if test="${totalPageProducts > 1}">
			<div class="row">
				<div class="pagination">
					<ul>
						<li class="item-all">&laquo;</li>
						<ul id="page-item-all"></ul>
						<li class="item-all">&raquo;</li>
					</ul>
				</div>
			</div>
			</c:if>
			
		</div>
	</div>
	<jsp:include page="../user/footer.jsp"></jsp:include>
	<script
		src="${pageContext.servletContext.contextPath}/assets/user/js/main.js"></script>
</body>

</html>