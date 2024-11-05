package com.hrm.info;

import org.apache.ibatis.annotations.Update;
//EmployeeService.java
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrm.emp.Employee;

import java.util.List;

@Service
public class InfoService {

 @Autowired
 private InfoDAO infoDAO;

 public Employee getAllInfo(int userid) {
     return infoDAO.findOne(userid);
 }

 public int empupdata(Employee emp) {
	 return infoDAO.empupdate(emp);
 }
    
}
