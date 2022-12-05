package vn.dkdtute.Service.Impl;

import java.util.List;

import vn.dkdtute.Dao.ITopicDao;
import vn.dkdtute.Dao.Impl.TopicDaoImpl;
import vn.dkdtute.Model.Topic;
import vn.dkdtute.Service.ITopicService;

public class TopicServiceImpl implements ITopicService {

	ITopicDao topicDao = new TopicDaoImpl();

	@Override
	public Topic get(int topicid) {
		return topicDao.get(topicid);
	}

	@Override
	public List<Topic> get(String topictype, int schoolyear) {
		return topicDao.get(topictype, schoolyear);
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

}
