package vn.dkdtute.service.impl;

import java.io.File;
import vn.dkdtute.dao.IUsersDao;
import vn.dkdtute.dao.impl.UsersDaoImpl;
import vn.dkdtute.service.IUsersService;
import vn.dkdtute.model.Users;

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
			final String dir = "D:\\uploadCNPM";
			File file = new File(dir + "/user" + fileName);
			if (file.exists()) {
				file.delete();
			}
			oldUserInfo.setAvatar(newUserInfo.getAvatar());
		}
		userDao.edit(oldUserInfo);
	}
}
