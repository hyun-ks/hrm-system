package com.hrm.main;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.hrm.approval.Approval;
import com.hrm.approval.ApprovalService;
import com.hrm.attendance.Attendance;
import com.hrm.attendance.AttendanceService;
import com.hrm.board.Board;
import com.hrm.board.BoardService;
import com.hrm.emp.Employee;
import com.hrm.fileinfo.Fileinfo;
import com.hrm.fileinfo.FileinfoService;
import com.hrm.info.InfoService;


import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
@SessionAttributes("user")
public class MainController {
	
	@Autowired
	AttendanceService a;
	
	@Autowired
	InfoService service;
	@Autowired
	BoardService b;
	
	@Autowired
	MainService m;
	
	@Autowired
	FileinfoService f;
	
	@Autowired
	ApprovalService s;

	private int startRow;
	
	
	@ModelAttribute("user")
	public Employee getLoginDto() {
		return new Employee(); //반환값 세션에 저장(이값을 가져와야함)
	}
	

	@GetMapping("/main")
	 public String showAttendanceDeptreadForm1(Model m, @ModelAttribute("user") Employee user, @RequestParam(name="p", defaultValue = "1") int page) {		
	    	m.addAttribute("view", a.viewall());
	    	
	    	String timediff = a.sub(user.getUserid());
		 	m.addAttribute("Time", timediff);
		 	
		 	Date currentDate = a.getDate();
		 	m.addAttribute("Date", currentDate);
		 	
		 	int count = b.count();
			if(count > 0) {
			
			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;
			
			List<Board> boardList = b.boardList(startRow);
			
			m.addAttribute("bList", boardList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;
			}
			 m.addAttribute("begin", begin);
			 m.addAttribute("end", end);
			 m.addAttribute("pageNum", pageNum);
			 m.addAttribute("totalPages", totalPages);
			
			}
			m.addAttribute("count", count);
		 	
			List<Fileinfo> fileList = f.fileList(startRow);

			m.addAttribute("fList", fileList);
	 
			List<Approval> signList = s.signList(startRow);
			
			m.addAttribute("sList", signList);
	    	
	        return "/main";
	    }
		
}
