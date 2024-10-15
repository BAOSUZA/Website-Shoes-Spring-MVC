<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.nqb.convert.ConvertData" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>ADMIN</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="img/favicon.ico" rel="icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="<c:url value="/assets/admin/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/assets/admin/css/style.css" />" rel="stylesheet">
    <link href="<c:url value="/assets/user/css/login-register.css"/>" rel="stylesheet">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
</head>

<body>

	<jsp:include page="../admin/header.jsp"></jsp:include>
	
	<div class="form-login">
    <h3>THÊM SẢN PHẨM</h3>
    <form class="form-login__container" action="${pageContext.request.contextPath}/management/add-product"  method="POST">
	    <select name="category_id" style="width: 100%; height: 35px; border-radius: 3px; margin-bottom: 20px; padding: 0px 7px;">
	        <c:forEach items="${categoryList}" var="item">
	            <option value="${item.id}">${item.name}</option>
	        </c:forEach>
	    </select>
	    <input type="text" name="thumbnail" placeholder="Link ảnh sản phẩm" required>
	    <input type="text" name="name" placeholder="Tên sản phẩm" required>
	    <input type="text" name="price" placeholder="Giá" required>
	    <input type="text" name="discount" placeholder="Giảm giá sản phẩm (Nếu có)">
	    <input type="text" name="description" placeholder="Mô tả sản phẩm" required>
	    <input type="text" name="quantity" placeholder="Số lượng trong kho của mỗi loại" required>
	    <input type="submit" value="THÊM">
	</form>
</div>

</body>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.servletContext.contextPath}/assets/admin/js/main.js"></script>
</html>