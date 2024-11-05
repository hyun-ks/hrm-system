package com.hrm.emp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmpService {
	@Autowired
	EmployeeDAO dao;
	public List<Employee> empall(){
		return dao.emp();
	}
	
	public int insert(Employee e) {
		return dao.insert(e);
	}
	
	public Employee empOne(int userid) {
		return dao.empOne(userid);
	}
	
}
