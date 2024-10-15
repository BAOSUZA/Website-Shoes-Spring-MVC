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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<script>
    var contextPath = "${pageContext.servletContext.contextPath}";
    var updateStatusURL = contextPath + '/management/order}';
</script>

<body>

	<jsp:include page="../admin/header.jsp"></jsp:include>
	
	<table class="table">
	    <thead>
	        <tr>
	            <th>STT</th>
	            <th>Tên Khách hàng</th>
	            <th>Email</th>
	            <th>Số điện thoại</th>
	            <th>Địa chỉ</th>
	            <th>Ngày đặt hàng</th>
	            <th>Trạng thái</th>
	            <th>Tổng tiền(VND)</th>
	            <th>Cập nhật đang vận chuyện</th>
	            <th>Cập nhật đã giao hàng</th>
	        </tr>
	    </thead>
	    <tbody>
	    <c:set var="index" value="1"/>
	    <c:forEach items="${orderList}" var="item">
	        <tr class="order-row" order-id="${item.id}">
                <td>${index}</td>
                <td>${item.reciever}</td>
                <td>${item.email}</td>
                <td>${item.phone}</td>
                <td>${item.address}</td>
                <td>${item.order_date}</td>
                <td class="status">${item.status}</td>
                <td>${ConvertData.convertToStr(item.total_money)}</td>
                <td><a class="update-transport" href="${pageContext.servletContext.contextPath}/management/order/transport/${item.id}">Cập nhật</a></td>
                <td><a class="update-delivered" href="${pageContext.servletContext.contextPath}/management/order/delivered/${item.id}">Cập nhật</a></td>
            </tr>
            <c:set var="index" value="${index + 1}"/>
  	    </c:forEach>
	    </tbody>
	</table>

</body>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.servletContext.contextPath}/assets/admin/js/ajax-order.js"></script>

</html>