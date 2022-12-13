<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/common/taglib.jsp" %>



<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Đăng kí đề tài</h1>
                    <p class="mb-4">Hướng dẫn xem cách đăng kí<a target="_blank"
                            href="#.jsp">   Xem hướng dẫn</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h4 class="m-0 font-weight-bold text-primary" style="justify-content: center;">Danh sách đề tài</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>                                            
                                            <th>Tên đề tài</th>
                                            <th>GVHD</th>
                                            <th>Chuyên ngành</th>
                                            <th>SLSV</th>
                                            <th>Chi tiết</th>
                                            <th>Đăng kí</th>                                         
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
										<c:forEach items="${topicList}" var="topic">
											<tr>
												<td>${topic.topicname}</td>
												<td>${topic.instructorid}</td>
												<td>${topic.major}</td>
												<td>${(topic.leaderid != null ? 1 : 0) + (topic.memberid != null ? 1 : 0)} / 2</td>
												<td>
													<div class="text-center">
														<a href="<c:url value='/topic-detail?topicId=${topic.topicid}'/>"><button
																class="btn btn-info btn-fill btn-wd">Chi Tiết</button></a>
													</div>
												</td>
												<td>
													<div class="text-center">
														<a href="<c:url value='/regTopic/reg?topicId=${topic.topicid}'/>"><button
																class="btn btn-info btn-fill btn-wd">Đăng kí</button></a>
													</div>
												</td>
												
												<%-- <td><a
													href='<c:url value='/topic-detail?topicId=${topic.topicid}'/>'
													data-toggle="tooltip" data-original-title="Edit user">
														Xem chi tiết</a></td> --%>
											</tr>
										</c:forEach>
                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

					<nav aria-label="Page navigation" class="text-center">
						<ul class="mypagination justify-content-center mb-3">

							<c:set
								value="${pageContext.request.contextPath}/regTopic/list?"
								var="listUrl" />

							<li
								class="page-item <c:if test="${index == '1'}">disabled</c:if>">
								<a class="page-link" href="${listUrl}&index=1"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
							</a>
							</li>

							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<li
									class="page-item <c:if test="${index == i.toString()}">active</c:if>">
									<a class="page-link" href="${listUrl}&index=${i}">${i}</a>
								</li>
							</c:forEach>

							<li
								class="page-item <c:if test="${index == lastPage}">disabled</c:if>">
								<a class="page-link" href="${listUrl}&index=${lastPage}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>

							</a>
							</li>

						</ul>
					</nav>

				</div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

   

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/assets/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/assets/js/datatables-demo.js"></script>

</body>
