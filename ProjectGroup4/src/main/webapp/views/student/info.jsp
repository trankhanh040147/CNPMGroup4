<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!-- CSS for avatar  -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/solid.min.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/svg-with-js.min.css" rel="stylesheet" />
<!-- CSS for avatar  -->	

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="${pageContext.request.contextPath}/assets/js/demo.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.js" type="text/javascript"></script>

	
<c:url value="/student/updInfo" var="editInfo "></c:url>
<c:url value="/student/updPass" var="editPass "></c:url>

	
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
											onerror="this.src='${pageContext.request.contextPath}/assets/img/avatar/student.jpg';this.onerror='';"
											width="100" height="100" alt="Profibild"
											style="align-items: center;">
										<div class="profilepic__content">
											<span class="profilepic__icon"><i
												class="fas fa-camera"></i></span> <span class="profilepic__text">?????i
												???nh</span>
										</div>
									</div>
							</a>
							</label>
							<!-- Avatar -->
							
							<br/>
							<br/>
							<hr>
							<br/>
							<h4 class="title">
								${account.fullname}<br /> <a href="#"><small>${account.email}</small></a>
							</h4>
							
						</div>
						<!-- ??o???n n??y ti???u s???  -->
						<!-- <p class="description text-center">
                                    "I like the way you work it <br>
                                    No diggity <br>
                                    I wanna bag it up"
                                </p> -->
						<!-- ??o???n n??y ti???u s???  -->
					</div>
					<hr>
					<!-- Thanh th???ng k?? d?????i avatar -->
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
					<!-- Thanh th???ng k?? d?????i avatar -->
                            
				</div>
				<div class="card">
					<div class="header">
						<h4 class="title">Nh??m ????? ??n</h4>
					</div>
					<div class="content">

						<!-- ??o???n n??y th??m danh s??ch nh???ng ????a c??ng nh??m n?? t??? database -->
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
						<!-- K???t th??c ??o???n th??m danh s??ch nh??m -->
					</div>
				</div>
			</div>
			<div class="col-lg-8 col-md-7">
				<div class="card">
					<div class="header">
						<h4 class="title">Ch???nh s???a th??ng tin</h4>
					</div>
					<div class="content">
<!-- 						<form enctype="multipart/form-data"> -->
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>H??? v?? t??n</label> <input type="text"
											class="form-control border-input" placeholder="Nguy???n V??n A"
											value="${account.fullname}" name="fullName">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>M?? s??? sinh vi??n</label> <input type="text"
											class="form-control border-input" disabled placeholder="20110221"
											value="${account.userid}" name="userId">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Chuy??n ng??nh</label> <input
											type="text" list="majors" class="form-control border-input" disabled
											placeholder="Chuy??n ng??nh" value="${account.major}" name="major"/>
										<datalist id="majors">
											<option>C??ng Ngh??? Ph???n M???m</option>
											<option>H??? Th???ng Th??ng Tin</option>
											<option>M???ng M??y T??nh</option>
										</datalist>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="exampleInputEmail1">?????a ch??? Email</label> <input
											type="email" class="form-control border-input"
											placeholder="@gmail.com" value="${account.email}" name="email">
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group">
										<label>S??? ??i???n tho???i</label> <input type="text"
											class="form-control border-input"
											placeholder="+84 xx.xxx.xxxx" value="${account.phone}" name="phone">
									</div>
								</div>
								
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-info btn-fill btn-wd"
								onclick="form.action='updInfo';">C???p
									nh???t th??ng tin</button>
							</div>
							<div class="clearfix"></div>
<!-- 							</form>
 -->					</div>
				</div>
			</div>
			
			</form>
			
			<form action="${editPass}" method="post">
			<div class="col-lg-8 col-md-7">
				<div class="card">
					<div class="header">
						<h4 class="title">?????i m???t kh???u</h4>
					</div>
					<div class="content">
						<form>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>M???t kh???u c??</label> <input type="password"
											class="form-control border-input" placeholder="" name="oldPass">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>M???t kh???u m???i</label> <input type="password"
											class="form-control border-input" placeholder="" name="newPass">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Nh???p l???i m???t kh???u m???i</label> <input type="password"
											class="form-control border-input" placeholder="" name="newPassConfirm">
									</div>
								</div>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-info btn-fill btn-wd"
								onclick="form.action='updPass';">C???p
									nh???t m???t kh???u</button>
							</div>
							<div class="clearfix"></div>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>




