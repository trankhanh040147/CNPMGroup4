<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${productListNew}" var="proList">
		<%-- 		<img class="img-responsive" alt="${proList.productname}" src="<c:url value="/image?fname=products/${proList.images}"/>">
 --%>
		<c:url value="/image?fname=${proList.images}" var="imgUrl"></c:url>
		<td><img class="img-responsive" alt="${proList.productname}"
			height="150" width="200" src="${imgUrl}" /></td>
		<a
			href="<c:url value="/product/detail?productid=${proList.productid }"/>">
			${proList.productname}</a>
	</c:forEach>
	<div class="col-md-8 col-sm-8">
		<ul class="pagination pull-right">
			<c:if test="${tag>1}">
				<li><a
					href="${pageContext.request.contextPath}/product/list?index=${tag-1}&categoryid=0&sellerid=0">
						&laquo; </a></li>
			</c:if>
			<c:forEach begin="1" end="${endP}" var="i">
				<%-- 				<li class='${tag==i?"active":"" }'><a --%>
				<li class="${tag==i?"active":"" }"><a
					href="${pageContext.request.contextPath}/product/list?index=${i}">
						${i}</a></li>
			</c:forEach>
			<c:if test="${tag<endP}">
				<li><a
					href="${pageContext.request.contextPath}/product/list?index=${tag+1}">
						&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>