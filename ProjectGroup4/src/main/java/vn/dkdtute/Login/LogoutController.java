package vn.dkdtute.Login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutController
 */
@WebServlet("/logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Xoá session tài khoản hiện tại
		HttpSession session = req.getSession(false);
		session.setAttribute("account", null);
		
		//Xoá cookie tài khoản hiện tại
		Cookie[] theCookie = req.getCookies();
		for (Cookie cookie : theCookie) {
			if(cookie.getName().equals("username")) {
				cookie.setValue("");
				cookie.setMaxAge(0);
				resp.addCookie(cookie);
			}
		}
		
		//Điều hướng về trang chủ cho khách
		resp.sendRedirect(req.getContextPath() + "/home");
	}

}
