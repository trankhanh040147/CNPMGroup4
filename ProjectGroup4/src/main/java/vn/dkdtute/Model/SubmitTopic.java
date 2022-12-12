package vn.dkdtute.Model;

public class SubmitTopic {
	private int topicid;
	private String userid;
	private String link;
	
	//Constructors, Getters/Setters
	public SubmitTopic() {
		super();
	}

	public SubmitTopic(int topicid, String userid, String link) {
		super();
		this.topicid = topicid;
		this.userid = userid;
		this.link = link;
	}

	public int getTopicid() {
		return topicid;
	}

	public void setTopicid(int topicid) {
		this.topicid = topicid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
}
