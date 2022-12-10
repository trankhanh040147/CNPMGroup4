package vn.dkdtute.Dao;

import java.util.List;

import vn.dkdtute.Model.Users;

public interface IUsersDao {
	Users findByID(String userid);

	Users findByEmail(String email);

	Users login(String email, String passwd);
	
	void insert(Users user);
	
	void adminEdit(Users user);

	void edit(Users user);
	
	void delete (String userid);

	String findName(String Id);
	
	List<Users> findStudent(String infoStudent);
	
	List<Users> findLecturer(String infoLecturer);

}