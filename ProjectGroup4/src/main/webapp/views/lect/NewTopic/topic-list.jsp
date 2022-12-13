<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="header">
						<h4 class="title">Danh sách</h4>
						<p class="category">${topicList_title}</p>
					</div>
					<div class="content table-responsive table-full-width">
						<table class="table table-hover">
							<thead>
								<th>STT</th>
								<th>Tên đề tài</th>
								<th>GVHD</th>
								<th>Chuyên ngành</th>
								<th>Khoá</th>
								<th>Trạng thái</th>
							</thead>
							<tbody>

								<c:forEach items="${topicList}" var="topic">
									<tr>
										<td>${topic.topicid}</td>
										<td>${topic.topicname}</td>
										<td>${topic.instructorid}</td>
										<td>${topic.major}</td>
										<td>${topic.schoolyear}</td>

										<td><a data-toggle="tooltip"
											data-original-title="Edit user"> Đang chờ duyệt</a></td>

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
	
		<c:set value="${pageContext.request.contextPath}/NewTopic/list?" var="listUrl"/>
		
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
		<div class="text-center">
			<a href="<c:url value='/NewTopic/add'/>"><button type="submit"
					class="btn btn-info btn-fill btn-wd">Thêm đề tài mới</button></a>
		</div>
</nav>

<br>