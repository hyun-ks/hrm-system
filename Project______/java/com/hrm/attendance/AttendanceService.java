package com.hrm.attendance;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.apache.el.parser.AstConcatenation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrm.emp.Employee;

@Service
public class AttendanceService {
	@Autowired
	private AttendanceDAO dao;
	
	public int insert(int userid, String commit) {
		return dao.insert(userid, commit);
	}
	
	public int find(int userid, String commit) {
		return dao.find(userid, commit);
	}

	public List<Attendance> search(int userid, Date startDate, Date endDate) {
		return dao.search(userid, startDate, endDate);
	}
	
	public List<Attendance> viewall(){
		return dao.viewall();
	}
	
	public List<Attendance> name(int dept_no){
		return dao.name(dept_no);
	}
}
