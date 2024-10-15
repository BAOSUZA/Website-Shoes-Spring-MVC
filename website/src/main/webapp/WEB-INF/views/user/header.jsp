<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.nqb.convert.ConvertData" %>

<div>
	<div id="header">
		<div class="header__top">
			<div class="grid wide">
				<div class="row">
					<div class="col l-3 m-12 c-12">
						<div class="header__logo">
							<img class="header__logo-img"
								src="${pageContext.servletContext.contextPath}/assets/user/images/logo/logo.png"
								alt=""> <img class="header__logo-title"
								src="${pageContext.servletContext.contextPath}/assets/user/images/logo/name.png"
								alt="">
						</div>
					</div>
					<div class="col m-2 c-3 header__menu">
						<label for="nav-mobile-input" class="header__nav-bars">
							<p>
								<i class="fa-solid fa-bars"></i><br>TRANG CHỦ
							</p>
						</label> <input type="checkbox" hidden name="" class="nav__input"
							id="nav-mobile-input"> <label for="nav-mobile-input"
							class="header__overlay-nav"></label>
						<div class="header__mobile-nav">
							<label for="nav-mobile-input" class="nav__mobile-close">
								<i class="fa-solid fa-xmark"></i>
							</label>
							<ul class="nav__mobile-list">
								<li><i class="fa-solid fa-house"></i> <a href=""
									class="nav__mobile-link">TRANG CHỦ</a></li>
								<li><i class="fa-sharp fa-solid fa-person"></i> <a href=""
									class="nav__mobile-link">GIỚI THIỆU</a></li>
								<li><i class="fa-sharp fa-solid fa-person"></i> <a href=""
									class="nav__mobile-link">GIÀY NAM</a></li>
								<li><i class="fa-solid fa-person-dress"></i> <a href=""
									class="nav__mobile-link">GIÀY NỮ</a></li>
								<li><i class="fa-solid fa-child"></i> <a href=""
									class="nav__mobile-link">GIÀY TRẺ EM</a></li>
								<li><i class="fa-sharp fa-solid fa-person"></i> <a href=""
									class="nav__mobile-link">SẢN PHẨM KHÁC</a></li>
								<li><i class="fa-sharp fa-solid fa-person"></i> <a href=""
									class="nav__mobile-link">TIN TỨC</a></li>
								<li><i class="fa-solid fa-id-card"></i> <a href=""
									class="nav__mobile-link">LIÊN HỆ VỚI CHÚNG TÔI</a></li>
							</ul>
						</div>
					</div>
					<div class="col l-7 m-7 c-4">
						<form action="search" class="header__search" method="post">
							<input type="text" name="content"
								placeholder="Tìm sản phẩm mong muốn...."> <input
								type="submit" value="Tìm kiếm">
						</form>
					</div>
					<div class="col l-2 m-3 c-4">
						<div class="header__user-and__cart">
							<label for="cart-mobile-input">
								<p>
									<i class="fas fa-shopping-cart"></i><br>Giỏ hàng
								</p>
							</label> <input type="checkbox" hidden name="" class="cart__input"
								id="cart-mobile-input"> <label for="cart-mobile-input"
								class="header__overlay-cart"></label>
							<div class="header__cart">
								<div class="header__cart-product">
									<div class="cart-product-list">
										<c:set var="totalAmount" value="0" />
										<c:set var="totalAmountDiscount" value="0" />
										<c:set var="quantityProduct" value="0" />
										<c:forEach items="${sessionScope.myCartList}" var="item">
											<div class="cart-product-item">
												<img
													src="${pageContext.servletContext.contextPath}/assets/user/${item.product.thumbnail}"
													alt="">
												<div class="cart-product-item-info">
													<a href="">${item.product.name}</a>
													<p>Kích thước: ${item.size.type}</p>
													<p>
														Sl: ${item.quantity} x <b>${ConvertData.convertToStr(item.price)}đ</b>
													</p>
												</div>
											</div>
											<c:set var="totalAmount"
												value="${totalAmount + item.price * item.quantity}" />
											<c:set var="totalAmountDiscount"
												value="${totalAmountDiscount + item.quantity * ConvertData.discountCal(item.price, item.product.discount)}" />
											<c:set var="quantityProduct" value="${quantityProduct + 1}" />
										</c:forEach>

									</div>
								</div>
								<hr>
								<div class="header__cart-payment">
									<p>Có ${quantityProduct} sản phẩm</p>
									<p>Tạm tính: ${ConvertData.convertToStr(totalAmount)}đ</p>
									<p>Tổng: ${ConvertData.convertToStr(totalAmountDiscount)}đ</p>
									<div class="header__cart-payment-func">
										<a href="${pageContext.request.contextPath}/cart">Xem giỏ hàng</a> <a href="${pageContext.request.contextPath}/payment">Thanh toán</a>
									</div>
								</div>
							</div>
							<label for="user-mobile-input">
								<p>
									<i class="fa-solid fa-user"></i><br>
									<c:choose>
                                        <c:when test="${not empty sessionScope.user_id}">
                                            ${sessionScope.fullname}
                                        </c:when>
                                        <c:otherwise>
                                            Đăng nhập / Đăng ký
                                        </c:otherwise>
                                    </c:choose>
								</p>
							</label> <input type="checkbox" hidden name="" class="user__input"
								id="user-mobile-input"> <label for="user-mobile-input"
								class="header__overlay-user"></label>
							<div class="header__user">
								<label for="user-mobile-input" class="user__mobile-close"><i
									class="fa-solid fa-xmark"></i></label>
								<div class="header__user-func">

									<c:if test="${empty sessionScope.user_id}">
									    <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
									    <a href="${pageContext.request.contextPath}/register">Đăng ký</a>
									</c:if>
									
									<c:if test="${not empty sessionScope.user_id}">
									    <c:if test="${sessionScope.role_id == 2}">
									        <a href="${pageContext.request.contextPath}/admin">Quyền quản lý admin</a>
									    </c:if>
									</c:if>

									<c:if test="${not empty sessionScope.user_id}">
									    <a href="${pageContext.request.contextPath}/user-information">Thông tin tài khoản</a>
									    <a href="${pageContext.request.contextPath}/favorite-product">Sản phẩm yêu thích</a>
									    <a href="${pageContext.request.contextPath}/order-history">Lịch sử đặt hàng</a>
									    <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
									</c:if>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="header__nav">
			<div class="header__nav--list">
				<div class="header__nav--item">
					<a href="${pageContext.request.contextPath}/home"
						class="header__nav--link">TRANG CHỦ</a>
				</div>
				<div class="header__nav--item">
					<a href="${pageContext.request.contextPath}/introduce"
						class="header__nav--link ">GIỚI THIỆU</a>
				</div>
				<div class="header__nav--item">
					<a href="${pageContext.request.contextPath}/product/nam"
						class="header__nav--link">GIÀY NAM</a>
				</div>
				<div class="header__nav--item">
					<a href="${pageContext.request.contextPath}/product/nu"
						class="header__nav--link">GIÀY NỮ</a>
				</div>
				<div class="header__nav--item">
					<a href="${pageContext.request.contextPath}/product/tre-em"
						class="header__nav--link">GIÀY TRẺ EM</a>
				</div>
				<div class="header__nav--item">
					<a href="${pageContext.request.contextPath}/product/khac"
						class="header__nav--link">SẢN PHẨM KHÁC</a>
				</div>
				<div class="header__nav--item">
					<a href="${pageContext.request.contextPath}/contact"
						class="header__nav--link">LIÊN HỆ VỚI CHÚNG TÔI</a>
				</div>
			</div>
		</div>
	</div>
</div>
