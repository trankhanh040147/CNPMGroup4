package vn.dkdtute.Service.Impl;

import java.io.File;
import java.util.List;

import vn.dkdtute.Dao.IUsersDao;
import vn.dkdtute.Dao.Impl.UsersDaoImpl;
import vn.dkdtute.Service.IUsersService;
import vn.dkdtute.Util.Constant;
import vn.dkdtute.Model.Users;

public class UsersServiceImpl implements IUsersService {
	IUsersDao userDao = new UsersDaoImpl();

	@Override
	public Users findByID(String userid) {
		return userDao.findByID(userid);
	}

	@Override
	public Users findByEmail(String email) {
		return userDao.findByEmail(email);
	}

	@Override
	public Users login(String email, String passwd) {
		return userDao.login(email, passwd);
	}

	@Override
	public void edit(Users newUserInfo) {
		Users oldUserInfo = userDao.findByID(newUserInfo.getUserid());
		oldUserInfo.setFullname(newUserInfo.getFullname());
		if (newUserInfo.getAvatar() != null) {
			// XOA ANH CU DI
			String fileName = oldUserInfo.getAvatar();
			final String dir = Constant.DIR;
			File file = new File(dir + "/avatar" + fileName);
			if (file.exists()) {
				file.delete();
			}
			oldUserInfo.setAvatar(newUserInfo.getAvatar());
		}
		userDao.edit(oldUserInfo);
		
//		userDao.edit(newUserInfo);
	}

	@Override
	public String findName(String Id) {
		return userDao.findName(Id);
	}

	@Override
	public void insert(Users user) {
		userDao.insert(user);
	}

	@Override
	public void delete(String userid) {
		userDao.delete(userid);
	}

	@Override
	public void adminEdit(Users user) {
		userDao.adminEdit(user);
	}


	@Override
	public List<Users> findStudent(String infoStudent, int index, int pagesize) {
		return userDao.findStudent(infoStudent, index, pagesize);
	}

	@Override
	public List<Users> findLecturer(String infoLecturer, int index, int pagesize) {
		return userDao.findLecturer(infoLecturer, index, pagesize);
	}

	@Override
	public int CountStudentByKeyword(String keyword) {
		return userDao.CountStudentByKeyword(keyword);
	}

	@Override
	public int CountLectByKeyword(String keyword) {
		return userDao.CountLectByKeyword(keyword);
	}

	@Override
	public int countAll() {
		return userDao.countAll();
	}

	@Override
	public List<Users> findAll(int index, int pagesize) {
		return userDao.findAll(index, pagesize);
	}

}