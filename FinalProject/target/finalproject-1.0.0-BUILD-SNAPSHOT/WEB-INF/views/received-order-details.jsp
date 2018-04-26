<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<div class="page-header">
	    <h1>Need something to eat?</h1>
	    <br>
	    <ul class="nav nav-pills">
		  <li><a href="${contextPath}/restaurant/menu.htm">Menu</a></li>
		  <li><a href="${contextPath}/restaurant/res-info.htm">Restaurant Information</a></li>
		  <li class="active"><a href="${contextPath}/restaurant/received-orders.htm">Received Orders</a></li>
		  <li><a href="${contextPath}/">Logout</a></li>
		</ul>
	</div>
	
	
	<c:set var="order" value="${sessionScope.rescurrentOrder}" />
	<h2>Order ID: ${order.orderId}</h2>
	<c:forEach var="item" items="${sessionScope.resorderItemList}">
		<div class="list-group">
			<div class="list-group-item">
				<h4 class="list-group-item-heading">
					Name : ${item.menuName}&nbsp;&nbsp;&nbsp;
					Price : ${item.menuPrice}&nbsp;&nbsp;&nbsp;
					Quantity: ${item.quantity}					
				</h4>
			</div>
		</div>
    </c:forEach>
    <div>
		Total Quantities: ${order.totalQuantity}&nbsp;&nbsp;&nbsp;
		Total Price: ${order.totalPrice}&nbsp;&nbsp;&nbsp;
		Order Status: ${order.orderStatus}
		<br/>
		<br/>
		<c:set var="status" value="Customer Received Food" />
		<c:set var="status1" value="Food under delivering" />
		<c:choose>
			<c:when test="${order.orderStatus eq status}">
				<h2>Order has been completed!</h2>
			</c:when>
			<c:when test="${order.orderStatus eq status1}">
				<h2>Food under delivering!</h2>
			</c:when>
			<c:otherwise>
				<a href="${contextPath}/restaurant/updateOrder.htm?orderId=${order.orderId}">Food under delivering</a>
			</c:otherwise>
		</c:choose>
    </div>

</body>
</html>