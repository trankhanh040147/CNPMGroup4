package vn.dkdtute.Controller.InfoPage;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import vn.dkdtute.Model.Users;
import vn.dkdtute.Service.IUsersService;
import vn.dkdtute.Service.Impl.UsersServiceImpl;
import vn.dkdtute.Util.Constant;

/**
 * Servlet implementation class UpdatePersonalInfo
 */
@WebServlet(urlPatterns = {"/student/updInfo", "/lect/updInfo"})

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UpdatePersonalInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IUsersService usersService = new UsersServiceImpl();
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		
		Users users = (Users) session.getAttribute("account");
		
//		users.setFullname(req.getParameter("fullName")); 
//		users.setMajor(req.getParameter("major")); 
//		users.setEmail(req.getParameter("email")); 
//		users.setPhone(req.getParameter("phone")); 
		
		//Cập nhật hình ảnh
		try {
			resp.setContentType("text/html");
			resp.setCharacterEncoding("UTF-8");
			req.setCharacterEncoding("UTF-8");

			// Lấy giá trị các parameter từ request
			String fullName = req.getParameter("fullName");
			String major = req.getParameter("major");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			
			Part part = req.getPart("icon");

//			//Tạo thư mục lưu file nếu chưa tồn tại
//			String realPath = Constant.DIR + "/avatar";
//			
//			if (!Files.exists(Paths.get(realPath))) {
//				Files.createDirectory(Paths.get(realPath));
//			}
//			
//			//Upload file bằng Multipart
//			String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString(); 
//			part.write(realPath + "/" + filename);
			
			//Thêm category vào database
			users.setFullname(fullName);
//			users.setAvatar("avatar/" + filename);
			users.setEmail(email);
			users.setPhone(phone);
			users.setMajor(major);
			usersService.edit(users);
			
			//Chuyển tới trang info
			if (users.getRoleid() == 3) {
				resp.sendRedirect(req.getContextPath() + "/student/info");
			} else if(users.getRoleid() == 2) {
				resp.sendRedirect(req.getContextPath() + "/lect/info");
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}


	private void updateAvatar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

}
