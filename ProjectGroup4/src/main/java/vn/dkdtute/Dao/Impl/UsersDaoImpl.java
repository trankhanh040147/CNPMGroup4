package vn.dkdtute.Dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.dkdtute.Connections.ConnectJDBC;
import vn.dkdtute.Dao.IUsersDao;
import vn.dkdtute.Model.Topic;
import vn.dkdtute.Model.Users;

public class UsersDaoImpl extends ConnectJDBC implements IUsersDao {

	@Override
	public Users findByID(String userid) {
		String sql = "Select * From Users where userid=?";
		try {
			Connection conn = super.getConnection();
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
			Connection conn = super.getConnection();
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
			Connection conn = super.getConnection();
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
//				if (passwd == users.getPasswd()) {
//					return users;
//				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

//	 Chức năng thay đổi thông tin tài khoản của giảng viên và sinh viên
	@Override
	public void edit(Users newUserInfo) {
		String sql = "Update Users Set fullname=?, email=?, phone=?, avatar=?, passwd=? WHERE userid=?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newUserInfo.getFullname());
			ps.setString(2, newUserInfo.getEmail());
			ps.setString(3, newUserInfo.getPhone());
			ps.setString(4, newUserInfo.getAvatar());
			ps.setString(5, newUserInfo.getPasswd());
			ps.setString(6, newUserInfo.getUserid());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	// Chức năng chỉnh sửa thông tin tài khoản user của admin
	@Override
	public void adminEdit(Users user) {

		String sql = "Update Users Set fullname=?, email=?, phone=?, avatar=?, passwd=?, major=?, roleid=? Where userid=?,"
				+ "Where userid=?";
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

	@Override
	public String findName(String Id) {
		String sql = "Select * From Users where userid=?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, Id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String Name = rs.getString("fullname");
				return Name;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void insert(Users user) {
		String sql = "Insert Into Users(userid, fullname, email, phone, avatar, passwd, major, roleid) values "
				+ "(?,?,?,?,?,?,?,?)";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUserid());
			ps.setString(2, user.getFullname());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getPhone());
			ps.setString(5, user.getAvatar());
			ps.setString(6, user.getPasswd());
			ps.setString(7, user.getMajor());
			ps.setByte(8, user.getRoleid());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(String userid) {
		String sql = "Delete * FROM Users WHERE userid = ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Users> findStudent(String infoStudent, int index, int pagesize) {
		List<Users> users = new ArrayList<Users>();
		String sql = "Select * from Users where roleid = 3  and \n"
				+ "				 (userid like (?) or fullname like (?) or \n"
				+ "				 email like (?) or  phone like (?) or major like (?))\n"
				+ "				 ORDER BY fullname asc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+infoStudent+"%");
			ps.setString(2, "%"+infoStudent+"%");
			ps.setString(3, "%"+infoStudent+"%");
			ps.setString(4, "%"+infoStudent+"%");
			ps.setString(5, "%"+infoStudent+"%");
			ps.setInt(6, index);
			ps.setInt(7, pagesize);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Users user = new Users();
				user.setUserid(rs.getString("userid"));
				user.setFullname(rs.getString("fullname"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setAvatar(rs.getString("avatar"));
				user.setPasswd(rs.getString("passwd"));
				user.setMajor(rs.getString("major"));
				user.setRoleid(rs.getByte("roleid"));
				users.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}

	@Override
	public List<Users> findLecturer(String infoLecturer, int index, int pagesize) {
		List<Users> users = new ArrayList<Users>();
		String sql = "Select * from Users where roleid = 1 or roleid = 2  and \n"
				+ "				 (userid like (?) or fullname like (?) or \n"
				+ "				 email like (?) or  phone like (?) or major like (?))\n"
				+ "				 ORDER BY fullname asc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+infoLecturer+"%");
			ps.setString(2, "%"+infoLecturer+"%");
			ps.setString(3, "%"+infoLecturer+"%");
			ps.setString(4, "%"+infoLecturer+"%");
			ps.setString(5, "%"+infoLecturer+"%");
			ps.setInt(6, index);
			ps.setInt(7, pagesize);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Users user = new Users();
				user.setUserid(rs.getString("userid"));
				user.setFullname(rs.getString("fullname"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setAvatar(rs.getString("avatar"));
				user.setPasswd(rs.getString("passwd"));
				user.setMajor(rs.getString("major"));
				user.setRoleid(rs.getByte("roleid"));
				users.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}

	public String submitTopic(String link) {
		return link;
	}


	@Override
	public int CountStudentByKeyword(String keyword) {
		String sql = "Select count(*) as 'totaluser' From Users where roleid = 3  and \n"
				+ "				 (userid like (?) or fullname like (?) or \n"
				+ "				 email like (?) or  phone like (?) or major like (?))";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+keyword+"%");
			ps.setString(2, "%"+keyword+"%");
			ps.setString(3, "%"+keyword+"%");
			ps.setString(4, "%"+keyword+"%");
			ps.setString(5, "%"+keyword+"%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt("totaluser");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int CountLectByKeyword(String keyword) {
		String sql = "Select count(*) as 'totaluser' From Users where roleid = 1 or roleid = 2  and \n"
				+ "				 (userid like (?) or fullname like (?) or \n"
				+ "				 email like (?) or  phone like (?) or major like (?))";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+keyword+"%");
			ps.setString(2, "%"+keyword+"%");
			ps.setString(3, "%"+keyword+"%");
			ps.setString(4, "%"+keyword+"%");
			ps.setString(5, "%"+keyword+"%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt("totaluser");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}