package vn.dkdtute.Controller;

import java.io.IOException;

import javax.lang.model.element.ModuleElement.UsesDirective;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.dkdtute.Model.Users;
import vn.dkdtute.Util.Constant;

/**
 * Servlet implementation class HomeController
 */
@WebServlet(urlPatterns = {"/home", "/guest/home", "/student/home", "/lect/home", "/head-lect/home", "/admin/home" })
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    resp.setContentType("text/html; charset=UTF-8");
		String url = req.getRequestURL().toString(); 
		
		HttpSession session = req.getSession();
		Users account = (Users) session.getAttribute("account");
				
	    //Trang chủ cho sinh viên
	    if (url.contains("student/home")) {
			Constant.setAlert(req, resp, "success", "Xin chào mừng trở về trang chủ, " + account.getFullname() + "!");
			req.getRequestDispatcher("/views/web/index.jsp").forward(req, resp);
		}
	    
	    //Trang chủ cho giảng viên
	    else if (url.contains("lect/home")) {
			Constant.setAlert(req, resp, "success", "Xin chào mừng trở về trang chủ, " + account.getFullname() + "!");
	    	req.getRequestDispatcher("/views/web/index.jsp").forward(req, resp);
	    }
	  //Trang chủ cho khách (bất kỳ url nào khác)
	    else {
			Constant.setAlert(req, resp, "success", "Chào mừng bạn đến với trang đăng ký đề tài DKDTUTE!");
	    	req.getRequestDispatcher("/views/web/index.jsp").forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
