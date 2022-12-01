package vn.dkdtute.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vn.dkdtute.Connections.ConnectJDBC;
import vn.dkdtute.dao.IUsersDao;
import vn.dkdtute.model.Users;

public class UsersDaoImpl extends ConnectJDBC implements IUsersDao {

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
	public void edit(Users user) {
		String sql = "Update Users Set fullname=?, email=?, phone=?, avatar=?, passwd=?, major=?, roleid=? WHERE userid=?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getFullname());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhone());
			ps.setString(4, user.getAvatar());
			ps.setString(5, user.getPasswd());
			ps.setString(6, user.getMajor());
			ps.setByte(7, user.getRoleid());
			ps.setString(8, user.getUserid());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
