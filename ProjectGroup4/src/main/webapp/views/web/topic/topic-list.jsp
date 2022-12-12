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
						<table class="table table-striped">
							<thead>
								<th>STT</th>
								<th>Tên đề tài</th>
								<th>GVHD</th>
								<th>Chuyên ngành</th>
								<th></th>
							</thead>
							<tbody>
								<c:forEach items="${topicList}" var="topic">
									<tr>
									<td>${topic.topicid}</td>
									<td>${topic.topicname}</td>
									<td>${topic.instructorid}</td>
									<td>${topic.major}</td>
									<td><a href='<c:url value='/topic-detail?topicId=${topic.topicid}'/>'
										data-toggle="tooltip" data-original-title="Edit user"> Xem
											chi tiết</a></td>
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
	
		<c:set value="${pageContext.request.contextPath}/topic-list?topicType=${topicType}" var="listUrl"/>
		
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
			
		<%-- <li class="page-item active"><a class="page-link" href="${listUrl}&index=1">1</a></li>
		<li class="page-item"><a class="page-link" href="#">2</a></li>
		<li class="page-item"><a class="page-link" href="#">3</a></li> --%>
		
		<li class="page-item <c:if test="${index == lastPage}">disabled</c:if>">
		<a class="page-link" href="${listUrl}&index=${lastPage}"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
				class="sr-only">Next</span>
				
		</a></li>
		
	</ul>
</nav>

<%-- <div class="text-center">
	<a href="<c:url value='/topic-type'/>"><button type="submit"
			class="btn btn-info btn-fill btn-wd">Quay lại</button></a>
</div> --%>

<br>