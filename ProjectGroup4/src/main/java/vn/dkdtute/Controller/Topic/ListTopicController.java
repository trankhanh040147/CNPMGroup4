package vn.dkdtute.Controller.Topic;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.LinkedTransferQueue;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.modeler.modules.ModelerSource;

import com.opensymphony.module.sitemesh.Page;

import vn.dkdtute.Dao.ITopicDao;
import vn.dkdtute.Model.Topic;
import vn.dkdtute.Service.ITopicService;
import vn.dkdtute.Service.Impl.TopicServiceImpl;
import vn.dkdtute.Util.Constant;

/**
 * Servlet implementation class ListTopi
 */
@WebServlet(urlPatterns = {"/topic-type", "/topic-list", "/topic-detail"})
public class ListTopicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ITopicService topicService = new TopicServiceImpl();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		String url = req.getRequestURL().toString(); 

	    //Xử lí trang chọn loại đề tài
	    if (url.contains("topic-type")) {
			req.getRequestDispatcher("/views/web/topic/topic-type.jsp").forward(req, resp);
		}
	 
	    //Xử lí trang hiện danh sách đề tài
	    else if (url.contains("topic-list")) 
	    	ListTopic(req, resp);
	    
	  	//Xử lí trang hiện chi tiết đề tài
	    else if (url.contains("topic-detail")){
			TopicDetail(req, resp);
		} 
	    
	}


	private void ListTopic(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//Set số item mỗi trang
		int ItemsPerPage = 5;
		
		//Set tổng số trang hiển thị trên view
		int PagesDisplay = 5;
		
		//Lấy dữ liệu từ view
		int topicTypeId = Integer.parseInt(req.getParameter("topicType"));
		String indexPage = req.getParameter("index");
				
		/* Phân trang */
		
		//Đếm tổng số items
		int totalItems = topicService.countTopic(Constant.topicType_name[topicTypeId], Constant.topicType_year[topicTypeId]);
				
		// Xử lứ trường hợp không truyền vào index
		if (indexPage == null) {
			indexPage = "1";
		}	
		int index =Integer.parseInt(indexPage);
		
		//Xử lí trường hợp chọn nút >> (Trang cuối cùng)
		if (index == -1) {
			index = totalItems / ItemsPerPage;
			totalItems = totalItems % 3 != 0 ? totalItems+1 : totalItems;
		}
		
		//Tìm trang cuối cùng của toàn bộ danh sách items
		int lastPage = totalItems / ItemsPerPage + (totalItems % ItemsPerPage != 0 ? 1 : 0);
		
		//Xác định trang đầu (head) và trang cuối (tail)
		int head = index - PagesDisplay/2;
		int tail = index + PagesDisplay/2;
		head = head >= 1 ? head : 1;
		tail = tail <= lastPage ? tail : lastPage;
		head = tail - PagesDisplay + 1  >= 1 ? tail - PagesDisplay + 1 : head;
		tail = head + PagesDisplay - 1 <= lastPage ? head + PagesDisplay - 1 : tail;
		
		//Lấy dữ liệu theo số trang
		List<Topic> topicList = topicService.get(Constant.topicType_name[topicTypeId], Constant.topicType_year[topicTypeId], (index-1)*ItemsPerPage, ItemsPerPage);
		
		/* Phân trang */
		
		//Truyền dữ liệu lên view
		req.setAttribute("index", index);
		req.setAttribute("startPage", head);
		req.setAttribute("endPage", tail);
		req.setAttribute("lastPage", lastPage);
		req.setAttribute("topicList", topicList);
		req.setAttribute("topicType", topicTypeId);
		req.getRequestDispatcher("/views/web/topic/topic-list.jsp").forward(req, resp);
	}
	
	private void TopicDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Lấy dữ liệu từ view
		int topicId = Integer.parseInt(req.getParameter("topicId"));
		
		//Lấy dữ liệu từ db
		Topic topic = topicService.get(topicId);
		
		//Truyền dữ liệu lên view
		req.setAttribute("topic", topic);
		req.getRequestDispatcher("/views/web/topic/topic-detail.jsp").forward(req, resp);
	}

}
