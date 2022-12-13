package vn.dkdtute.Controller.Lecturer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.dkdtute.Controller.Student.RegisterTopic;
import vn.dkdtute.Model.Topic;
import vn.dkdtute.Model.Users;
import vn.dkdtute.Service.ITopicService;
import vn.dkdtute.Service.Impl.TopicServiceImpl;
import vn.dkdtute.Util.Constant;

/**
 * Servlet implementation class NewTopic
 */
@WebServlet(urlPatterns = {"/NewTopic/list","/NewTopic/add","/NewTopic/submit"})
public class NewTopic extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ITopicService topicService = new TopicServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 resp.setContentType("text/html; charset=UTF-8");
			String url = req.getRequestURL().toString(); 
			
			HttpSession session = req.getSession();
			
		    if (url.endsWith("list")){
		    	ListNewTopic(req,resp);
			} else if(url.contains("add")){
				req.getRequestDispatcher("/views/lect/NewTopic/new-topic.jsp").forward(req, resp);
			} else if(url.endsWith("submit")) {
				NewTopic(req,resp);
			}
		  
	}

	private void NewTopic(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		//Lấy dữ liệu từ view
		Topic topic = new Topic();
		
		HttpSession session = req.getSession();
		Users lect = (Users) session.getAttribute("account");
		
		topic.setTopicname(req.getParameter("topicName"));
		topic.setTopictarget(req.getParameter("topicTarget"));
		topic.setRequest(req.getParameter("topicRequire"));
		topic.setProduct(req.getParameter("topicProduct"));
		topic.setMajor(req.getParameter("topicMajor"));
		topic.setSchoolyear(Integer.parseInt(req.getParameter("topicYear")));
		topic.setTopictype(req.getParameter("topicType"));
		topic.setInstructorid(lect.getUserid());
		topic.setTopicstatus(false);
		
		//Thêm đề tài vào database
		try {
			topicService.insert(topic);
		} catch (Exception e) {
			Constant.setAlert(req, resp, "error", "Thêm đề tài không thành công!");
			req.getRequestDispatcher("/newTopic/list").forward(req, resp);
			e.printStackTrace();
		} finally {
			//Thông báo thêm thành công và điều hướng về danh sách hàng chờ duyệt
			Constant.setAlert(req, resp, "success", "Thêm đề tài thành công!");
//			resp.sendRedirect(req.getContextPath()+"/newTopic/list");
//			req.getRequestDispatcher("/views/lect/NewTopic/topic-list.jsp").forward(req, resp);
		}
		try {
			
			req.getRequestDispatcher("/NewTopic/list").forward(req, resp);

		} catch (ServletException e) {
			e.printStackTrace();
		}
		
	}

	private void ListNewTopic(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Liệt kê danh sách đề tài được giảng viên hiện tại tạo và chưa được duyệt
		
		// Set số item mỗi trang
		int ItemsPerPage = 5;

		// Set tổng số trang hiển thị trên view
		int PagesDisplay = 5;

		// Lấy dữ liệu tài khoản giảng viên từ session để lọc danh sách đề tài
		HttpSession session = req.getSession();
		Users lect = (Users) session.getAttribute("account");
		String indexPage = req.getParameter("index");

		/* Phân trang */

		// Đếm tổng số items--
		int totalItems = topicService.countByLectCreate(lect);

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
		List<Topic> topicList = topicService.findByLectCreate(lect, (index - 1) * ItemsPerPage, ItemsPerPage);

		/* Phân trang */

		// Truyền dữ liệu lên view
		req.setAttribute("index", index);
		req.setAttribute("startPage", head);
		req.setAttribute("endPage", tail);
		req.setAttribute("lastPage", lastPage);
		req.setAttribute("topicList", topicList);
		
		System.out.println(totalItems);
		
		req.getRequestDispatcher("/views/lect/NewTopic/topic-list.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
	}

}