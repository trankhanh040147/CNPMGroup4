package vn.dkdtute.Controller.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.dkdtute.Model.Topic;
import vn.dkdtute.Model.Users;
import vn.dkdtute.Service.IUsersService;
import vn.dkdtute.Service.Impl.UsersServiceImpl;
import vn.dkdtute.Util.Constant;

/**
 * Servlet implementation class AccountController
 */
@WebServlet(urlPatterns = { "/account", "/account/add" })
public class AccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IUsersService usersService = new UsersServiceImpl();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		String url = req.getRequestURL().toString();

		// Xử lí trang hiển thị danh sách đăng ký đề tài
		if (url.endsWith("account")) {
			ListAccount(req, resp);
		}
	}

	private void ListAccount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Set số item mỗi trang
		int ItemsPerPage = 5;

		// Set tổng số trang hiển thị trên view
		int PagesDisplay = 5;

		// Lấy dữ liệu từ view
		String indexPage = req.getParameter("index");

		/* Phân trang */

		// Đếm tổng số items
		int totalItems = usersService.countAll();

		// Xử lứ trường hợp không truyền vào index
		if (indexPage == null) {
			indexPage = "1";
		}
		int index = Integer.parseInt(indexPage);

		// Xử lí trường hợp chọn nút >> (Trang cuối cùng)
		if (index == -1) {
			index = totalItems / ItemsPerPage;
			totalItems = totalItems % 3 != 0 ? totalItems + 1 : totalItems;
		}

		// Tìm trang cuối cùng của toàn bộ danh sách items
		int lastPage = totalItems / ItemsPerPage + (totalItems % ItemsPerPage != 0 ? 1 : 0);

		// Xác định trang đầu (head) và trang cuối (tail)
		int head = index - PagesDisplay / 2;
		int tail = index + PagesDisplay / 2;
		head = head >= 1 ? head : 1;
		tail = tail <= lastPage ? tail : lastPage;
		head = tail - PagesDisplay + 1 >= 1 ? tail - PagesDisplay + 1 : head;
		tail = head + PagesDisplay - 1 <= lastPage ? head + PagesDisplay - 1 : tail;

		// Lấy dữ liệu theo số trang
		List<Users> usersList =usersService.findAll((index - 1) * ItemsPerPage, ItemsPerPage);
		
		/* Phân trang */

		// Truyền dữ liệu lên view
		req.setAttribute("index", index);
		req.setAttribute("startPage", head);
		req.setAttribute("endPage", tail);
		req.setAttribute("lastPage", lastPage);
		req.setAttribute("list", usersList);
		
		req.getRequestDispatcher("/views/admin/account/account-list.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
