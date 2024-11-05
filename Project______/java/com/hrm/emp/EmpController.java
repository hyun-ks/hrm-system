package com.hrm.emp;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartFile;

import com.hrm.dept.DeptService;

@Controller
public class EmpController {
	@Autowired
	EmpService e;
	
	@Autowired
	DeptService d;
	
	@RequestMapping("/emp/list")
    public String showEmployeeListForm(Model m) {
		m.addAttribute("emp", e.empall());
        return "/emp/list";
    }
	@GetMapping("/emp/insert")
	public String form(Model m) {
		m.addAttribute("dept", d.deptall());
		return "emp/insertform";
	}
	@PostMapping("/emp/insert")
	public String insert(MultipartFile photo, Employee emp, Model m) {
		String nwName = makeName(photo.getOriginalFilename());
		
		try {
			String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
			System.out.println(path);
			photo.transferTo(new File(path, nwName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		emp.setEm_photo(nwName);
		
		int i = e.insert(emp);
		if(i == 0) {
			m.addAttribute("msg", "저장안됨");
		}else {
			m.addAttribute("msg", "저장완료");
		}
		return "redirect:/emp/list";
	}
	private String makeName(String oName) {
		long currentTime = System.currentTimeMillis();
		Random random = new Random();
		int r = random.nextInt(50);// 0 ~ 49
		int index = oName.lastIndexOf(".");
		String ext = oName.substring(index + 1);
		System.out.println("ext :: "+ext);

		return currentTime + "_" + r + "." + ext;
	}
	

}
