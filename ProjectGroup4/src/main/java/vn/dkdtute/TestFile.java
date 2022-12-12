package vn.dkdtute;

import java.util.List;

import vn.dkdtute.Dao.ITopicDao;
import vn.dkdtute.Dao.Impl.TopicDaoImpl;
import vn.dkdtute.Model.Topic;
import vn.dkdtute.Model.Users;
import vn.dkdtute.Service.IUsersService;
import vn.dkdtute.Service.Impl.UsersServiceImpl;
import vn.dkdtute.Util.Constant;

public class TestFile {

	public static void main(String[] args) {
		IUsersService usersService = new UsersServiceImpl();
		
		System.out.println(usersService.findLecturer("t",0,99));
	}

}
