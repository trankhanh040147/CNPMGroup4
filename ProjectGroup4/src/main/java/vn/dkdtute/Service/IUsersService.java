package vn.dkdtute.Service;

import vn.dkdtute.Model.Users;

public interface IUsersService {
	Users findByID(String userid);

	Users findByEmail(String email);

	Users login(String email, String passwd);

	void edit(Users user);

	String findName(String Id);
}
