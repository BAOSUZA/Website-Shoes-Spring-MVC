<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/assets/user/css/grid.css" />">
    <link rel="stylesheet" href="<c:url value="/assets/user/css/header-footer.css" />">
    <link rel="stylesheet" href="<c:url value="/assets/user/css/login-register.css" />">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Document</title>
</head>
<body>
	<jsp:include page="../user/header.jsp"></jsp:include>
	<div class="form-register">
	    <h3>Đăng ký</h3>
	    <form class="form-register__container" action="insertAccount" method="POST">
	        <input type="text" id="fullname" name="fullname" placeholder="Họ và Tên" value="${(fullname != null) ? fullname : ""}" required>
	        <span class="notify-error"></span>
	        <input type="text" id="email" name="email" placeholder="Email" value="${(email != null) ? email : ""}" required>
	        <input type="text" id="address" name="address" placeholder="Địa chỉ" value="${(address != null) ? address : ""}" required>
	        <input type="text" id="phonenumber" name="phonenumber" placeholder="Số điện thoại" value="${(phone_number != null) ? phone_number : ""}" required>
	        <input type="password" id="password" name="password" placeholder="Mật khẩu" value="${(password != null) ? password : ""}" required>
	        <span class="notify-error">${(error_repassword != null) ? error_repassword : ""}</span>
	        <input type="password" id="repassword" name="repassword" placeholder="Nhập lại mật khẩu" required>
	
	        <div class="checkbox">
	            <input type="checkbox" id="passwordLogin" name="checkbox" required>Tôi xác nhận đồng ý tất
	            cả điều khoản và Nội dung pháp lý của chúng tôi</input>
	        </div> 
	        <input type="submit" value="Đăng ký">
	        <a href="${pageContext.request.contextPath}/login">Đã có tài khoản, đăng nhập ngay!</a>
	    </form>
	</div>
	<jsp:include page="../user/footer.jsp"></jsp:include>
</body>
</html>