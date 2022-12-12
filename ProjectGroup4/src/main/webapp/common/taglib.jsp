<%-- 
${pageContext.request.contextPath}
--> webapp | DKDTUTE

demo.showNtf
- success: 2
- warn: 3
- error: 4
- info: 5

<script type="text/javascript">
	window.onload = function() {
		demo.showNtf(2, 'Success', 'ti-check');
		};
</script>

<script type="text/javascript">
	window.onload = function() {
		demo.showNtf(3, 'Warning', 'ti-na');
		};
</script>

<script type="text/javascript">
	window.onload = function() {
		demo.showNtf(4, 'error', 'ti-close');
		};
</script>

<script type="text/javascript">
	window.onload = function() {
		demo.showNtf(5, 'Info', 'ti-info');
		};
</script>

onclick="location.href='${pageContext.request.contextPath}/home'"

req.getContextPath()
--> http://localhost:8080/DKDTUTE
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

