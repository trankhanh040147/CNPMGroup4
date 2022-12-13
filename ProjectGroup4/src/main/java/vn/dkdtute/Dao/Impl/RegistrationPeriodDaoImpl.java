package vn.dkdtute.Dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;

import vn.dkdtute.Connections.ConnectJDBC;
import vn.dkdtute.Dao.IRegistrationPeriodDao;
import vn.dkdtute.Model.RegistrationPeriod;

public class RegistrationPeriodDaoImpl extends ConnectJDBC implements IRegistrationPeriodDao {

	@Override
	public void insert(RegistrationPeriod period) {
		String sql = "Insert Into RegistrationPeriod(objectreg, schoolyear, regtype, datefrom, datefinal) "
				+ "values (?,?,?,?,?)";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setByte(1, period.getObjectreg());
			ps.setInt(2, period.getSchoolyear());
			ps.setByte(3, period.getRegtype());
			ps.setDate(4, period.getDatefrom());
			ps.setDate(5, period.getDatefinal());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
