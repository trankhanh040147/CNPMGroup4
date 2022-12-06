package vn.dkdtute.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HomeController
 */
@WebServlet(urlPatterns = {"", "/guest/home", "/student/home", "/lect/home", "/head-lect/home", "/admin/home" })
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    resp.setContentType("text/html; charset=UTF-8");
		String url = req.getRequestURL().toString(); 

	    //Trang chủ cho sinh viên
	    if (url.contains("student/home")) {
			req.getRequestDispatcher("/views/web/index.jsp").forward(req, resp);
		}
	    
	    //Trang chủ cho giảng viên
	    else if (url.contains("lect/home")) {
	    	req.getRequestDispatcher("/views/web/index.jsp").forward(req, resp);
	    }
	  //Trang chủ cho khách (bất kỳ url nào khác)
	    else {
			req.getRequestDispatcher("/views/web/index.jsp").forward(req, resp);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
