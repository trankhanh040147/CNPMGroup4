<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<%@ include file="/common/taglib.jsp"%>

<head>
	<meta charset="UTF-8">
</head>

<body>

	<div class="sidebar" data-background-color="white"
		data-active-color="danger">

		<!--
	Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
	Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
-->

		<div class="sidebar-wrapper">
			<div class="logo">
				<a href="https://github.com/trankhanh040147/CNPMGroup4"
					class="simple-text"> Danh mục </a>
			</div>
			<ul class="nav">
				<li class="active"><a
					href="${pageContext.request.contextPath}/home"> <i
						class="ti-panel"></i>
						<p>Trang chủ</p>
				</a></li>

				<li><a href="${pageContext.request.contextPath}/topic-type"> <i class="ti-view-list-alt"></i>
						<p>Danh sách đề tài</p>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/search"> <i class="ti-text"></i>
						<p>Tìm kiếm</p>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/notification"> <i class="ti-bell"></i>
						<p>Thông báo</p>
				</a></li>
			</ul>
		</div>
	</div>

	<div class="main-panel">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
						<span class="icon-bar bar3"></span>
					</button>
					<a class="navbar-brand"
						href="${pageContext.request.contextPath}/home"> <i
						class="fas fa-home"></i> Home
					</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href=<c:url value="/login"/> class="btn btn-success"><i
								class="fas bars"></i>Đăng nhập</a></li>
					</ul>
				</div>
			</div>
		</nav>
</body>


</html>