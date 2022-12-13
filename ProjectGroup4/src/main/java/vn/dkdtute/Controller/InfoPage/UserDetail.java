package vn.dkdtute.Controller.InfoPage;

import java.io.IOException;
import java.nio.file.attribute.UserPrincipalLookupService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.dkdtute.Model.Topic;
import vn.dkdtute.Model.Users;
import vn.dkdtute.Service.IUsersService;
import vn.dkdtute.Service.Impl.UsersServiceImpl;

/**
 * Servlet implementation class UserDetail
 */
@WebServlet("/userDetail")
public class UserDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IUsersService usersService = new UsersServiceImpl();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// Lấy dữ liệu từ view
		String userId = req.getParameter("userid");

		// Lấy dữ liệu từ db
		Users users = usersService.findByID(userId);

		// Truyền dữ liệu lên view
		req.setAttribute("account", users);
		req.getRequestDispatcher("/views/web/account/user-detail.jsp").forward(req, resp);
	}

}
