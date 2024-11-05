package com.hrm.dept;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DeptController {
	@Autowired
	DeptService d;
	
	
	@RequestMapping("/dept/list")
    public String showDepartmentListForm(Model m) {
		m.addAttribute("de", d.deptall());
        return "/dept/list";
    }
}
