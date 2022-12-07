package vn.dkdtute.Login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.dkdtute.Model.Users;
import vn.dkdtute.Service.IUsersService;
import vn.dkdtute.Service.Impl.UsersServiceImpl;
import vn.dkdtute.Util.Constant;

/**
 * Servlet implementation class LoginController
 */
@WebServlet(urlPatterns = { "/login", "/login/submit", "/login/waiting" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IUsersService service = new UsersServiceImpl();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		String url = req.getRequestURL().toString();

		// Xử lí các patterns
		if (url.contains("login/waiting")) {
			loginWaiting(req, resp);
		}
		else if (url.contains("login/submit")) {
			loginSubmit(req, resp);
		}
		// url = localhost:8080/DKDTUTE/login
		else if (url.endsWith("login")){
			loginCheck(req, resp);
		}

	}
	

	protected void loginPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Chuyến đến form đăng nhập khi click vào nút đăng nhập
		req.getRequestDispatcher("/views/web/login-page.jsp").forward(req, resp);
	}
		
	protected void loginCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Xử lí check tài khoản trên session và cookie
		HttpSession session = req.getSession(false);

		// Nếu đã có session "account" thì chuyển sang sq waiting
		if (session != null && session.getAttribute("account") != null) {
			resp.sendRedirect(req.getContextPath() + "/login/waiting");
			return;
		}
		
		//Nếu không có session thì bắt đầu kiểm tra cookie
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for(Cookie cookie:cookies) {
				//Nếu trong cookie có cookie tên "username" lưu tài khoản của người dùng thì tự động đăng nhập bằng tài khoản đó
				if(cookie.getName().equals("username") && cookie.getValue() != null){
					//Gắn tài khoản đã lưu trong cookie vào session "username"
					session = req.getSession(true);
					session.setAttribute("username", cookie.getValue());
					resp.sendRedirect(req.getContextPath() + "/login/waiting");
					return;
				}
			}
		}
		
		loginPage(req, resp);
	}
	
	private void loginWaiting(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		

		HttpSession session= req.getSession();
		
		//Nếu có session "account" đã lưu thông tin đăng nhập
		if (session != null && session.getAttribute("account") != null) {
			
			//Gắn tài khoản đã lưu trên session "account"
			Users u = (Users) session.getAttribute("account");
			
			//Lưu tên đăng nhập vào session "username"	
			if (u.getRoleid() == 4) {
				resp.sendRedirect(req.getContextPath() + "/admin/home");
			} else if (u.getRoleid() == 1) {
				resp.sendRedirect(req.getContextPath() + "/head-lect/home");
			}
			else if (u.getRoleid() == 2) {
				resp.sendRedirect(req.getContextPath() + "/lect/home");
			} else if (u.getRoleid() == 3) {
				resp.sendRedirect(req.getContextPath() + "/student/home");
			}else {
				resp.sendRedirect(req.getContextPath() + "/guest/home");
			}
		} else {
			resp.sendRedirect(req.getContextPath() + "/guest/home");
		}
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		String username = req.getParameter("username");
		String password = req.getParameter("password");

		boolean isRememberMe = false;
		String remember = req.getParameter("remember");
		if ("on".equals(remember)) {
			isRememberMe = true;
		}

		String alertMsg = "";

		// Thông báo lỗi nếu username hoặc password để trống

		if (username.isEmpty() || password.isEmpty()) {
			alertMsg = "Tài khoản hoặc mật khẩu không được rỗng";
			req.setAttribute("alert", alertMsg);
			req.getRequestDispatcher("/views/web/login-page.jsp").forward(req, resp);
			return;
		}

		// Gọi service và kiểm tra thông tin tài khoản, mật khẩu

		Users account = service.login(username, password);
		
		Users accountInfo = service.findByEmail(username.trim());

		if (account != null) {
			// Nếu đăng nhập thành công --> Lưu tài khoản trên Session và Cookie

			HttpSession session = req.getSession(true);
			session.setAttribute("account", account);

			// Nếu có chọn "Nhớ mật khẩu" thì lưu username và password vào cookie
			if (isRememberMe) {
				saveRememberMe(resp, username);
			}

			resp.sendRedirect(req.getContextPath() + "/login/waiting");
		} else {
			// Tài khoản hoặc mật khẩu không đúng --> báo lỗi sai tài khoản - mật khẩu
			alertMsg = "Tài khoản hoặc mật khẩu không đúng:" 
//			+username + "-" +password +"<br>" 
			+ accountInfo.getEmail() + "-" +accountInfo.getPasswd();
			req.setAttribute("alert", alertMsg);
			req.getRequestDispatcher("/views/web/login-page.jsp").forward(req, resp);
		}
	}
	
	private void loginSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	private void saveRememberMe(HttpServletResponse resp, String username) throws ServletException, IOException {		
		
		//Lưu username trên cookie
		Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, username);
		
		//set thời gian hết hạn của cookie là 5 ngày
		cookie.setMaxAge(5*24*60*60); 
		
		//Thêm cookie vào resp
		resp.addCookie(cookie);
		
	}
	

}
