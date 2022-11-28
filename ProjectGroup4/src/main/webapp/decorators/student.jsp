<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="dec"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>

<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="/assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Paper Dashboard by Creative Tim</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<!-- Bootstrap core CSS     -->
<link href="/assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="/assets/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="/assets/css/paper-dashboard.css" rel="stylesheet" />


<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="/assets/css/demo.css" rel="stylesheet" />


<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="/assets/css/themify-icons.css" rel="stylesheet">

</head>

<body>
<%-- 	<%@ include file="/common/web/header-user.jsp"%>
 --%>
	<!-- body -->
	<dec:body />
	<!-- body -->

	<!--=== Footer v4 ===-->
	<jsp:include page="/common/web/footer.jsp"></jsp:include>
	<!--=== End Footer v4 ===-->


	<!--  JS-->
	<!--   Core JS Files   -->
	<script src="/assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="/assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="/assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="/assets/js/chartist.min.js"></script>

	<!--  Notifications Plugin    -->
	<script src="/assets/js/bootstrap-notify.js"></script>

	<!--  Google Maps Plugin    -->
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js"></script>

	<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="/assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="/assets/js/demo.js"></script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							demo.initChartist();

							$
									.notify(
											{
												icon : 'ti-gift',
												message : "Welcome to <b>Paper Dashboard</b> - a beautiful Bootstrap freebie for your next project."

											}, {
												type : 'success',
												timer : 4000
											});

						});
	</script>

</body>
</html>