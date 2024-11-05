package com.hrm.emp;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.hrm.dept.DeptService;

@Controller
public class EmpController {
	@Autowired
	EmpService e;
	
	@Autowired
	DeptService d;
	
	
	@GetMapping("/emp/list")
    public String showEmployeeListForm(Model m) {
		
		List<Employee> Employeelist = e.empall();
		
		for(Employee maskedInfo : Employeelist) {
			String maskedName = maskname(maskedInfo.getEm_name());
			maskedInfo.setEm_name(maskedName);
			
			String maskedPhoneNumber = maskPhoneNumber(maskedInfo.getEm_phone());
			maskedInfo.setEm_phone(maskedPhoneNumber);
			
			String maskedemail = maskemail(maskedInfo.getEm_email());
			maskedInfo.setEm_email(maskedemail);
			
			String maskedaddress = maskaddress(maskedInfo.getEm_detailaddress());
			maskedInfo.setEm_detailaddress(maskedaddress);
		}
		m.addAttribute("emp", Employeelist);
        return "/emp/list";
    }
	
	public String maskname(String em_name) {
		StringBuilder maskedname = new StringBuilder(em_name);
		
		if(em_name.length() == 3) {//em_name가 세글자일때
			maskedname.setCharAt(1, '*');//2번째 배열값을 *로 바꿈
		}
		else if(em_name.length() == 4) {
			maskedname.setCharAt(1, '*');
			maskedname.setCharAt(2, '*');
		}
		return maskedname.toString();
	}
	
	public String maskPhoneNumber(String em_phone) {
		StringBuilder maskedPhoneNumber = new StringBuilder(em_phone);
		
		if(em_phone.contains("-")) {
			String[] parts = em_phone.split("-");
			maskedPhoneNumber = new StringBuilder(parts[0] + "-" + "****" + "-" + parts[2]);
		}
		
		return maskedPhoneNumber.toString();
	}
	
	public String maskemail(String em_email) {
		if(em_email == null || !em_email.contains("@")) {
			return em_email;
		}
			String[] parts = em_email.split("@");
			String idPart = parts[0];
			String domainPart = parts[1];
		
			String maskedid = idPart.replaceAll("(?<=.{2}).", "*");
			
			return maskedid + "@" + domainPart;
	}
	
	public String maskaddress(String em_detailaddress) {
		if(em_detailaddress == null) {
			return em_detailaddress;
		}
		
		String maskedaddress = em_detailaddress.replaceAll("\\d", "*");
		return maskedaddress.toString();
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
