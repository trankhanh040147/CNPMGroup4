package vn.dkdtute.Dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.dkdtute.Connections.ConnectJDBC;
import vn.dkdtute.Dao.ITopicDao;
import vn.dkdtute.Model.Topic;
import vn.dkdtute.Model.Users;

public class TopicDaoImpl extends ConnectJDBC implements ITopicDao {

	//Lấy ra đề tài theo id 
	@Override
	public Topic get(int topicid) {
		String sql = "Select * From Topic Where topicid = ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, topicid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Topic topic = new Topic();
				topic.setTopicid(rs.getInt("topicid"));
				topic.setTopicname(rs.getString("topicname"));
				topic.setTopictarget(rs.getString("topictarget"));
				topic.setRequest(rs.getString("request"));
				topic.setProduct(rs.getString("product"));
				topic.setNumofstudent(rs.getInt("numofstudent"));
				topic.setMajor(rs.getString("major"));
				topic.setTopictype(rs.getString("topictype"));
				topic.setTopicstatus(rs.getBoolean("topicstatus"));
				topic.setSchoolyear(rs.getInt("schoolyear"));
				topic.setLeaderid(rs.getString("leaderid"));
				topic.setMemberid(rs.getString("memberid"));
				topic.setInstructorid(rs.getString("instructorid"));
				topic.setCriticalid(rs.getString("criticalid"));
				topic.setTopicscore(rs.getInt("topicscore"));
				return topic;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//Trả về danh sách đề tài đã được duyệt theo loại đề tài và niên khóa
	@Override
	public List<Topic> get(String topictype, int schoolyear) {
		List<Topic> topics = new ArrayList<Topic>();
		String sql = "Select * From Topic Where topictype = ? AND schoolyear = ? AND topicstatus = 1";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, topictype);
			ps.setInt(2, schoolyear);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Topic topic = new Topic();
				topic.setTopicid(rs.getInt("topicid"));
				topic.setTopicname(rs.getString("topicname"));
				topic.setTopictarget(rs.getString("topictarget"));
				topic.setRequest(rs.getString("request"));
				topic.setProduct(rs.getString("product"));
				topic.setNumofstudent(rs.getInt("numofstudent"));
				topic.setMajor(rs.getString("major"));
				topic.setTopictype(rs.getString("topictype"));
				topic.setTopicstatus(rs.getBoolean("topicstatus"));
				topic.setSchoolyear(rs.getInt("schoolyear"));
				topic.setLeaderid(rs.getString("leaderid"));
				topic.setMemberid(rs.getString("memberid"));
				topic.setInstructorid(rs.getString("instructorid"));
				topic.setCriticalid(rs.getString("criticalid"));
				topic.setTopicscore(rs.getInt("topicscore"));
				topics.add(topic);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return topics;
	}

	//Trả về danh sách đề tài đã được duyệt trên hệ thống
	@Override
	public List<Topic> getAll() {
		List<Topic> topics = new ArrayList<Topic>();
		String sql = "Select * From Topic Where topicstatus = 1";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Topic topic = new Topic();
				topic.setTopicid(rs.getInt("topicid"));
				topic.setTopicname(rs.getString("topicname"));
				topic.setTopictarget(rs.getString("topictarget"));
				topic.setRequest(rs.getString("request"));
				topic.setProduct(rs.getString("product"));
				topic.setNumofstudent(rs.getInt("numofstudent"));
				topic.setMajor(rs.getString("major"));
				topic.setTopictype(rs.getString("topictype"));
				topic.setTopicstatus(rs.getBoolean("topicstatus"));
				topic.setSchoolyear(rs.getInt("schoolyear"));
				topic.setLeaderid(rs.getString("leaderid"));
				topic.setMemberid(rs.getString("memberid"));
				topic.setInstructorid(rs.getString("instructorid"));
				topic.setCriticalid(rs.getString("criticalid"));
				topic.setTopicscore(rs.getInt("topicscore"));
				topics.add(topic);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return topics;
	}

