<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<link rel="stylesheet" href="<c:url value="/assets/user/css/contact.css" />">
	<link rel="stylesheet" href="<c:url value="/assets/user/css/responsive.css" />">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	<title>Contact</title>
</head>
<body>
	<jsp:include page="../user/header.jsp"></jsp:include>
	
	<div class="contact item">
		<div class="contact__title">
			<h2>LIÊN HỆ VỚI CHÚNG TÔI</h2>
		</div>
		<div class="contact__content">
			<div class="grid wide">
				<div class="row">
					<div class="col l-6 m-12 c-12">
						<div class="contact__content-contact">
							<p><i class="fa-solid fa-location-dot"></i>Địa chỉ</p>
							<span>470 đường Trần Đại Nghĩa, phường Hòa Quý, quận Ngũ Hành Sơn, tỉnh Đà Nẵng</span>
							<p><i class="fa-solid fa-users"></i>Mạng xã hội</p>
							<span class="contact__content-contact-social-netwwork">
								<img src="${pageContext.servletContext.contextPath}/assets/user/images/contact/fb.png" alt="">
								<img src="${pageContext.servletContext.contextPath}/assets/user/images/contact/ins.png" alt="">
								<img src="${pageContext.servletContext.contextPath}/assets/user/images/contact/tw.png" alt="">
							</span>
	
							<p><i class="fa-solid fa-envelope"></i>Địa chỉ email</p>
							<span>baonq.21it@gmail.com</span>
						</div>
					</div>
					<div class="col l-6 m-12 c-12">
						<div class="contact__content-feedback">
							<h1 class="">Gửi phản hồi tại đây</h1>
							<input class="" type="text" value="" placeholder="Họ và tên">
							<input class="" type="text" value="" placeholder="Địa chỉ email">
							<input class="" type="text" value="" placeholder="Số điện thoại">
							<input class="" type="text" value="" placeholder="Lời nhắn">
							<button class="">Gửi phản hồi</button>
						</div>
					</div>
				</div>
				<div class="row contact__content-callus">
					<div class="col l-12 m-12 c-12 contact__content-callus-title">
						<h4><i class="fa-solid fa-phone"></i>Gọi cho chúng tôi</h4>
					</div>
					<hr class="col l-12 m-12 c-12">
					<div class="col l-6 m-12 c-12 contact__content-callus-content-left">
						<h3>Khách hàng cá nhân</h3>
						<p>(+84) 35 8989 354 (Huy) / (+84) 85 9021 385 (Bảo)</p>
						<h3>Khách hàng ưu tiên</h3>
						<p> 1900 6999 (Dịch vụ 24/7) / (+84) 35 8989 354 nếu Quý khách ở nước ngoài</p>
					</div>
					<div class="col l-6 m-12 c-12 contact__content-callus-content-right">
						<h3>Đại lý bán hàng</h3>
						<p> (+84) 35 8989 354 / (+84) 85 9021 385 (8:30 – 17:30)</p>
						<h3>Khách hàng Đại lý ủy quyền</h3>
						<p>(+84) 85 9021 385 | (+84) 70 8251 045 (8:30 – 17:30)</p>
					</div>
				</div>
				<div class="row contact__content-together">
					<div class="col l-6">
						<div class="contact__content-together-item">
							<h3>Các đối tác cùng tập đoàn</h3>
							<div class="delivery">
								<img src="${pageContext.servletContext.contextPath}/assets/user/images/contact/delivery.png" alt="">
								<img src="${pageContext.servletContext.contextPath}/assets/user/images/contact/delivery1.png" alt="">
								<img src="${pageContext.servletContext.contextPath}/assets/user/images/contact/delivery2.png" alt="">
								<img src="${pageContext.servletContext.contextPath}/assets/user/images/contact/delivery3.png" alt="">
								<img src="${pageContext.servletContext.contextPath}/assets/user/images/contact/delivery4.png" alt="">
								<img src="${pageContext.servletContext.contextPath}/assets/user/images/contact/delivery5.jpg" alt="">
								<img src="${pageContext.servletContext.contextPath}/assets/user/images/contact/delivery6.png" alt="">
								<img src="${pageContext.servletContext.contextPath}/assets/user/images/contact/delivery7.png" alt="">
							</div>
						</div>
					</div>
					<div class="col l-6">
						<div class="contact__content-together-item">
							<h3>Chứng nhận tín nhiệm Website</h3>
							<div class="delivery">
								<img src="${pageContext.servletContext.contextPath}/assets/user/images/contact/sign.jpg" alt="">
								<img src="${pageContext.servletContext.contextPath}/assets/user/images/contact/sign1.png" alt="">
							</div>
							<h3>Các đơn vị chấp nhận thanh toán</h3>
							<div class="delivery">
								<img src="${pageContext.servletContext.contextPath}/assets/user/images/contact/thanhtoan.png" alt="">
								<img src="${pageContext.servletContext.contextPath}/assets/user/images/contact/thanhtoan1.png" alt="">
								<img src="${pageContext.servletContext.contextPath}/assets/user/images/contact/thanhtoan3.png" alt="">
								<img src="${pageContext.servletContext.contextPath}/assets/user/images/contact/thanhtoan4.png" alt="">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../user/footer.jsp"></jsp:include>
	
	<script src="${pageContext.servletContext.contextPath}/assets/user/js/main.js"></script>
</body>
</html>