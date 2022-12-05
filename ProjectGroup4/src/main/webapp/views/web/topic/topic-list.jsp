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
								<tr>
									<td>1</td>
									<td>Máy phát nhạc MP3 trên nền kit nhúng</td>
									<td>Đinh Công Đoan</td>
									<td>Mạng máy tính</td>
									<td><a href="information_project.html"
										data-toggle="tooltip" data-original-title="Edit user"> Xem
											chi tiết</a></td>
								</tr>
								<c:forEach items="${topicList}" var="topic">
									<tr>
									<td>113</td>
									<td>${topic.topicname}</td>
									<td>${topic.instructorid}</td>
									<td>${topic.major}</td>
									<td><a href='<c:url value='/topic-detail?topicid=${topic.topicid}'/>'
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

<div class="text-center">
	<a href="<c:url value='/topic-type'/>"><button type="submit"
			class="btn btn-info btn-fill btn-wd">Quay lại</button></a>
</div>

<br>