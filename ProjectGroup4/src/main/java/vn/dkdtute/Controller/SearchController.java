package vn.dkdtute.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.LinkedTransferQueue;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.dkdtute.Model.Topic;
import vn.dkdtute.Model.Users;
import vn.dkdtute.Service.ITopicService;
import vn.dkdtute.Service.IUsersService;
import vn.dkdtute.Service.Impl.TopicServiceImpl;
import vn.dkdtute.Service.Impl.UsersServiceImpl;
import vn.dkdtute.Util.Constant;

/**
 * Servlet implementation class SearchController
 */
@WebServlet(urlPatterns = { "/search", "/search/searching" })
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IUsersService usersService = new UsersServiceImpl();
	ITopicService topicService = new TopicServiceImpl();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		String url = req.getRequestURL().toString();
		// Chuyển đến trang nhập thông tin tìm kiếm
		if (url.endsWith("search")) {
			req.getRequestDispatcher("/views/web/search/search-enter.jsp").forward(req, resp);
		}
		// Xử lí kết quả tìm kiếm
		else if (url.contains("searching")) {
			Searching(req, resp);
		}

	}

	private void Searching(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// Set số item mỗi trang
		int ItemsPerPage = 5;

		// Set tổng số trang hiển thị trên view
		int PagesDisplay = 5;

		// Lấy dữ liệu từ view
		String choice = req.getParameter("choice");
		String keyword = req.getParameter("search_keyword");
		String indexPage = req.getParameter("index");
		
		HttpSession session = req.getSession();
		Users users = (Users) session.getAttribute("account");

		/* Phân trang */

		// Đếm tổng số items
		int totalItems = 0;

		if ("student".equals(choice)) {
			totalItems = usersService.CountStudentByKeyword(keyword);
		}
		else if ("lecturer".equals(choice)) {
			totalItems = usersService.CountLectByKeyword(keyword);
		}
		
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
		List<Users> userList = new ArrayList<Users>();
		if (choice.equals("student")){
			userList = usersService.findStudent(keyword, (index-1)*ItemsPerPage, ItemsPerPage);
		}
		else if (choice.equals("lecturer")) {
			userList = usersService.findLecturer(keyword, (index-1)*ItemsPerPage, ItemsPerPage);
		}	
		
		/* Phân trang */

		System.out.println(userList);
		System.out.println(totalItems);
		System.out.println();
		System.out.println();
		
		
		// Truyền dữ liệu lên view
		req.setAttribute("index", index);
		req.setAttribute("startPage", head);
		req.setAttribute("endPage", tail);
		req.setAttribute("lastPage", lastPage);
		req.setAttribute("choice", choice);
		req.setAttribute("keyword", keyword);
		
		if("student".equals(choice) || "lecturer".equals(choice)) {
			req.setAttribute("list", userList);
		}
		
		req.setAttribute("userList", userList);

		 
		req.getRequestDispatcher("/views/web/search/search-user-list.jsp").forward(req, resp);

		// Trả kết quả về view và chuyển đến trang hiển thị danh sách
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