	//Trả về tổng số đề tài đã được duyệt theo loại đề tài và niên khóa
	@Override
	public int countTopic(String topictype, int schoolyear) {
		String sql = "Select count(topicname) as 'Tổng số đề tài được duyệt' From Topic Where topictype = ? AND choolyear = ? AND topicstatus = 1";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, topictype);
			ps.setInt(2, schoolyear);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt("Tổng số đề tài được duyệt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	//Trả về tổng số đề tài không duyệt theo loại đề tài và niên khóa
	@Override
	public int countTopicNotPass(String topictype, int schoolyear) {
		String sql = "Select count(topicname) as 'Tổng số đề tài không duyệt' From Topic Where topictype = ? AND choolyear = ? AND topicstatus = 0";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, topictype);
			ps.setInt(2, schoolyear);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt("Tổng số đề tài không duyệt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	//Trả về danh sách đề tài được duyệt trên hệ thống (có phân trang)
	@Override
	public List<Topic> findAll(int index, int pagesize) {
		List<Topic> topics = new ArrayList<Topic>();
		String sql = "SELECT * FROM Topic WHERE topicstatus = 1 ORDER BY topicname asc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, index);
			ps.setInt(2, pagesize);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Topic topic = new Topic();
				topic.setTopicid(rs.getInt("topicid"));
				topic.setTopicname(rs.getString("topicname"));
				topic.setTopictarget(rs.getString("topictarget"));
				topic.setRequest(rs.getString("request"));
				topic.setProduct(rs.getString("product"));
				topic.setNumofstudent(rs.getInt("numofstudent"));
				topic.setMajor(rs.getString("major"));
				topic.setTopictype(rs.getString("topictype"));
				topic.setTopicstatus(rs.getBoolean("topicstatus"));
				topic.setSchoolyear(rs.getInt("schoolyear"));
				topic.setLeaderid(rs.getString("leaderid"));
				topic.setMemberid(rs.getString("memberid"));
				topic.setInstructorid(rs.getString("instructorid"));
				topic.setCriticalid(rs.getString("criticalid"));
				topic.setTopicscore(rs.getInt("topicscore"));
				topics.add(topic);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return topics;
	}

	//Trả về danh sách đề tài được duyệt phù hợp với từng sinh viên (có phân trang)
	@Override
	public List<Topic> findByStudentInfo(Users student, int index, int pagesize) {
		List<Topic> topics = new ArrayList<Topic>();
		String sql = "SELECT * FROM Topic Where major = ? AND schoolyear = 2000+? AND topicstatus = 1 "
				+ "ORDER BY topicname asc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, student.getMajor());
			ps.setInt(2, Integer.parseInt(student.getUserid().substring(0, 2)));
			ps.setInt(3, index);
			ps.setInt(4, pagesize);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Topic topic = new Topic();
				topic.setTopicid(rs.getInt("topicid"));
				topic.setTopicname(rs.getString("topicname"));
				topic.setTopictarget(rs.getString("topictarget"));
				topic.setRequest(rs.getString("request"));
				topic.setProduct(rs.getString("product"));
				topic.setNumofstudent(rs.getInt("numofstudent"));
				topic.setMajor(rs.getString("major"));
				topic.setTopictype(rs.getString("topictype"));
				topic.setTopicstatus(rs.getBoolean("topicstatus"));
				topic.setSchoolyear(rs.getInt("schoolyear"));
				topic.setLeaderid(rs.getString("leaderid"));
				topic.setMemberid(rs.getString("memberid"));
				topic.setInstructorid(rs.getString("instructorid"));
				topic.setCriticalid(rs.getString("criticalid"));
				topic.setTopicscore(rs.getInt("topicscore"));
				topics.add(topic);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return topics;
	}

	//Trả về đề tài theo tên đề tài, chuyên ngành và niên khóa
	//(Đề tài này đã được duyệt rồi)
	@Override
	public Topic getTopicByUnique(String topicname, String major, int schoolyear) {
		String sql = "Select * From Topic Where topicname = ? AND major = ? AND schoolyear = ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, topicname);
			ps.setString(2, major);
			ps.setInt(3, schoolyear);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Topic topic = new Topic();
				topic.setTopicid(rs.getInt("topicid"));
				topic.setTopicname(rs.getString("topicname"));
				topic.setTopictarget(rs.getString("topictarget"));
				topic.setRequest(rs.getString("request"));
				topic.setProduct(rs.getString("product"));
				topic.setNumofstudent(rs.getInt("numofstudent"));
				topic.setMajor(rs.getString("major"));
				topic.setTopictype(rs.getString("topictype"));
				topic.setTopicstatus(rs.getBoolean("topicstatus"));
				topic.setSchoolyear(rs.getInt("schoolyear"));
				topic.setLeaderid(rs.getString("leaderid"));
				topic.setMemberid(rs.getString("memberid"));
				topic.setInstructorid(rs.getString("instructorid"));
				topic.setCriticalid(rs.getString("criticalid"));
				topic.setTopicscore(rs.getInt("topicscore"));
				return topic;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//Sinh viên đăng ký đề tài bằng mã sinh viên thông qua tên đề tài, chuyên ngành và niên khóa của đề tài đã chọn
	//(Đề tài này đã được duyệt rồi)
	@Override
	public void register(String studentId, String topicname, String major, int schoolyear) {
		String sql = "UPDATE Topic set numofstudent = ?, ?=? Where topicname = ? AND major = ? AND schoolyear = ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			Topic topic = getTopicByUnique(topicname, major, schoolyear);
			if (topic.getNumofstudent() < 2) {
				if (topic.getNumofstudent() == 0) {
					ps.setInt(1, 1);
					ps.setString(2, "leaderid");
				} else {
					ps.setInt(1, 2);
					ps.setString(2, "memberid");
				}
				ps.setString(3, studentId);
				ps.setString(4, topicname);
				ps.setString(5, major);
				ps.setInt(6, schoolyear);
				ps.executeQuery();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
