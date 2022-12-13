package vn.dkdtute;

import java.nio.file.Path;
import java.nio.file.Paths;
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
		Path currentRelativePath = Paths.get("");
		String s = currentRelativePath.toAbsolutePath().toString();
		System.out.println("Current absolute path is: " + Constant.DIR);
	}

}
