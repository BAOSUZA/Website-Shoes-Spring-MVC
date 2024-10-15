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
	<div class="form-login">
	    <h3>Đăng nhập</h3>
	    <form class="form-login__container" action="loginAccount" method="POST">
	        <input type="text" name="email" placeholder="Email" value="${(email != null) ? email : ""}" required>
	        <span class="notify-error">${(error_password != null) ? error_password : ""}</span>
	        <input type="password" name="password" placeholder="Mật khẩu" required>
	        <input type="submit" value="Đăng nhập">
	        <a href="${pageContext.request.contextPath}/register">Nhấp vào đây để đăng ký tài khoản</a>
	    </form>
	</div>
	<jsp:include page="../user/footer.jsp"></jsp:include>
</body>
</html>