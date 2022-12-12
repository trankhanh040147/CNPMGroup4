<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<form method="get" action="<c:url value="/search/searching"/>">
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h3 class="center">Tìm kiếm thông tin</h3>
						</div>
						<div class="content table-responsive table-full-width">
							<table class="table ">
								<!-- <thead> -->

								<!-- <th>Nội dung</th> -->

								<!-- </thead> -->
								<!-- <tbody> -->
								<tr>
									<td>
										<div class="row">
											<div class="col-md-12">
												<select
													class="form-select col-md-12 form-control border-input"
													aria-label="Default select example" name="choice">
													<option selected value="lecturer">Tìm kiếm giảng
														viên</option>
													<option value="student">Tìm kiếm sinh viên</option>
													<option value="topic">Tìm kiếm đề tài</option>
												</select>
											</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="row">
											<div class="col-md-12">
												<input type="text" class="form-control border-input"
													placeholder="Nhập thông tin cần tìm" name="search_keyword">
											</div>
										</div>
									</td>
								</tr>
								<!-- </tbody> -->
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="text-center">
		<button type="submit"
				class="btn btn-info btn-fill btn-wd">Tìm kiếm</button>
	</div>
</form>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
