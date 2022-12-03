package vn.dkdtute.Login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
		
		//Điều hướng về trang chủ cho khách
		resp.sendRedirect(req.getContextPath() + "/guest/home");
	}

}
