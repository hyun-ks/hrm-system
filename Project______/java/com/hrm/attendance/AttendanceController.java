package com.hrm.attendance;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hrm.emp.Employee;

@Controller
@SessionAttributes("user")
public class AttendanceController {
	@Autowired
	AttendanceService a;
	
	//출근을 클릭했을때는 출근 문자열을가져가고=commit이 출근 그리고 나머지는 직접 아이디가져옴
	
	@GetMapping("/attendance/check")
	public String saveAttendance(@RequestParam("commit") String commit ,Model m, @ModelAttribute("user") Employee user) {
		
		if(a.find(user.getUserid(), commit) == 0) {
		a.insert(user.getUserid(), commit);
		m.addAttribute("commit", commit);
		m.addAttribute("time", new Date());
		}
		else{
			m.addAttribute("popupMessage", "이미 "+commit+ "하셨습니다.");
		}
		return "/attendance/check";
	}
	
	@GetMapping("/attendance/authcheck")
	public String showAttendanceauthcheckForm() {
		return "/attendance/authcheck";
	}
	
	@GetMapping("/attendance/deptread")
    public String showAttendanceDeptreadForm(Model m, @ModelAttribute("user") Employee user) {
		if(user.getRanknum() > 3) {
			return "/attendance/authcheck";
		}
		m.addAttribute("view", a.viewall());
		m.addAttribute("name",a.name(user.getDept_no()));
	
        return "/attendance/deptread";
    }
	
	@ModelAttribute("user")
	public Employee getLoginDto() {
		return new Employee(); //반환값 세션에 저장(이값을 가져와야함)
	}
	
	@PostMapping("attendance/deptread")
	public String searchAttendance(@DateTimeFormat(pattern = "yyyy-MM-dd")@RequestParam("startDate") Date startDate, @DateTimeFormat(pattern = "yyyy-MM-dd")@RequestParam("endDate") Date endDate, Model m, @RequestParam(value="userid", defaultValue = "0") int userid) {
		List<Attendance> slist = a.search(userid, startDate, endDate);
		m.addAttribute("startDate", startDate);
		m.addAttribute("endDate", endDate);
		
		m.addAttribute("sc", slist);
		return "/attendance/search";
	}


}
