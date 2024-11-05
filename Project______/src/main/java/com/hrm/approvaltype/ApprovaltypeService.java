package com.hrm.approvaltype;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class ApprovaltypeService {

	@Autowired
	ApprovaltypeDao dao;
	
	public List<Approvaltype> typeall() {
		return dao.type();
	}
	
}	