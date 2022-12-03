<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<!-- Thông báo các các lỗi dăng nhập sau khi đã submit đăng nhập -->
<c:if test="${alert!=null}">
	<h3 class="alert alertdanger">${alert}</h3>
</c:if>

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-4 col-md-5">
				<div class="card card-user">
					<div class="image">
						<img src="${pageContext.request.contextPath}/assets/img/background.jpg" alt="..." />
					</div>
					<div class="content">
						<div class="author">
						
							<img class="avatar border-white"
								src="${account.avatar}"
										onerror="this.src='${pageContext.request.contextPath}/assets/img/avatar/lecturer.jpg';this.onerror='';"
										 alt="Ảnh đại diện" />
										 
							<h4 class="title">
								${account.fullname}<br /> <a href="#"><small>${account.email}</small></a>
							</h4>
						</div>
						<!-- Đoạn này tiểu sử  -->
						<!-- <p class="description text-center">
                                    "I like the way you work it <br>
                                    No diggity <br>
                                    I wanna bag it up"
                                </p> -->
						<!-- Đoạn này tiểu sử  -->
					</div>
					<hr>
					<!-- Thanh thống kê dưới avatar -->
					<!--  <div class="text-center">
                                <div class="row">
                                    <div class="col-md-3 col-md-offset-1">
                                        <h5>12<br /><small>Files</small></h5>
                                    </div>
                                    <div class="col-md-4">
                                        <h5>2GB<br /><small>Used</small></h5>
                                    </div>
                                    <div class="col-md-3">
                                        <h5>24,6$<br /><small>Spent</small></h5>
                                    </div>
                                </div>
                            </div>  -->
					<!-- Thanh thống kê dưới avatar -->
                            
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
						<form>
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
								<button onclick="form.action='updInfo';"
								type="submit" class="btn btn-info btn-fill btn-wd"
								>Cập nhật thông tin</button>
							</div>
							<div class="clearfix"></div>
						</form>
					</div>
				</div>
			</div>

			<div class="col-lg-8 col-md-7">
				<div class="card">
					<div class="header">
						<h4 class="title">Đổi mật khẩu</h4>
					</div>
					<div class="content">
						<form>
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
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>


