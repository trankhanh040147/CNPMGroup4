<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul class="list-group margin-bottom-25 sidebar-menu">
		<c:forEach items="${categoryList}" var="cateList">
			<li class="list-group-item clearfix">
			<a href="<c:url value="/product/list?categoryid=${cateList.id}"/>">
					<%-- <img
					src="<c:url value="/image?fname=category/${cateList.icon}"/>"
					class="img-circle" width="22px"> --%>
					<c:url value="/image?fname=${cateList.icon}" var="imgUrl"></c:url>
					<td><img height="150" width="200" src="${imgUrl}" /></td>
					 ${cateList.name}
			</a></li>
		</c:forEach>
	</ul>
	Hiển thị tên sản phẩm trong đối tượng Product thông qua biến product
	được truyền từ Controller
	<h1>${product.productname}</h1>
</body>
</html>