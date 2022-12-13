<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<div class="content">
	<div class="container-fluid">
		<div class="row">

			<div class="col-lg-12 col-md-7">
				<div class="card">
					<div class="header">
						<h4 class="title">Đăng ký đề tài mới</h4>
					</div>
					<div class="content">
						<form method="GET" action="<c:url value="/NewTopic/submit"/>">
							<div class="row">
								<div class="col-md-10">
									<div class="form-group">
										<label>Tên đề tài</label> <input type="text"
											class="form-control border-input" placeholder="Tên đề tài" name="topicName"
											value="">
									</div>
								</div>


								
							</div>

							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label> Mục tiêu đề tài</label> <input type="text" name="topicTarget"
											class="form-control border-input" placeholder="Mục tiêu đề tài" value="">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label> Yêu cầu đề tài</label> <input type="text" name="topicRequire"
											class="form-control border-input" placeholder="Yêu cầu đề tài" value="">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>Sản phẩm</label> <input type="text" name="topicProduct"
											class="form-control border-input" placeholder="Sản phẩm"
											value="">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label for="exampleInputEmail1">Chuyên ngành</label> <input
											type="text" list="majors" class="form-control border-input" 
											placeholder="Công nghệ phần mềm" value"" name="topicMajor" />
										<datalist id="majors">
											<option>Công Nghệ Phần Mềm</option>
											<option>Hệ Thống Thông Tin</option>
											<option>Mạng Máy Tính</option>
										</datalist>
									</div>
								</div>

								<div class="col-md-3">
									<div class="form-group">
										<label for="exForTopicType">Loại đề tài</label> <input
											type="text" list="types" class="form-control border-input"
											placeholder="Tiểu luận chuyên ngành" value"" name="topicType" />
										<datalist id="types">
											<option>Tiểu luận chuyên ngành</option>
											<option>Đề tài tốt nghiệp</option>
										</datalist>
									</div>
								</div>

								<div class="col-md-2">
									<div class="form-group">
										<label for="exForSchoolYear">Khoá</label> <input type="text"
											list="schoolyears" class="form-control border-input"
											placeholder="2018 | 2019" value"" name="topicYear" />
										<datalist id="schoolyears">
											<option>2018</option>
											<option>2019</option>
											<option>2020</option>
										</datalist>
									</div>
								</div>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-info btn-fill btn-wd">Đăng
									ký</button>
							</div>
							<div class="clearfix"></div>
						</form>
					</div>
				</div>
			</div>


		</div>
	</div>
</div>