package vn.dkdtute.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ErrorController
 */
@WebServlet("/error")
public class ErrorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    resp.setContentType("text/html; charset=UTF-8");
		req.getRequestDispatcher("views/web/error.jsp").forward(req, resp);

	}

}
