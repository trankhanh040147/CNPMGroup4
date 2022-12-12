package vn.dkdtute.Controller.Student;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.LinkedTransferQueue;

import javax.security.auth.message.MessagePolicy.TargetPolicy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.dkdtute.Model.Topic;
import vn.dkdtute.Model.Users;
import vn.dkdtute.Service.ITopicService;
import vn.dkdtute.Service.Impl.TopicServiceImpl;
import vn.dkdtute.Util.Constant;

/**
 * Servlet implementation class RegisterTopic
 */
@WebServlet(urlPatterns = {"/regTopic/list", "/regTopic/reg"})
public class RegisterTopic extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ITopicService topicService = new TopicServiceImpl();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		String url = req.getRequestURL().toString(); 
				
	    //Xử lí trang hiển thị danh sách đăng ký đề tài
	    if (url.endsWith("list")) {
	    	ListTopic(req,resp);
		}
	    //Xử lí đăng ký đề tài
	    else if (url.contains("regTopic/reg")) 
	    	RegTopic(req,resp);
	    
	}

	//Đăng ký đề tài
	private void RegTopic(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//Lấy dữ liệu từ view
		int topicId = Integer.parseInt(req.getParameter("topicId"));
		
		HttpSession session = req.getSession();
		Users student = (Users) session.getAttribute("account");
		
		//Lấy dữ liệu của đề tài
		Topic topic = topicService.get(topicId);
		
		//Kiểm tra đề tài đã đủ thành viên chưa
		if(topic.getLeaderid() != null && topic.getMemberid() != null) {
			Constant.setAlert(req, resp, "error", "Đề tài đã đủ số lượng thành viên đăng ký");
			req.getRequestDispatcher("/regTopic/list").forward(req, resp);
			return;
		}
		
		//Kiểm tra đề tài đã được chấm chưa
		if(topic.getTopicscore() != 0) {
			Constant.setAlert(req, resp, "error", "Đề tài đã được chấm điểm");
			req.getRequestDispatcher("/regTopic/list").forward(req, resp);
			return;
		}
		
		//Kiểm tra đề tài có đang được phản biện hay không
		if(topic.getCriticalid() != null) {
			Constant.setAlert(req, resp, "error", "Đề tài đang được phản biện");
			req.getRequestDispatcher("/regTopic/list").forward(req, resp);
			return;
		}
		
		//Kiểm tra xem sinh viên có đang thực hiện một đề tài nào khác không 
		List<Topic> topicList = topicService.findAll(0, 200);
		for (Topic tp : topicList) {
			if(tp.getLeaderid()!=null && tp.getMemberid()!=null) {
				if(tp.getLeaderid().equals(student.getUserid()) || tp.getMemberid().equals(student.getUserid())) {
					Constant.setAlert(req, resp, "error", "Sinh viên đang thực hiện một đề tài khác!");
					req.getRequestDispatcher("/regTopic/list").forward(req, resp);
					return;
				}
			}
		}
		
		//Đăng ký đề tài nếu đề tài hợp lệ
		topicService.register(student.getUserid(),topicId);
		Constant.setAlert(req, resp, "success", "Đăng ký đề tài thành công!");
		
		req.getRequestDispatcher("/regTopic/list").forward(req, resp);
			}

	private void ListTopic(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Set số item mỗi trang
		int ItemsPerPage = 5;

		// Set tổng số trang hiển thị trên view
		int PagesDisplay = 5;

		// Lấy dữ liệu tài khoản sinh viên từ session để lọc danh sách đề tài
		HttpSession session = req.getSession();
		Users student = (Users) session.getAttribute("account");
		String indexPage = req.getParameter("index");

		/* Phân trang */

		// Đếm tổng số items
		int totalItems = topicService.countByStudentInfo(student);

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
		List<Topic> topicList = topicService.findByStudentInfo(student, (index - 1) * ItemsPerPage, ItemsPerPage);

		/* Phân trang */

		// Truyền dữ liệu lên view
		req.setAttribute("index", index);
		req.setAttribute("startPage", head);
		req.setAttribute("endPage", tail);
		req.setAttribute("lastPage", lastPage);
		req.setAttribute("topicList", topicList);
		req.getRequestDispatcher("/views/student/reg-listTopic.jsp").forward(req, resp);

	}


}
