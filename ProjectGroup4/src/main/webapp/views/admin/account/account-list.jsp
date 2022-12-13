<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<!-- <p class="mb-4">Hướng dẫn xem cách đăng kí<a target="_blank"
                            href="#.jsp">   Xem hướng dẫn</a>.</p> -->

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<hr/>
						<div class="card-header py-3">
							<h3 class="m-0 font-weight-bold text-primary">&nbsp; &nbsp; Danh sách tài
								khoản</h3>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Avatar</th>
											<th>Loại tài khoản</th>
											<th>Email</th>
											<th>Họ tên</th>
											<th>Chi tiết tài khoản</th>
											<th></th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<tr>

											<c:forEach items="${list}" var="user">
												<tr>
													<td><div class="card-user">
															<c:url value="/image?fname=${user.avatar}" var="imgUrl" />
															<img class="avatar-search border-white" src="${imgUrl}"
																<c:if test="${user.roleid!=3}">onerror="this.src='${pageContext.request.contextPath}/assets/img/avatar/lecturer.jpg';this.onerror='';"</c:if>
																<c:if test="${user.roleid==3}">onerror="this.src='${pageContext.request.contextPath}/assets/img/avatar/student.jpg';this.onerror='';"</c:if>
																onclick="location.href='<c:url value='/user-detail?userId=${user.userid}'/>'"
																alt="..." />
														</div></td>


													<td><c:choose>
															<c:when test="${user.roleid == 3}">
																Sinh viên
															</c:when>
															<c:when test="${user.roleid == 1 || user.roleid==2}">
																Giảng viên
															</c:when>
														</c:choose></td>
													<td>${user.email}</td>
													<td>${user.fullname}</td>
													<%-- <td><a
														href='<c:url value='/user-detail?userId=${user.userid}'/>'
														data-toggle="tooltip" data-original-title="Edit user">
															Xem chi tiết</a></td> --%>

													<td>
														<div class="text-center">
															<a href="<c:url value='/userDetail?userid=${user.userid}'/>"><button
																	type="submit" class="btn btn-info btn-fill btn-wd">Chi
																	Tiết</button></a>
														</div>
													</td>
													
													<td>
														<div class="text-center">
															<a href="<c:url value='/user-edit?userId=${user.userid}'/>"><button type="submit"
																	class="btn btn-info btn-fill btn-wd">Sửa</button></a>
														</div>
													</td>
													
													<td>
														<div class="text-center">
															<a href="<c:url value='/user-delete?userId=${user.userid}'/>"><button type="submit"
																	class="btn btn-info btn-fill btn-wd">Xóa</button></a>
														</div>
													</td>
													
												</tr>
											</c:forEach>

									</tbody>
								</table>
							</div>
							<div class="text-center">
									<br/>
							
									<a href="#.html"><button type="submit"
											class="btn btn-info btn-fill btn-wd">Thêm tài khoản</button></a>
											
								</div>
						</div>
					</div>
					

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->



		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	
<br>
	<nav aria-label="Page navigation" class="text-center">
	<ul class="mypagination justify-content-center mb-3">
	
		<c:set value="${pageContext.request.contextPath}/account?" var="listUrl"/>
		
		<li class="page-item <c:if test="${index == '1'}">disabled</c:if>">
		<a class="page-link" href="${listUrl}&index=1" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
		</a>
		</li>
		
		<c:forEach begin="${startPage}" end="${endPage}" var="i">
				<li class="page-item <c:if test="${index == i.toString()}">active</c:if>">
				<a class="page-link" href="${listUrl}&index=${i}">${i}</a>
				</li>
		</c:forEach>
		
		<li class="page-item <c:if test="${index == lastPage}">disabled</c:if>">
		<a class="page-link" href="${listUrl}&index=${lastPage}"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
				class="sr-only">Next</span>
				
		</a></li>

	</ul>
	<hr/>
</nav>
	
	