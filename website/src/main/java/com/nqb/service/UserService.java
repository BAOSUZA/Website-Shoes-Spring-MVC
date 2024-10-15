package com.nqb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.nqb.dao.UserDao;
import com.nqb.model.User;

@Component
@Service
public class UserService {
	
	@Autowired
	UserDao userDao;
	
	public boolean isValid(String email, String password) {
		return userDao.isValid(email, password);
	}

	public User getUserByEmailAndPassword(String email, String password) {
		return userDao.getUserByEmailAndPassword(email, password);
	}
	
	public void addUser(String fullname, String email, String address, String phone_number, String password) {
		userDao.addUser(fullname, email, address, phone_number, password);
	}
	
	public List<User> getAccountList() {
		return userDao.getAccountList();
	}
}
