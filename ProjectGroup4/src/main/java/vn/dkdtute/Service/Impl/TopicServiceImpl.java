package vn.dkdtute.Service.Impl;

import java.util.List;

import javax.tools.Tool;

import vn.dkdtute.Dao.ITopicDao;
import vn.dkdtute.Dao.Impl.TopicDaoImpl;
import vn.dkdtute.Model.Topic;
import vn.dkdtute.Model.Users;
import vn.dkdtute.Service.ITopicService;

public class TopicServiceImpl implements ITopicService {

	ITopicDao topicDao = new TopicDaoImpl();

	@Override
	public Topic get(int topicid) {
		return topicDao.get(topicid);
	}

	@Override
	public List<Topic> get(String topictype, int schoolyear, int index, int pagesize) {
		return topicDao.get(topictype, schoolyear, index, pagesize);
	}

	@Override
	public List<Topic> getAll() {
		return topicDao.getAll();
	}

	@Override
	public int countTopic(String topictype, int schoolyear) {
		return topicDao.countTopic(topictype, schoolyear);
	}

	@Override
	public int countTopicNotPass(String topictype, int schoolyear) {
		return topicDao.countTopicNotPass(topictype, schoolyear);
	}

	@Override
	public List<Topic> findAll(int index, int pagesize) {
		return topicDao.findAll(index, pagesize);
	}

	@Override
	public List<Topic> findByStudentInfo(Users student, int index, int pagesize) {
		return topicDao.findByStudentInfo(student, index, pagesize);
	}
	
	@Override
	public Topic getTopicByUnique(String topicname, String major, String topictype, int schoolyear) {
		return topicDao.getTopicByUnique(topicname, major, topictype, schoolyear);
	}

	@Override
	public void register(String studentId, int topicId) {
		topicDao.register(studentId, topicId);
	}

	@Override
	public void insert(Topic topic) {
		topicDao.insert(topic);
	}

	@Override
	public void edit(Topic topic) {
		topicDao.edit(topic);
	}

	@Override
	public void approve(Topic topic) {
		topicDao.approve(topic);
	}

	@Override
	public void refuse(Topic topic) {
		topicDao.refuse(topic);
	}

	@Override
	public int countByStudentInfo(Users student) {
		return topicDao.countByStudentInfo(student);
	}

	@Override
	public int countByLectCreate(Users lect) {
		return topicDao.countByLectCreate(lect);
	}

	@Override
	public List<Topic> findByLectCreate(Users lect, int index, int pagesize) {
		return topicDao.findByLectCreate(lect, index, pagesize);
	}

//	@Override
//	public void delete(Topic topic) {
//		topicDao.delete(topic);
//	}
}
