package vn.dkdtute.Dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;

import vn.dkdtute.Connections.ConnectJDBC;
import vn.dkdtute.Dao.ISubmitTopicDao;
import vn.dkdtute.Model.SubmitTopic;

public class SubmitTopicDaoImpl extends ConnectJDBC implements ISubmitTopicDao {

	@Override
	public void submit(SubmitTopic submit) {
		String sql = "Insert Into SubmitTopic(topicid, userid, link) values(?,?,?)";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, submit.getTopicid());
			ps.setString(2, submit.getUserid());
			ps.setString(3, submit.getLink());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
