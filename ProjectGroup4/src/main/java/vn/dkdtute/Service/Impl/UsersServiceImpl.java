package vn.dkdtute.Service.Impl;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vn.dkdtute.Connections.ConnectJDBC;
import vn.dkdtute.Dao.IUsersDao;
import vn.dkdtute.Dao.Impl.UsersDaoImpl;
import vn.dkdtute.Service.IUsersService;
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
//		Users oldUserInfo = userDao.findByID(newUserInfo.getUserid());
//		oldUserInfo.setFullname(newUserInfo.getFullname());
//		if (newUserInfo.getAvatar() != null) {
//			// XOA ANH CU DI
//			String fileName = oldUserInfo.getAvatar();
//			final String dir = "D:\\uploadCNPM";
//			File file = new File(dir + "/user" + fileName);
//			if (file.exists()) {
//				file.delete();
//			}
//			oldUserInfo.setAvatar(newUserInfo.getAvatar());
//		}
//		userDao.edit(oldUserInfo);
		
		userDao.edit(newUserInfo);
	}

}