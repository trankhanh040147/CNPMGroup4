package vn.dkdtute.Service.Impl;

import vn.dkdtute.Dao.ISubmitTopicDao;
import vn.dkdtute.Dao.Impl.SubmitTopicDaoImpl;
import vn.dkdtute.Model.SubmitTopic;
import vn.dkdtute.Service.ISubmitTopicService;

public class SubmitTopicServiceImpl implements ISubmitTopicService {

	ISubmitTopicDao submitDao = new SubmitTopicDaoImpl();

	@Override
	public void submit(SubmitTopic submit) {
		submitDao.submit(submit);
	}
}
