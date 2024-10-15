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
	<title>Document</title>
</head>

<body>

	<jsp:include page="../user/header.jsp"></jsp:include>

	<div class="Slide-products">
		<div class="slider center">
			<div><img src="${pageContext.servletContext.contextPath}/assets/user/images/slide/slide1.jpg"
					alt=""></div>
			<div><img src="${pageContext.servletContext.contextPath}/assets/user/images/slide/slide2.jpg"
					alt=""></div>
			<div><img src="${pageContext.servletContext.contextPath}/assets/user/images/slide/slide3.jpg"
					alt=""></div>
			<div><img src="${pageContext.servletContext.contextPath}/assets/user/images/slide/slide1.jpg"
					alt=""></div>
			<div><img src="${pageContext.servletContext.contextPath}/assets/user/images/slide/slide2.jpg"
					alt=""></div>
			<div><img src="${pageContext.servletContext.contextPath}/assets/user/images/slide/slide3.jpg"
					alt=""></div>
		</div>
	</div>

	<div class="Featured-products">
		<div class="grid wide">
			<div class="row item itemTab">
				<div class="col l-12 Featured-products__title showToRight showToRightTab">Sản phẩm nổi bật</div>
			</div>
			<div class="row Featured-products__list Featured-products__autoplay">
				<c:forEach items="${listFeatured}" var="item">
					<div class="Featured-products__item">
						<a class="Featured-products__item-content" href="${pageContext.servletContext.contextPath}/detail/${item.id}">
							<img src="${pageContext.servletContext.contextPath}/assets/user/${item.thumbnail}" alt="Hình ảnh không tồn tại">
							<div class="Featured-products__item-body">
								<p>${item.name}</p>
								<p>${ConvertData.convertToStr(item.price)}đ</p>
								<div class="Featured-products__item-body-star">
									<hr>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<hr>
								</div>
								<div class="Featured-products__item-body-icon">
									<a href=""><i class="fa-regular fa-heart"></i></a>
									<i class="fa-regular fa-eye"></i>
								</div>
								<div class="Featured-products__item-body-func">
									<a href="" class="Featured-products__item-body-func-add"><i
											class="fa-solid fa-cart-shopping"></i> Thêm vào giỏ hàng</a>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>

		</div>
	</div>

	<div class="Promotion-products">
		<div class="grid wide">
			<div class="row item itemTab">
				<div class="col l-12 Featured-products__title showToRight showToRightTab">Sản phẩm đang giảm giáy</div>
			</div>
			<div class="row item itemTab">
				<div class="Promotion-products__slide">
					<div class="Promotion-products__slide">
		                <img class="Promotion-products__slide-slide" src="${pageContext.servletContext.contextPath}/assets/user/images/slide/sale-produtcs.png" alt="">
		                <img class="Promotion-products__slide-logo showToTop showToRightTab" src="${pageContext.servletContext.contextPath}/assets/user/images/logo/logo.png" alt="">
		                <img class="Promotion-products__slide-name showToTop showToLeft	Tab" src="${pageContext.servletContext.contextPath}/assets/user/images/logo/name.png" alt="">
		                <p class="showToTop showToTopTab delay-06">Sản phẩm đang giảm giá</p>
		            </div>
				</div>
			</div>
			
			<c:set var="discountProducts" value="${discountProducts}" />
			<c:set var="lengthDiscountProducts" value="${fn:length(discountProducts)}" />
			<c:set var="startDiscounts" value="0" />
			<c:set var="endDiscounts" value="5" />
			<c:forEach var="i" begin="0" end="${totalPageDiscountProducts}">
				<div class="row item itemTab Promotion-products--item">
				<c:forEach var="j" begin="${startDiscounts}" end="${endDiscounts - 1}">
					<div class="col l-2-4 m-4 c-6">
						<div class="Promotion-products__item">
							<a href="${pageContext.servletContext.contextPath}/detail/${discountProducts[j].id}" class="Promotion-products__item-content">
								<img class="showToZoom showToZoomTab" src="${pageContext.servletContext.contextPath}/assets/user/${discountProducts[j].thumbnail}" alt="Hình ảnh không tồn tại">
								<div class="Promotion-products__item-sale showToRight showToRightTab">Giảm ${discountProducts[j].discount} %</div>
								<div class="Promotion-products__item-body">
									<p class="showToTop showToTopTab delay-02">${discountProducts[j].name}</p>
									<p class="showToTop showToTopTab delay-04">${ConvertData.convertToStr(ConvertData.discountCal(discountProducts[j].price, discountProducts[j].discount))}đ <br><del>${ConvertData.convertToStr(discountProducts[j].price)}đ</del></p>
									<div class="Promotion-products__item-body-star">
										<hr>
										<i class="fa-solid fa-star showToTop showToTopTab delay-06"></i>
										<i class="fa-solid fa-star showToTop showToTopTab delay-06"></i>
										<i class="fa-solid fa-star showToTop showToTopTab delay-06"></i>
										<i class="fa-solid fa-star showToTop showToTopTab delay-06"></i>
										<i class="fa-solid fa-star showToTop showToTopTab delay-06"></i>
										<hr>
									</div>
									<div class="Promotion-products__item-body-icon showToTop showToTopTab delay-08">
										<a href=""><i class="fa-regular fa-heart"></i></a>
										<i class="fa-regular fa-eye"></i>
									</div>
									<div class="Promotion-products__item-body-func">
										<a href="" class="Promotion-products__item-body-func-add"><i class="fa-solid fa-cart-shopping"></i> Thêm vào giỏ hàng</a>
									</div>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
				</div>
				<c:set var="startDiscounts" value="${startDiscounts + 5}" />
				<c:set var="endDiscounts" value="${endDiscounts + 5}" />
				<c:if test="${endDiscounts > lengthDiscountProducts}">
					<c:set var="endDiscounts" value="${lengthDiscountProducts}" />
				</c:if>
			</c:forEach>
			
			<div class="row">
				<div class="pagination">
					<ul>
						<li class="item-discount">&laquo;</li>
						<ul id="page-item-discount"></ul>
						<li class="item-discount">&raquo;</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<div class="All-products__shop">
		<div class="grid wide">
			<div class="row item">
				<div class="col l-12 m-12 c-12 All-products__shop-title showToRight">Tất cả sản phẩm</div>
			</div>
			
		<c:set var="allProducts" value="${allProducts}" />
        <c:set var="lengthAllProduct" value="${fn:length(allProducts)}" />
        <c:set var="startProducts" value="0" />
        <c:set var="endProducts" value="10" />
        <c:forEach var="i" begin="0" end="${totalPageAllProducts}">
            <div class="row All-products__shop--item">
                <c:forEach var="j" begin="${startProducts}" end="${endProducts - 1}">
                    <div class="col l-2-4 m-4 c-6">
                        <div class="All-products__item">
                            <a class="All-products__item-content" href="${pageContext.servletContext.contextPath}/detail/${allProducts[j].id}">
                                <img src="${pageContext.servletContext.contextPath}/assets/user/${allProducts[j].thumbnail}" alt="Hình ảnh không tồn tại">
                                <div class="All-products__item-body">
                                    <p>${allProducts[j].name}</p>
                                    <p>${ConvertData.convertToStr(allProducts[j].price)}đ</p>
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
                                        <a href=""><i class="fa-regular fa-heart"></i></a>
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
            <c:set var="startProducts" value="${startProducts + 10}" />
            <c:set var="endProducts" value="${endProducts + 10}" />
            <c:if test="${endProducts > lengthAllProduct}">
                <c:set var="endProducts" value="${lengthAllProduct}" />
            </c:if>
        </c:forEach>

			
			<div class="row">
				<div class="pagination">
					<ul>
						<li class="item-all">&laquo;</li>
						<ul id="page-item-all"></ul>
						<li class="item-all">&raquo;</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="feedback">
		<div class="grid wide">
			<div class="row item itemTab">
				<div class="col l-12 m-12 c-12 Featured-products__title showToRight showToRightTab">Cảm nhận
					khách hàng</div>
			</div>
			<div class="row autoplayFeedback item itemTab">
				<div class="col">
					<div class="feedback-item">
						<div class="img">
							<img class="showToZoom showToZoomTab delay-02"
								src="${pageContext.servletContext.contextPath}/assets/user/images/user/1.jpg"
								alt="">
							<h3 class="showToTop showToTopTab delay-04">Võ Trọng Đạt</h3>
						</div>
						<div class="stars showToLeft showToLeftTab delay-08">
							<p>Sản phẩm chất lượng, đúng cam kết, giao hàng nhanh, lắp ráp chuyên nghiệp, bảo
								hành và chính sách
								hậu
								mãi tốt, tin tưởng, sẽ ủng hộ tiếp tục.</p>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="far fa-star"></i>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="feedback-item">
						<div class="img">
							<img class="showToZoom"
								src="${pageContext.servletContext.contextPath}/assets/user/images/user/2.jpg"
								alt="">
							<h3 class="showToTop delay-02">Nguyễn Quang Bảo</h3>
						</div>
						<div class="stars showToLeft delay-06">
							<p>Sản phẩm chất lượng, đúng cam kết, giao hàng nhanh, lắp ráp chuyên nghiệp, bảo
								hành và chính sách
								hậu
								mãi tốt, tin tưởng, sẽ ủng hộ tiếp tục.</p>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="far fa-star"></i>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="feedback-item">
						<div class="img">
							<img class="showToZoom"
								src="${pageContext.servletContext.contextPath}/assets/user/images/user/3.jpg"
								alt="">
							<h3 class="showToTop delay-02">Cao Văn Tính</h3>
						</div>
						<div class="stars showToLeft delay-06">
							<p>Sản phẩm chất lượng, đúng cam kết, giao hàng nhanh, lắp ráp chuyên nghiệp, bảo
								hành và chính sách
								hậu
								mãi tốt, tin tưởng, sẽ ủng hộ tiếp tục.</p>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="far fa-star"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../user/footer.jsp"></jsp:include>

	<script src="${pageContext.servletContext.contextPath}/assets/user/js/jquery-1.10.2.js"></script>
	<script src="${pageContext.servletContext.contextPath}/assets/user/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/assets/user/js/slick.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/assets/user/js/slick.js"></script>
	<script src="${pageContext.servletContext.contextPath}/assets/user/js/main.js"></script>
</body>

</html>