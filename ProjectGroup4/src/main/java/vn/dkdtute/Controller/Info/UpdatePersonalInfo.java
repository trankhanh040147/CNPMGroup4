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
 * Servlet implementation class UpdatePersonalInfo
 */
@WebServlet(urlPatterns = {"/student/updInfo", "/lect/updInfo"})
public class UpdatePersonalInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IUsersService usersService = new UsersServiceImpl();
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		Users users = (Users) session.getAttribute("account");
		users.setFullname(req.getParameter("fullName")); 
		users.setMajor(req.getParameter("major")); 
		users.setEmail(req.getParameter("email")); 
		users.setPhone(req.getParameter("phone")); 
		
		usersService.edit(users);
		
		if (users.getRoleid() == 3) {
			resp.sendRedirect(req.getContextPath() + "/student/info");
		} else if(users.getRoleid() == 2) {
			resp.sendRedirect(req.getContextPath() + "/lect/info");
		}
	}

}
