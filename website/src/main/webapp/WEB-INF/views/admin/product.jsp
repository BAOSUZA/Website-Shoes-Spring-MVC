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
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
</head>

<body>

	<jsp:include page="../admin/header.jsp"></jsp:include>
	
	<table class="table">
    <thead>
        <tr>
            <th>STT</th>
            <th>Kiểu giày</th>
            <th>Tên giày</th>
            <th>Giá (VND)</th>
            <th>Giảm giá (%)</th>
            <th>Số lượng trong kho</th>
            <th>Số lượng đã bán</th>
            <th>Sửa</th>
            <th>Xóa</th>
        </tr>
    </thead>
    <tbody>
    
    <c:set var="index" value="1"/>
    <c:forEach items="${productList}" var="item">
       <tr>
       		<td>${index}</td>
            <td>${item[0].category.name}</td>
            <td>${item[0].name}</td>
            <td>${ConvertData.convertToStr(item[0].price)}</td>
            <td>${item[0].discount}</td>
            <td>${item[2]}</td>
            <td>${item[1]}</td>
            <td><a href=""><i class="fa-solid fa-user-pen"></i></a></td>
            <td><a href=""><i class="fa-sharp fa-solid fa-trash"></i></a></td>
        </tr>
        <c:set var="index" value="${index + 1}"/>
    </c:forEach>
    
    </tbody>
    
</table>

</body>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.servletContext.contextPath}/assets/admin/js/main.js"></script>
</html>