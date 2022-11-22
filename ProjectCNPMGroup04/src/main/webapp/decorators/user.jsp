<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="dec"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Small Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="/common/web/header-user.jsp"%>

	<!-- body -->
	<dec:body />
	<!-- body -->

	<!--=== Footer v4 ===-->
	<jsp:include page="/common/web/footer.jsp"></jsp:include>
	<!--=== End Footer v4 ===-->


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>
</body>
</html>