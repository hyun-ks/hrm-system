package com.hrm.approval;

import java.awt.print.Printable;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.hrm.approvaltype.ApprovaltypeService;
import com.hrm.attendance.AttendanceService;
import com.hrm.emp.Employee;
import com.hrm.fileinfo.Fileinfo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SessionAttributes("user")
@Controller
public class ApprovalController {
	@Autowired
    ApprovalService s;
	
	@Autowired
	ApprovaltypeService ts;
	
	@Autowired
	AttendanceService a;
	
	@ModelAttribute("user")
	public Employee getDto() {
		return new Employee();
	}

	@GetMapping("/approvaldownload/{appnum}")
	public void signDownload(@PathVariable("appnum") int id, HttpServletResponse response, HttpServletRequest request) throws IOException {

		Approval dto = s.signOne(id);
		String path = null;
		path = request.getServletContext().getRealPath("/signImg");
		File file = new File(path, dto.getPath());

		String fileName = new String(dto.getName().getBytes("utf-8"), "iso-8859-1");

		response.setContentType("application/octet-stream; charset=utf-8");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");// 다운로드 받을 파일명 지정

		response.setHeader("Content-Transfer-Encoding", "binary");

		OutputStream out = response.getOutputStream();

		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		} finally {
			if (fis != null)
				try {
					fis.close();
				} catch (IOException ex) {
				}
		}
		out.flush();
	}
	@GetMapping("approval/write")
	public String form(Model m,  @ModelAttribute("user") Employee user) {
		m.addAttribute("type", ts.typeall());
		m.addAttribute("name",a.name(user.getDept_no()));
		return "approval/write";
	}

	@PostMapping("approval/write")
	public String submit(Approval dto,  MultipartFile file, HttpServletRequest request, Model m) {
	
		if (!file.getOriginalFilename().equals("")) {
			String fileName = upload(file, request);

			dto.setName(file.getOriginalFilename());
			dto.setPath(fileName);

			s.insertsign(dto);

			m.addAttribute("dto",dto);
		}
		return "redirect:list";
	}

	private String upload(MultipartFile file, HttpServletRequest request) {
		String origName = file.getOriginalFilename();
		int index = origName.lastIndexOf(".");
		String ext = origName.substring(index + 1);// 파일 확장자 저장

		Random r = new Random();
		String fileName = System.currentTimeMillis() + "_" + r.nextInt(50) + "." + ext;

		try {
			String path = request.getServletContext().getRealPath("/signImg");
			File f = new File(path, fileName);
			file.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}

    @RequestMapping("/approval/list")
    public String signList(@RequestParam(name="p", defaultValue = "1") int page, Model m,@ModelAttribute("user")Employee emp ) {
  
    	int count = s.count();
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		
		List<Approval> signList = s.signList(startRow);
		
		m.addAttribute("num", startRow + 1);
		m.addAttribute("sList", signList);

		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); 
		
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
		m.addAttribute("app", s.appall(emp.getUserid()));
		m.addAttribute("app1", s.em_search(emp.getUserid()));
		m.addAttribute("count", count);
	    
        return "approval/list";
     }
    @RequestMapping("/myapproval/list")
    public String mysignList(@RequestParam(name="p", defaultValue = "1") int page, Model m, @ModelAttribute("user")Employee emp ) {
  
    	int count = s.countOne(emp.getUserid());
    	System.out.println("count:"+count);
		if(count > 0) {
		
		int perPage = 10;
		int startRow = (page - 1) * perPage;
		
		List<Approval> sList = s.appOne(emp.getUserid(), startRow );
		System.out.println(sList.size());
		m.addAttribute("num", startRow + 1);
		m.addAttribute("sList", sList);

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
		m.addAttribute("app1", s.em_search(emp.getUserid()));
		m.addAttribute("count", count);
        return "/myapproval/list";
    }
    
    @GetMapping("approval/content/{appnum}")
	public String content(@ModelAttribute("user")Employee user, @PathVariable int appnum, Model m) {
		Approval dto = s.signOne(appnum);
		m.addAttribute("dto", dto);
		return "approval/content";
	}
    @GetMapping("myapproval/content/{appnum}")
  	public String mycontent(@ModelAttribute("user")Employee user, @PathVariable int appnum, Model m) {
  		Approval dto = s.signOne(appnum);
  		m.addAttribute("dto", dto);
  		return "myapproval/content";
  	}
    @DeleteMapping("/approval/delete")
	@ResponseBody
	public int delete(@RequestParam(name="appnum", defaultValue = "1") int appnum, Model m) {
		int i = s.deleteapproval(appnum);
		m.addAttribute("dto", i);
		
		return i;
	}
   
	@GetMapping("/myapproval/update")
	public String update(@RequestParam("appnum") int appnum, @RequestParam("status")int status, @RequestParam("no")int no) {
		s.updateapproval(appnum, status, no);
		return "redirect:list";
	}

}