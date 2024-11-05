package com.hrm.dept;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeptService {
	@Autowired
	DepartmentDAO dao;
	
	public List<Department> deptall() {
		return dao.dept();
	}
	
}
