package vn.dkdtute.Service;

import java.util.List;

import vn.dkdtute.Model.Users;

public interface IUsersService {
	Users findByID(String userid);

	Users findByEmail(String email);

	Users login(String email, String passwd);
	
	void insert(Users user);
	
	void adminEdit(Users user);

	void edit(Users user);
	
	void delete (String userid);

	String findName(String Id);
	
	List<Users> findStudent(String infoStudent, int index, int pagesize);
	
	List<Users> findLecturer(String infoLecturer, int index, int pagesize);

	int CountStudentByKeyword(String keyword);

	int CountLectByKeyword(String keyword);
}
