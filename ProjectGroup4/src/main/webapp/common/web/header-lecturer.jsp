<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<%@ include file="/common/taglib.jsp"%>

<head>
	<meta charset="UTF-8">
</head>

<body>
	<div class="sidebar" data-background-color="white" data-active-color="danger">

		<!--
	Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
	Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
-->

		<div class="sidebar-wrapper">
			<div class="logo">
				<a href="https://github.com/trankhanh040147/CNPMGroup4" class="simple-text"> Danh mục </a>
			</div>
			<ul class="nav">
				<li class="active"><a href="${pageContext.request.contextPath}/home"> <i class="ti-panel"></i>
						<p>Trang chủ</p>
					</a></li>

				<li><a href="<c:url value="/topic-type"/>">
						<i class="ti-view-list-alt"></i>
						<p>Danh sách đề tài</p>
					</a></li>
				<li><a href="<c:url value="/search"/>"> <i class="ti-text"></i>
						<p>Tìm kiếm</p>
					</a></li>
				<li><a href="home"> <i class="ti-bell"></i>
						<p>Thông báo</p>
					</a></li>
			</ul>
			
			<div class="logo">
				<a href="${pageContext.request.contextPath}/lect/home" class="simple-text">Giảng Viên</a>
			</div>
			<ul class="nav">
				<li><a href="${pageContext.request.contextPath}/lect/info"> <i class="ti-id-badge"></i>
						<p>Quản lí tài khoản</p>
					</a></li>

				<li><a href="<c:url value="/NewTopic/list"/>"> <i class="ti-plus"></i>
						<p>Đăng ký đề tài</p>
				</a></li>

				<li><a href=>
						<i class="ti-package"></i>
						<p>Quản lí đề tài</p>
					</a></li>
			</ul>
			
		</div>		
	</div>

	<div class="main-panel">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle">
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar bar1"></span> <span
							class="icon-bar bar2"></span>
						<span class="icon-bar bar3"></span>
					</button>
					<a class="navbar-brand"
						href="${pageContext.request.contextPath}/home">
						 <i class="fas fa-home"></i> Home
					</a>
				</div>
				
				
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li>
                            <a href="#">
								<!-- <i class="ti-settings"></i> -->
<!-- 								<img src="" class="rounded-circle" style="width: 150px;" />
 -->
								<div class="card-user">
									<c:url value="/image?fname=${account.avatar}" var="imgUrl"></c:url>
									<img class="avatar-topbar border-white"
									src="${imgUrl}"
										onerror="this.src='${pageContext.request.contextPath}/assets/img/avatar/lecturer.jpg';this.onerror='';"
										onclick="location.href='${pageContext.request.contextPath}/student/info'"
										alt="..." />
								</div>
                            </a>
                        </li>
						<li>
						  <a href=<c:url value="/logout"/>
							class="btn btn-danger"><i class="fas bars"></i>Đăng xuất</a> 
						</li>
					</ul>
				</div>
			</div>
		</nav>
</body>


</html>