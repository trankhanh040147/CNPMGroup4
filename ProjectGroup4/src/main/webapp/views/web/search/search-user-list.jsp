<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="header">
						<h4 class="title">Danh sách</h4>
						<p class="category">${list_title}</p>
					</div>
					<div class="content table-responsive table-full-width">
						<table class="table table-striped">
							<thead>
								<th>Avatar</th>
								<th>Mã số</th>
								<th>Họ và tên</th>
								<th>Chuyên ngành</th>
								<th>Số điện thoại</th>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="user">
									<tr>
									<td><div class="card-user">
									<c:url value="/image?fname=${user.avatar}" var="imgUrl"/>
												<img class="avatar-search border-white"
													src="${imgUrl}"
													 <c:if test="${user.roleid!=3}">onerror="this.src='${pageContext.request.contextPath}/assets/img/avatar/lecturer.jpg';this.onerror='';"</c:if>
													<c:if test="${user.roleid==3}">onerror="this.src='${pageContext.request.contextPath}/assets/img/avatar/student.jpg';this.onerror='';"</c:if> 
													onclick="location.href='<c:url value='/user-detail?userId=${user.userid}'/>'"
													alt="..." />
											</div></td>
									
										
										<td>${user.userid}</td>
										<td>${user.fullname}</td>
										<td>${user.major}</td>
										<td>${user.phone}</td>
										<td><a
											href='<c:url value='/userDetail?userid=${user.userid}'/>'
											data-toggle="tooltip" data-original-title="Edit user">
												Xem chi tiết</a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<nav aria-label="Page navigation" class="text-center">
	<ul class="mypagination justify-content-center mb-3">

		<c:set
			value="${pageContext.request.contextPath}/search/searching?choice=${choice}&search_keyword=${keyword}"
			var="listUrl" />

		<li class="page-item <c:if test="${index == '1'}">disabled</c:if>">
			<a class="page-link" href="${listUrl}&index=1" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
		</a>
		</li>

		<c:forEach begin="${startPage}" end="${endPage}" var="i">
			<li
				class="page-item <c:if test="${index == i.toString()}">active</c:if>">
				<a class="page-link" href="${listUrl}&index=${i}">${i}</a>
			</li>
		</c:forEach>

		<%-- <li class="page-item active"><a class="page-link" href="${listUrl}&index=1">1</a></li>
		<li class="page-item"><a class="page-link" href="#">2</a></li>
		<li class="page-item"><a class="page-link" href="#">3</a></li> --%>

		<li
			class="page-item <c:if test="${index == lastPage}">disabled</c:if>">
			<a class="page-link" href="${listUrl}&index=${lastPage}"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
				class="sr-only">Next</span>

		</a>
		</li>

	</ul>
</nav>

<%-- <div class="text-center">
	<a href="<c:url value='/topic-type'/>"><button type="submit"
			class="btn btn-info btn-fill btn-wd">Quay lại</button></a>
</div> --%>

<br>