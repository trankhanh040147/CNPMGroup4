package vn.dkdtute.Service.Impl;

import vn.dkdtute.Dao.IRegistrationPeriodDao;
import vn.dkdtute.Dao.Impl.RegistrationPeriodDaoImpl;
import vn.dkdtute.Model.RegistrationPeriod;
import vn.dkdtute.Service.IRegistrationPeriodService;

public class RegistrationPeriodServiceImpl implements IRegistrationPeriodService {

	IRegistrationPeriodDao periodDao = new RegistrationPeriodDaoImpl();
	
	@Override
	public void insert(RegistrationPeriod period) {
		periodDao.insert(period);
	}

}
