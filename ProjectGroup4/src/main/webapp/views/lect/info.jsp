<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<c:url value="/lect/updInfo" var="editInfo"></c:url>
<c:url value="/lect/updPass" var="editPass"></c:url>

<div class="content">
	<div class="container-fluid">
		<div class="row">
		<form enctype="multipart/form-data" method ="post" role="form" action="${editInfo}}">
		
			<div class="col-lg-4 col-md-5">
				<div class="card card-user">
					<div class="image">
						<img src="${pageContext.request.contextPath}/assets/img/background.jpg" alt="..." />
					</div>
					<div class="content">
						<div class="author">

							<!-- Avatar -->
							<label> <input type="file" accept="image/*" name="icon"
								onchange="document.querySelector('.profilepic__image').src = window.URL.createObjectURL(this.files[0]);
							document.querySelector('.avatar-topbar.border-white').src = window.URL.createObjectURL(this.files[0]);"
								style="display: none; cursor: pointer;"> <a>
									<div class="profilepic">
										<c:url value="/image?fname=${account.avatar}" var="imgUrl"></c:url>
										<img class="profilepic__image" src="${imgUrl}"
											onerror="this.src='${pageContext.request.contextPath}/assets/img/avatar/lecturer.jpg';this.onerror='';"
											width="100" height="100" alt="Profibild"
											style="align-items: center;">
										<div class="profilepic__content">
											<span class="profilepic__icon"><i
												class="fas fa-camera"></i></span> <span class="profilepic__text">Đổi
												ảnh</span>
										</div>
									</div>
							</a>
							</label>
							<!-- Avatar -->

							<br /> <br />
							<hr>
							<br />
							<h4 class="title">
								${account.fullname}<br /> <a href="#"><small>${account.email}</small></a>
							</h4>

						</div>
					</div>
					<hr>
				</div>
				<div class="card">
					<div class="header">
						<h4 class="title">Hội đồng phản biện</h4>
					</div>
					<div class="content">

						<!-- Đoạn này thêm danh sách những đưa cùng nhóm nó từ database -->
						<ul class="list-unstyled team-members">
							<li>
								<div class="row">
									<div class="col-xs-3">
										<div class="avatar">
											<img src="${pageContext.request.contextPath}/assets/img/faces/face-0.jpg" alt="Circle Image"
												class="img-circle img-no-padding img-responsive">
										</div>
									</div>
									<div class="col-xs-6">
										DJ Khaled <br /> <span class="text-muted"><small>Offline</small></span>
									</div>

									<div class="col-xs-3 text-right">
										<btn class="btn btn-sm btn-success btn-icon">
										<i class="fa fa-envelope"></i></btn>
									</div>
								</div>
							</li>
							<li>
								<div class="row">
									<div class="col-xs-3">
										<div class="avatar">
											<img src="${pageContext.request.contextPath}/assets/img/faces/face-1.jpg" alt="Circle Image"
												class="img-circle img-no-padding img-responsive">
										</div>
									</div>
									<div class="col-xs-6">
										Creative Tim <br /> <span class="text-success"><small>Available</small></span>
									</div>

									<div class="col-xs-3 text-right">
										<btn class="btn btn-sm btn-success btn-icon">
										<i class="fa fa-envelope"></i></btn>
									</div>
								</div>
							</li>
							<li>
								<div class="row">
									<div class="col-xs-3">
										<div class="avatar">
											<img src="${pageContext.request.contextPath}/assets/img/faces/face-3.jpg" alt="Circle Image"
												class="img-circle img-no-padding img-responsive">
										</div>
									</div>
									<div class="col-xs-6">
										Flume <br /> <span class="text-danger"><small>Busy</small></span>
									</div>

									<div class="col-xs-3 text-right">
										<btn class="btn btn-sm btn-success btn-icon">
										<i class="fa fa-envelope"></i></btn>
									</div>
								</div>
							</li>
						</ul>
						<!-- Kết thúc đoạn thêm danh sách nhóm -->
					</div>
				</div>
			</div>
			<div class="col-lg-8 col-md-7">
				<div class="card">
					<div class="header">
						<h4 class="title">Chỉnh sửa thông tin</h4>
					</div>
					<div class="content">
							<div class="row">
								<div class="col-md-7">
									<div class="form-group">
										<label>Họ và tên</label> <input type="text"
											class="form-control border-input" placeholder="Nguyễn Văn A"
											value="${account.fullname}" name="fullName">
									</div>
								</div>

								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Chuyên ngành</label> <input
											type="text" list="genders" class="form-control border-input"
											placeholder="Chuyên ngành" value="${account.major}" name="major"/>
										<datalist id="genders">
											<option>Công Nghệ Phần Mềm</option>
											<option>Hệ Thống Thông Tin</option>
											<option>Mạng Máy Tính</option>
										</datalist>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="exampleInputEmail1">Địa chỉ Email</label> <input
											type="email" class="form-control border-input"
											placeholder="@gmail.com" value="${account.email}" name="email">
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group">
										<label>Số điện thoại</label> <input type="text"
											class="form-control border-input"
											placeholder="+84 xx.xxx.xxxx" value="${account.phone}" name="phone">
									</div>
								</div>
								
							</div>

							<div class="text-center">
								<button onclick="form.action='<c:url value="/lect/updInfo"/>';"
								type="submit" class="btn btn-info btn-fill btn-wd"
								>Cập nhật thông tin</button>
							</div>
							<div class="clearfix"></div>
					</div>
				</div>
			</div>
			</form>
			
			<form action="${editPass}" method="post">
			<div class="col-lg-8 col-md-7">
				<div class="card">
					<div class="header">
						<h4 class="title">Đổi mật khẩu</h4>
					</div>
					<div class="content">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Mật khẩu cũ</label> <input type="password"
											class="form-control border-input" placeholder="" value="" name="oldPass">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Mật khẩu mới</label> <input type="password"
											class="form-control border-input" placeholder="" value="" name="newPass">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Nhập lại mật khẩu mới</label> <input type="password"
											class="form-control border-input" placeholder="" value="" name="newPassConfirm">
									</div>
								</div>
							</div>		
							<div class="text-center">
								<button type="submit" class="btn btn-info btn-fill btn-wd"
								onclick="form.action='updPass';">Cập
									nhật mật khẩu</button>
							</div>
							<div class="clearfix"></div>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>


