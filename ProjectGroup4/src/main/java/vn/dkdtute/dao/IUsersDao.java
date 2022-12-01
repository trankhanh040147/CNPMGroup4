package vn.dkdtute.dao;

import vn.dkdtute.model.Users;

public interface IUsersDao {
	Users findByID(String userid);

	Users findByEmail(String email);

	Users login(String email, String passwd);

	void edit(Users user);
}
