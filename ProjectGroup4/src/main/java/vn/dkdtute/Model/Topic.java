package vn.dkdtute.Model;

public class Topic {
	private int topicid;
	private String topicname;
	private String topictarget;
	private String request;
	private String product;
	private int numofstudent;
	private String major;
	private String topictype;
	private boolean topicstatus;
	private int schoolyear;
	private String leaderid;
	private String memberid;
	private String instructorid;
	private String criticalid;
	private int topicscore;

	// Constructors, Getters/Setters
	public Topic() {
		super();
	}

	public int getTopicid() {
		return topicid;
	}

	public void setTopicid(int topicid) {
		this.topicid = topicid;
	}

	public String getTopicname() {
		return topicname;
	}

	public void setTopicname(String topicname) {
		this.topicname = topicname;
	}

	public String getTopictarget() {
		return topictarget;
	}

	public void setTopictarget(String topictarget) {
		this.topictarget = topictarget;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public int getNumofstudent() {
		return numofstudent;
	}

	public void setNumofstudent(int numofstudent) {
		this.numofstudent = numofstudent;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getTopictype() {
		return topictype;
	}

	public void setTopictype(String topictype) {
		this.topictype = topictype;
	}

	public boolean isTopicstatus() {
		return topicstatus;
	}

	public void setTopicstatus(boolean topicstatus) {
		this.topicstatus = topicstatus;
	}

	public int getSchoolyear() {
		return schoolyear;
	}

	public void setSchoolyear(int schoolyear) {
		this.schoolyear = schoolyear;
	}

	public String getLeaderid() {
		return leaderid;
	}

	public void setLeaderid(String leaderid) {
		this.leaderid = leaderid;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getInstructorid() {
		return instructorid;
	}

	public void setInstructorid(String instructorid) {
		this.instructorid = instructorid;
	}

	public String getCriticalid() {
		return criticalid;
	}

	public void setCriticalid(String criticalid) {
		this.criticalid = criticalid;
	}

	public int getTopicscore() {
		return topicscore;
	}

	public void setTopicscore(int topicscore) {
		this.topicscore = topicscore;
	}

	public Topic(int topicid, String topicname, String topictarget, String request, String product, int numofstudent,
			String major, String topictype, boolean topicstatus, int schoolyear, String leaderid, String memberid,
			String instructorid, String criticalid, int topicscore) {
		super();
		this.topicid = topicid;
		this.topicname = topicname;
		this.topictarget = topictarget;
		this.request = request;
		this.product = product;
		this.numofstudent = numofstudent;
		this.major = major;
		this.topictype = topictype;
		this.topicstatus = topicstatus;
		this.schoolyear = schoolyear;
		this.leaderid = leaderid;
		this.memberid = memberid;
		this.instructorid = instructorid;
		this.criticalid = criticalid;
		this.topicscore = topicscore;
	}

	
	
	
	

}
