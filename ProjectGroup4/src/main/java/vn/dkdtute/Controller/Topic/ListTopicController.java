package vn.dkdtute.Controller.Topic;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.LinkedTransferQueue;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.modeler.modules.ModelerSource;

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
		
		//Lấy dữ liệu từ view
		int topicTypeId = Integer.parseInt(req.getParameter("topicType"));
		
		//Lấy dữ liệu từ database
		List<Topic> topicList = topicService.get(Constant.topicType_name[topicTypeId], Constant.topicType_year[topicTypeId]);
				
		/* Phân trang */
		
		/* Phân trang */
		
		//Truyền dữ liệu lên view		
		req.setAttribute("topicList", topicList);
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
