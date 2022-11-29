package vn.dkdtute.model;

public class Users {
	private String userid;
	private String fullname;
	private String email;
	private String phone;
	private String avatar;
	private String passwd;
	private byte roleid;

	// Constructor
	public Users() {
		super();
	}

	public Users(String userid, String fullname, String email, String phone, String avatar, String passwd,
			byte roleid) {
		super();
		this.userid = userid;
		this.fullname = fullname;
		this.email = email;
		this.phone = phone;
		this.avatar = avatar;
		this.passwd = passwd;
		this.roleid = roleid;
	}

	// Getter/Setter
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public byte getRoleid() {
		return roleid;
	}

	public void setRoleid(byte roleid) {
		this.roleid = roleid;
	}

}
