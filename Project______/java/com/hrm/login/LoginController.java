package com.hrm.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.hrm.emp.EmpService;
import com.hrm.emp.Employee;

import jakarta.validation.Valid;

@Controller
@SessionAttributes("user")
public class LoginController {
	@Autowired
	LoginService service;
	
	@Autowired
	EmpService eservice;
	
	
	@ModelAttribute("user")
	public Employee getLoginDto() {
		return new Employee(); //반환값 세션에 저장(이값을 가져와야함)
	}

    // 로그인 폼을 보여주는 메서드
    @RequestMapping("/login/login")
    public String showLoginForm() {
        return "/login/login"; // login.jsp와 같은 뷰를 반환
    }
    
    
 // 로그인 처리를 하는 메서드
    @RequestMapping("login/loginProcess")//login 클래스의 dto변수로 객체생성
    public String loginprocess(@Valid Login dto, BindingResult bindingResult, Model m) {
        if (bindingResult.hasErrors()) {
            return "login/login";
        }
        
        String Datapw = service.login(dto.getUserid());
        
        if(Datapw == null) {
        	bindingResult.reject("error", "Invalid userid or password. Please try again.");
			return "login/login";
		}else if(Datapw != null && !Datapw.equals(dto.getPassword())) {
			bindingResult.reject("error", "Invalid userid or password. Please try again.");
			return "login/login";
		}else if(Datapw.equals(dto.getPassword())) {
			Employee employee = eservice.empOne(Integer.parseInt(dto.getUserid()));
			m.addAttribute("user", employee);
		}
		
		return "/main";    
		
    }
    
    @GetMapping("/login/logout")
	public String logout(SessionStatus status) {
		status.setComplete();//세션삭제
		return "redirect:/login/login";
		
	}
      	
}