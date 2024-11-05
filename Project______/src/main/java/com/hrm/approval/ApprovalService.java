package com.hrm.approval;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrm.emp.Employee;


@Service
public class ApprovalService {
	@Autowired
	ApprovalDao dao;

	public int insertsign(Approval sign) {
		return dao.insertsign(sign);
	}
	public List<Approval> signList(int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.signList(m);
	}
	public int count() {
		return dao.count();
	}
	public Approval signOne(int num) {
		return dao.signOne(num);
	}
	public List<Approval> appall(int userid){
		return dao.app(userid);
	}
	public int deleteapproval(int appnum) {
		return dao.deleteapproval(appnum);
	}
	
	public int updateapproval(int appnum, int status, int no) {
		int x = 0;
		if(no == 1) {
			x = dao.updateapproval1(appnum, status);
		}else if(no == 2) {
			x = dao.updateapproval2(appnum, status);
		}else {
			x = dao.updateapproval3(appnum, status);
		}
		return x;
	}
	public List<Approval> appOne(int userid, int start) {
		System.out.println("appOne");	
		return dao.appOne(userid, start);
	}
	public int countOne(int userid) {
		return dao.countOne(userid);
	}
	
	public  List<Map<String, Object>> em_search(int userid){
		return dao.em_search(userid);
	}
}