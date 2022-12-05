<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="header">
						<h4 class="title">Chi tiết đề tài</h4>
						<p class="category">${topic.topicname}</p>
					</div>
					<div class="content table-responsive table-full-width">
						<table class="table table-hover">
							<thead>
								<th>Chi tiết đề tài</th>
								<th>Nội dung</th>
								<th></th>
							</thead>
							<tbody>
								<tr>
									<td>Tên đề tài</td>
									<td>${topic.topicname}</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>Mục tiêu</td>
									<td>${topic.topictarget}</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>Yêu cầu</td>
									<td>${topic.request}</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>Sản phẩm</td>
									<td>${topic.product}</td>
									<td></td>
									<td></td>
								</tr>
							
								<tr>
									<td>Số lượng sinh viên</td>
									<td>${(topic.leaderid != null ? 1 : 0) + (topic.memberid != null ? 1 : 0)} / 2</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>Được phép đăng ký khác chuyên ngành</td>
									<td>Không</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>Chuyên ngành</td>
									<td>${topic.major}</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>Loại đề tài</td>
									<td>${topic.topictype}</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>Trạng thái</td>
									<td><c:choose>
											<c:when test="${topic.topictype}"> Được bảo vệ</c:when>
											<c:otherwise>Không được bảo vệ</c:otherwise>
										</c:choose></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>Niên khóa</td>
									<td>${topic.schoolyear}</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>Trưởng nhóm</td>
									<td>${topic.leaderid}</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>Các Thành viên</td>
									<td>${topic.memberid}</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>GV hướng dẫn</td>
									<td>${topic.instructorid }</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>GV phản biện</td>
									<td>${topic.criticalid }</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>Điểm đề tài</td>
									<td><c:choose>
											<c:when test="${topic.topicscore != 0}"> ${topic.topicscore }</c:when>
											<c:otherwise>Chưa có điểm</c:otherwise>
										</c:choose></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="text-center">
	<button type="submit" onclick="history.back()"
			class="btn btn-info btn-fill btn-wd">Quay lại</button>
</div>

<br/>