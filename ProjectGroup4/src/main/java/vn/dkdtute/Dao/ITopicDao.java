package vn.dkdtute.Dao;

import java.util.List;

import vn.dkdtute.Model.Topic;

public interface ITopicDao {
	Topic get(int topicid);

	List<Topic> get(String topictype, int schoolyear);

	List<Topic> getAll();

	int countTopic(String topictype, int schoolyear);

	int countTopicNotPass(String topictype, int schoolyear);
}
