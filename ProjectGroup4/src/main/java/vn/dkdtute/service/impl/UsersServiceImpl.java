package vn.dkdtute.Service.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vn.dkdtute.Connections.ConnectJDBC;
import vn.dkdtute.Service.IUsersService;
import vn.dkdtute.Model.Users;

public class UsersServiceImpl implements IUsersService {

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
				users.setUsername(rs.getString("username"));
				users.setEmail(rs.getString("email"));
				users.setPhone(rs.getString("phone"));
				users.setAvatar(rs.getString("avatar"));
				users.setPasswd(rs.getString("passwd"));
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
				users.setUsername(rs.getString("username"));
				users.setEmail(rs.getString("email"));
				users.setPhone(rs.getString("phone"));
				users.setAvatar(rs.getString("avatar"));
				users.setPasswd(rs.getString("passwd"));
				users.setRoleid(rs.getByte("roleid"));
				return users;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
