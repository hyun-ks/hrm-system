package com.hrm.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@GetMapping("/")
	public String check(@ModelAttribute("user") Employee e) {
			return "/login/loginCheck";
	}

	@ModelAttribute("user")
	public Employee getLoginDto() {
		return new Employee();
	}
	
    @RequestMapping("/login/login")
    public String showLoginForm() {
        return "/login/login"; 
    }
    
    @RequestMapping("login/loginProcess")
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
		
		return "redirect:/main";    
		
    }
    
    @PostMapping("/login/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/login/login";
		
	}
    
    @GetMapping("/login/logout")
	public String logouton(SessionStatus status) {
		status.setComplete();
		return "/login/login";
		
	}
    
    
      	
}