<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有产品</title>
</head>
<body>
	<table>
		<tr>
			<th>id</th>
			<th>名称</th>
		</tr>
		<c:forEach var="product" items="${products}">
			<tr>
				<td>${product.id }</td>
				<td>${product.name}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>