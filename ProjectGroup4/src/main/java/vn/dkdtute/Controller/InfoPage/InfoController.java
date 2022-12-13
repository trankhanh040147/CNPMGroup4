package vn.dkdtute.Controller.InfoPage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.dkdtute.Model.Users;
import vn.dkdtute.Util.Constant;

/**
 * Servlet implementation class InfoControlelr
 */
@WebServlet(urlPatterns = {"/student/info", "/lect/info"})
public class InfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		String url = req.getRequestURL().toString(); 
		
	    //Trang chủ cho sinh viên
		if (url.contains("student/info")) {
			req.getRequestDispatcher("/views/student/info.jsp").forward(req, resp);
		}
	    //Trang chủ cho giảng viên
	    else if (url.contains("lect/info")) {
	    	req.getRequestDispatcher("/views/lect/info.jsp").forward(req, resp);
	    }
	}

}
