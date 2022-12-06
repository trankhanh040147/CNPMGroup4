<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<%@ taglib prefix="dec"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>

<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="${pageContext.request.contextPath}/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Paper Dashboard by Creative Tim</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<!-- my css file -->
<link href="${pageContext.request.contextPath}/assets/css/myCSS.css" rel="stylesheet"
	type="text/css">
<!-- my css file -->


<!-- Bootstrap core CSS     -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="${pageContext.request.contextPath}/assets/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="${pageContext.request.contextPath}/assets/css/paper-dashboard.css" rel="stylesheet" />

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/assets/js/demo.js"></script>


<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/assets/css/themify-icons.css" rel="stylesheet">

</head>

<body>
	
	<jsp:include page="/common/web/header-student.jsp"></jsp:include>
	
	<!--  Hiển thị alert nếu có -->
	<c:if test="${alert!=null}">
		<script type="text/javascript">
			window.onload = function() {
				demo.showNtf(${alertType}, "${alert}", "${alertIcon}");
			};
		</script>
	</c:if>
	<!--  Hiển thị alert nếu có -->
	
	<!-- body -->
	<dec:body />
	<!-- body -->

	<!--=== Footer v4 ===-->
	<jsp:include page="/common/web/footer.jsp"></jsp:include>
	<!--=== End Footer v4 ===-->


	<!--  JS-->
	<!--   Core JS Files   -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="${pageContext.request.contextPath}/assets/js/chartist.min.js"></script>

	<!--  Notifications Plugin    -->
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap-notify.js"></script>

	<!--  Google Maps Plugin    -->
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js"></script>

	<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="${pageContext.request.contextPath}/assets/js/paper-dashboard.js"></script>

	

	<!-- <script type="text/javascript">
		$(document)
				.ready(
						function() {

							demo.initChartist();

							$
									.notify(
											{
												icon : 'ti-user',
												message : "Welcome to <b>Student</b"

											}, {
												type: 'success',
												timer: 2000,
												placement: {
									                from: 'top',
									                align: 'center'
									            }
											});

						});
	</script> -->

</body>
</html>