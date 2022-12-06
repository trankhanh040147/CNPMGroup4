<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="dec"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="vi">

<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath}/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>DKDTUTE</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	<meta name="viewport" content="width=device-width" />


	<!-- Bootstrap core CSS     -->
	<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />

	<!-- Animation library for notifications   -->
	<link href="${pageContext.request.contextPath}/assets/css/animate.min.css" rel="stylesheet" />

	<!--  Paper Dashboard core CSS    -->
	<link href="${pageContext.request.contextPath}/assets/css/paper-dashboard.css" rel="stylesheet" />

	<!--  Fonts and icons     -->
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
	<!-- <link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'> -->
	
	<!-- Themify Icon -->
	<link href="${pageContext.request.contextPath}/assets/css/themify-icons.css" rel="stylesheet">
	
	<!-- FontAwesome v5 -->
	<!-- Search icons here: https://fontawesome.com/v5/search?o=r&m=free -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

</head>

<body>

	<!--  Hiển thị alert nếu có -->
	<c:if test="${alert!=null}">
		<script type="text/javascript">
			window.onload = function() {
				demo.showNtf(${alertType}, "${alert}", "${alertIcon}");
			};
		</script>
	</c:if>
	<!--  Hiển thị alert nếu có -->

	<!--  Gắn header theo role -->
	<c:set value="${account.roleid}" var="role"/>
	
	<c:choose>
		<c:when test="${role == 3}">
			<jsp:include page="/common/web/header-student.jsp"></jsp:include>
		</c:when>
		<c:when test="${role == 2}">
			<jsp:include page="/common/web/header-lecturer.jsp"></jsp:include>
		</c:when>
		<c:otherwise>
			<jsp:include page="/common/web/header-guest.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
	<!--  Gắn header theo role -->
	
	<!-- body -->
	<dec:body />
	<!-- body -->

	<!--=== Footer v4 ===-->
	<jsp:include page="/common/web/footer.jsp"></jsp:include>
	<!--=== End Footer v4 ===-->

</body>

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
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="${pageContext.request.contextPath}/assets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/assets/js/demo.js"></script>


</html>