package vn.dkdtute.Controller.Topic;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.dkdtute.Dao.ITopicDao;
import vn.dkdtute.Model.Topic;
import vn.dkdtute.Service.ITopicService;
import vn.dkdtute.Service.Impl.TopicServiceImpl;

/**
 * Servlet implementation class ListTopi
 */
@WebServlet(urlPatterns = {"/topicType-list", "/topic-list", "/topic-detail"})
public class ListTopic extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ITopicService topicService = new TopicServiceImpl();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		String url = req.getRequestURL().toString(); 

	    //Xử lí trang chọn loại đề tài
	    if (url.contains("topicType-list")) {
			req.getRequestDispatcher("/views/web/topic/topicType-list.jsp").forward(req, resp);
		}
	    
	    //Xử lí trang hiện danh sách đề tài
	    else if (url.contains("topic-list")) 
	    	ListTopic(req, resp);
	    
//	  	//Xử lí trang hiện chi tiết đề tài
//	    else if (url.contains("topic-detail")){
//			req.getRequestDispatcher("/views/web/index.jsp").forward(req, resp);
//		} 

	}

	private void ListTopic(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/web/topic/topic-list.jsp").forward(req, resp);
		
		int topicTypeId = Integer.parseInt(req.getParameter("topicType"));
		
		List<Topic> topicList = topicService.get(, 0);
		
	}

}
