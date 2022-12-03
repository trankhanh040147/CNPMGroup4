package vn.dkdtute.Controller.Info;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.dkdtute.Model.Users;
import vn.dkdtute.Service.IUsersService;
import vn.dkdtute.Service.Impl.UsersServiceImpl;

/**
 * Servlet implementation class UpdatePassword
 */
@WebServlet(urlPatterns = {"/student/updPass", "/lect/updPass"})
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IUsersService usersService = new UsersServiceImpl();
	Users users = new Users();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		HttpSession session = req.getSession(false);
		
		users = (Users) session.getAttribute("account");
		
		String oldPass = req.getParameter("oldPass");
		String newPass = req.getParameter("newPass");
		String newPassConfirm = req.getParameter("newPassConfirm");
		
//		if(newPass != newPassConfirm) {
//			req.setAttribute("alert", "Mật khẩu mới không khớp nhau!");
//			showInfoPage(req, resp);
//			return;
//		}
//		
//		if(newPass == oldPass) {
//			req.setAttribute("alert", "Mật khẩu mới và mật khẩu cũ không được giống nhau!");
//			showInfoPage(req, resp);
//			return;
//		}
		
		users.setPasswd(newPass);;
		usersService.edit(users);
		showInfoPage(req, resp);
	}
	
	private void showInfoPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (users.getRoleid() == 3) {
			resp.sendRedirect(req.getContextPath() + "/student/info");
		} else if (users.getRoleid() == 2) {
			resp.sendRedirect(req.getContextPath() + "/lect/info");
		}
	}

}
