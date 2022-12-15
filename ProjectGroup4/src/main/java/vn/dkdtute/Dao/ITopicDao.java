package vn.dkdtute.Dao;

import java.util.List;

import vn.dkdtute.Model.Topic;
import vn.dkdtute.Model.Users;

public interface ITopicDao {
	Topic get(int topicid);

	List<Topic> get(String topictype, int schoolyear, int index, int pagesize);

	List<Topic> getAll();

	int countTopic(String topictype, int schoolyear);

	int countTopicNotPass(String topictype, int schoolyear);

	List<Topic> findAll(int index, int pagesize);
	
	List<Topic> findByStudentInfo(Users student, int index, int pagesize);
	
	Topic getTopicByUnique(String topicname, String major, String topictype, int schoolyear);
	
	void register(String studentId, String topicname, String major, String topictype, int schoolyear);
	
	void insert(Topic topic);
	
	void edit(Topic topic);
	
//	void delete(Topic topic);
	
	void approve(Topic topic);
	
	void refuse(Topic topic);
}