<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Đăng nhập</title>


<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link href="${pageContext.request.contextPath}/assets/css/tailwind.output.css" rel="stylesheet"
	type="text/css" />
	
<link href="${pageContext.request.contextPath}/assets/css/myCSS.css" rel="stylesheet"
	type="text/css" />

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
	rel="stylesheet" />

<!--Awesome v5-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
	defer></script>
<script src="${pageContext.request.contextPath}/assets/js/init-alpine.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="${pageContext.request.contextPath}/assets/js/demo.js"></script>



</head>
<body>
	<form action="login" method="post">
	
		
		
		
		<div
		class="flex items-center min-h-screen p-6 bg-gray-50 dark:bg-gray-900">
		<div
			class="flex-1 h-full max-w-4xl mx-auto overflow-hidden bg-white rounded-lg shadow-xl dark:bg-gray-800">
			<div class="flex flex-col overflow-y-auto md:flex-row">
				<div class="h-32 md:h-auto md:w-1/2">
					<img aria-hidden="true"
						class="object-cover w-full h-full dark:hidden"
						src="${pageContext.request.contextPath}/assets/img/login-school.jpg" alt="UTE" /> <img
						aria-hidden="true"
						class="hidden object-cover w-full h-full dark:block"
						src="${pageContext.request.contextPath}/assets/img/login-office-dark.jpeg" alt="Office" />
				</div>
				<div class="flex items-center justify-center p-6 sm:p-12 md:w-1/2">
						<!-- Thông báo các các lỗi dăng nhập sau khi đã submit đăng nhập -->
						
						<div class="w-full">
						<c:if test="${alert !=null}">
							
							<div class="alertw3s">
								<span class="close-alertw3s"
									onclick="this.parentElement.style.display='none';">&times;</span>
								<strong>Lỗi!</strong> ${alert}
							</div>

						</c:if>
						
						<h1
							class="mb-4 text-xl font-semibold text-gray-700 dark:text-gray-200">
							Đăng nhập</h1>
							
							<!--  Textbox đăng nhập -->
						<label class="block text-sm"> <span
							class="text-gray-700 dark:text-gray-400">Email</span> <input
							class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
							name="username"
							placeholder="nguyenvana@student.hcmute.edu.vn" />
							<!--  Textbox đăng nhập -->
							
							<!-- Textbox password -->
						</label> <label class="block mt-4 text-sm"> <span
							class="text-gray-700 dark:text-gray-400">Mật khẩu</span> <input
							class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
							name="password"
							placeholder="********" type="password" />
						</label> 
							<!-- Textbox password -->
						
						<br />
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								id="flexCheckDefault" style="align-items: center" name="remember"> <label
								class="form-check-label" for="flexCheckDefault"
								style="font-size: 90%"> Nhớ mật khẩu </label>
						</div>

						<!-- You should use a button here, as the anchor is only used for the example  -->
						<button
							type="submit"
							class="block w-full px-4 py-2 mt-4 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
							Đăng nhập
						</button>

						<hr class="my-8" />

						<button
							onclick="location.href='${pageContext.request.contextPath}/home'"
							class="flex items-center justify-center w-full px-4 py-2 text-sm font-medium leading-5 text-white text-gray-700 transition-colors duration-150 border border-gray-300 rounded-lg dark:text-gray-400 active:bg-transparent hover:border-gray-500 focus:border-gray-500 active:text-gray-500 focus:outline-none focus:shadow-outline-gray">
							<svg class="w-4 h-4 mr-2" aria-hidden="true" viewBox="0 0 24 24"
								fill="currentColor">
               				 </svg>
							Trang chủ
						</button>

						<p class="mt-4">
							<a
								class="text-sm font-medium text-purple-600 dark:text-purple-400 hover:underline"
								href="/account/forgot-pass"> Quên mật khẩu? </a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>

</body>
</html>