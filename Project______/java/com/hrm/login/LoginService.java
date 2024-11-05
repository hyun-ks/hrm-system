package com.hrm.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
	@Autowired
	LoginDAO dao;

	public String login(String Username) {
		return dao.login(Username);
	}
	

}