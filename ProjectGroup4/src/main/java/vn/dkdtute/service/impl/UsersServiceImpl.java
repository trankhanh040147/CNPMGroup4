package vn.dkdtute.service.impl;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vn.dkdtute.Connections.ConnectJDBC;
import vn.dkdtute.service.IUsersService;
import vn.dkdtute.model.Users;

public class UsersServiceImpl implements IUsersService {
	IUsersService userService = new UsersServiceImpl();

	@Override
	public Users findByID(String userid) {
		String sql = "Select * From Users where userid=?";
		try {
			Connection conn = new ConnectJDBC().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Users users = new Users();
				users.setUserid(rs.getString("userid"));
				users.setFullname(rs.getString("fullname"));
				users.setEmail(rs.getString("email"));
				users.setPhone(rs.getString("phone"));
				users.setAvatar(rs.getString("avatar"));
				users.setPasswd(rs.getString("passwd"));
				users.setMajor(rs.getString("major"));
				;
				users.setRoleid(rs.getByte("roleid"));
				return users;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Users findByEmail(String email) {
		String sql = "Select * From Users where email=?";
		try {
			Connection conn = new ConnectJDBC().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Users users = new Users();
				users.setUserid(rs.getString("userid"));
				users.setFullname(rs.getString("fullname"));
				users.setEmail(rs.getString("email"));
				users.setPhone(rs.getString("phone"));
				users.setAvatar(rs.getString("avatar"));
				users.setPasswd(rs.getString("passwd"));
				users.setMajor(rs.getString("major"));
				users.setRoleid(rs.getByte("roleid"));
				return users;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Users login(String email, String passwd) {
		String sql = "Select * From Users where email=?";
		try {
			Connection conn = new ConnectJDBC().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Users users = new Users();
				users.setUserid(rs.getString("userid"));
				users.setFullname(rs.getString("fullname"));
				users.setEmail(rs.getString("email"));
				users.setPhone(rs.getString("phone"));
				users.setAvatar(rs.getString("avatar"));
				users.setPasswd(rs.getString("passwd"));
				users.setMajor(rs.getString("major"));
				users.setRoleid(rs.getByte("roleid"));
				if (passwd == users.getPasswd()) {
					return users;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void edit(Users newUserInfo) {
		Users oldUserInfo = userService.findByID(newUserInfo.getUserid());
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

		String sql = "Update Users Set fullname=?, email=?, phone=?, avatar=?, passwd=?, major=?, roleid=? WHERE userid=?";
		try {
			Connection conn = new ConnectJDBC().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newUserInfo.getFullname());
			ps.setString(2, newUserInfo.getEmail());
			ps.setString(3, newUserInfo.getPhone());
			ps.setString(4, newUserInfo.getAvatar());
			ps.setString(5, newUserInfo.getPasswd());
			ps.setString(6, newUserInfo.getMajor());
			ps.setByte(7, newUserInfo.getRoleid());
			ps.setString(8, newUserInfo.getUserid());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
