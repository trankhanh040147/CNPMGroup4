package vn.dkdtute.service;

import vn.dkdtute.model.Users;

public interface IUsersService {
	Users findByID(String userid);
	Users findByEmail(String email);
}
