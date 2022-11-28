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
@WebServlet(urlPatterns = { "/home"})
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		RequestDispatcher dispatcher = request.getRequestDispatcher("table.jsp");
	    resp.setContentType("text/html; charset=UTF-8");
		String url = req.getRequestURL().toString();
	    if (url.contains("home")) {
			req.getRequestDispatcher("views/web/index.jsp").forward(req, resp);
		}
		if (url.contains("userInfo")) {
			req.getRequestDispatcher("views/web/user.jsp").forward(req, resp);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
