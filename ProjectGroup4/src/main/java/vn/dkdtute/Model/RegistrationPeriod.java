package vn.dkdtute.Model;

import java.sql.Date;

public class RegistrationPeriod {
	private int id;
	private byte objectreg;
	private int schoolyear;
	private byte regtype;
	private Date datefrom;
	private Date datefinal;
	
	//Constructors, Getters/Setters
	public RegistrationPeriod() {
		super();
	}

	public RegistrationPeriod(int id, byte objectreg, int schoolyear, byte regtype, Date datefrom, Date datefinal) {
		super();
		this.id = id;
		this.objectreg = objectreg;
		this.schoolyear = schoolyear;
		this.regtype = regtype;
		this.datefrom = datefrom;
		this.datefinal = datefinal;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public byte getObjectreg() {
		return objectreg;
	}

	public void setObjectreg(byte objectreg) {
		this.objectreg = objectreg;
	}

	public int getSchoolyear() {
		return schoolyear;
	}

	public void setSchoolyear(int schoolyear) {
		this.schoolyear = schoolyear;
	}

	public byte getRegtype() {
		return regtype;
	}

	public void setRegtype(byte regtype) {
		this.regtype = regtype;
	}

	public Date getDatefrom() {
		return datefrom;
	}

	public void setDatefrom(Date datefrom) {
		this.datefrom = datefrom;
	}

	public Date getDatefinal() {
		return datefinal;
	}

	public void setDatefinal(Date datefinal) {
		this.datefinal = datefinal;
	}

}
