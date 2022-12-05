package vn.dkdtute.Dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.dkdtute.Connections.ConnectJDBC;
import vn.dkdtute.Dao.ITopicDao;
import vn.dkdtute.Model.Topic;

public class TopicDaoImpl extends ConnectJDBC implements ITopicDao {

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

	@Override
	public List<Topic> get(String topictype, int schoolyear) {
		List<Topic> topics = new ArrayList<Topic>();
		String sql = "Select * From Topic Where topictype = ? AND schoolyear = ?";
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

	@Override
	public List<Topic> getAll() {
		List<Topic> topics = new ArrayList<Topic>();
		String sql = "Select * From Topic";
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

	@Override
	public int countTopic(String topictype, int schoolyear) {
		String sql = "Select count(topicname) as 'Tổng số đề tài' From Topic Where topictype = ?, choolyear = ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, topictype);
			ps.setInt(2, schoolyear);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt("Tổng số đề tài");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int countTopicNotPass(String topictype, int schoolyear) {
		String sql = "Select count(topicname) as 'Tổng số đề tài không duyệt' From Topic Where topictype = ?, choolyear = ?, topicstatus = 0";
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

}
