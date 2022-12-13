package vn.dkdtute.Util;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Constant {
	static String dir = Paths.get("").toAbsolutePath().toString();
	
	public static final String SESSION_USERNAME = "username";
	public static final String COOKIE_REMEMBER = "username";
	
//	public static final String DIR = dir+"\\upload\\img\\DKDTUTE";
	public static final String DIR = "D:\\upload\\img\\DKDTUTE";

	
	public static final String[] topicType_name = {"Tiểu luận chuyên ngành","Khóa luận tốt nghiệp","Tiểu luận chuyên ngành","Khóa luận tốt nghiệp"};
	public static final Integer[] topicType_year = {2018, 2018, 2019, 2019};

	public static void setAlert(HttpServletRequest req, HttpServletResponse resp, String alertType, String cmt) {
		if (alertType == "success") {
			req.setAttribute("alertType", 2);
			req.setAttribute("alert", cmt);
			req.setAttribute("alertIcon", "ti-check");
		} else if (alertType == "warning") {
			req.setAttribute("alertType", 3);
			req.setAttribute("alert", cmt);
			req.setAttribute("alertIcon", "ti-na");
		} else if (alertType == "error") {
			req.setAttribute("alertType", 4);
			req.setAttribute("alert", cmt);
			req.setAttribute("alertIcon", "ti-close");
		} else {
			req.setAttribute("alertType", 5);
			req.setAttribute("alert", cmt);
			req.setAttribute("alertIcon", "ti-info");
		}
	}
	
}

