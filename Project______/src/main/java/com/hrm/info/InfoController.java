	package com.hrm.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hrm.emp.Employee;


@Controller
@SessionAttributes("user")
public class InfoController {
	@Autowired
	InfoService service ;
	
	@ModelAttribute("user")
	public Employee getLoginDto() {
		return new Employee(); //반환값 세션에 저장(이값을 가져와야함)
	}

	
	@RequestMapping("/info/profile")
    public String showInfoProfileForm() {
        return "/info/profile";
    }
	@RequestMapping("/info/edit")
    public String showInfoEditForm() {
        return "/info/edit";
    }
	@RequestMapping("/info/updateUserInfo")
	public String showInfoupdateUserInfoForm() {
		return "/info/updateUserInfo";
	}

    @GetMapping("/info/update-mypage")
    public String updateMyPage(@ModelAttribute("user") Employee emp) {
    	  
    	service.empupdata(emp);
    	
     return "redirect:/info/profile";
 }
    
    
}