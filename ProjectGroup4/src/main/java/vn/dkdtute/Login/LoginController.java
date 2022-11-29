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
@WebServlet(urlPatterns = { "/login/show", "/login/check" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		String url = req.getRequestURL().toString();

		// Xử lí các patterns
		if (url.contains("login/show")) {
			loginShow(req, resp);
		} else if (url.contains("login/check")) {
			loginCheck(req, resp);
		}
		else if (url.contains("login/wating")) {
			loginWaiting(req, resp);
		}
	}
	

	protected void loginShow(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Chuyến đến form đăng nhập khi click vào nút đăng nhập
		req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
	}
		
	protected void loginCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Xử lí check tài khoản trên session và cookie
		HttpSession session = req.getSession(false);

		// Nếu đã có session "account" thì chuyển sang pattern waiting
		if (session != null && session.getAttribute("account") != null) {
			resp.sendRedirect(req.getContextPath() + "/waiting");
			return;
		}
		
		//Nếu không có session thì bắt đầu kiểm tra cookie
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for(Cookie cookie:cookies) {
				if(cookie.getName().equals("username")) {
					session = req.getSession(true);
					session.setAttribute("username", cookie.getValue());
					resp.sendRedirect(req.getContextPath() + "/waiting");
					return;
				}
			}
		}
		
		loginShow(req, resp);
	}
	
	private void loginWaiting(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String username =req.getParameter("username");
		String password = req.getParameter("password");
		boolean isRememberMe = false;
		String remember = req.getParameter("remember");
		
		if("on".equals(remember)) {
			isRememberMe = true;
		}
		
		String alertMsg = "";
		
		//Nếu username hoặc password để trống
		if(username.isEmpty() || password.isEmpty()) {
			alertMsg = "Tài khoản hoặc mật khẩu không được rỗng";
			req.setAttribute("alert", alertMsg);
			req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
			return;
		}
		
		//Gọi service và kiểm tra thông tin tài khoản, mật khẩu
		
		IUsersService service = new UsersServiceImpl();
		/*
		 * Users account = service.login(username, password);
		 */		
		/*
		 * if(account!=null) { //Nếu đăng nhập thành công --> Lưu tài khoản trên Session
		 * và Cookie HttpSession session = req.getSession(true);
		 * session.setAttribute("account", account);
		 * 
		 * if(isRememberMe) { saveRememberMe(resp, username); }
		 * 
		 * resp.sendRedirect(req.getContextPath()+"/waiting"); } else { //Tài khoản hoặc
		 * mật khẩu không đúng --> báo lỗi sai tài khoản - mật khẩu alertMsg =
		 * "Tài khoản hoặc mật khẩu không đúng"; req.setAttribute("alert", alertMsg);
		 * req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp); }
		 */
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
