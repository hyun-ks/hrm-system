package com.hrm.fileinfo;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.hrm.board.Board;
import com.hrm.emp.Employee;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SessionAttributes("user")
@Controller
public class UploadController {
	@Autowired
	FileinfoService s;
	
	@ModelAttribute("user")
	public Employee getdto() {
		return new Employee();
	}
	@RequestMapping("/file/list")
	public String list(@RequestParam(name="p", defaultValue = "1") int page, Model m ) {
		
		//글이 있는지 체크
		int count = s.count();
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		
		List<Fileinfo> fileList = s.fileList(startRow);
		
		m.addAttribute("fList", fileList);
		m.addAttribute("num", startRow + 1);

		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum -1;
		if(end > totalPages) {
			end = totalPages;
		}
		int no=1;
		if(no < totalPages) {
			no++;
		}
		else no--;
		
		 m.addAttribute("begin", begin);
		 m.addAttribute("end", end);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		 m.addAttribute("no", no);
		
		}
		m.addAttribute("count", count);
		return "file/list";
	}

	@GetMapping("/filedownload/{fileid}")
	public void fileDownload(@PathVariable("fileid") int id, HttpServletResponse response, HttpServletRequest request) throws IOException {

		Fileinfo dto = s.fileOne(id);
		String path = null;
		path = request.getServletContext().getRealPath("/mainImg");
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


	@GetMapping("file/upload")
	public String form() {
		return "file/write";
	}

	@PostMapping("file/upload")
	public String submit(Fileinfo dto, MultipartFile file, Model m , HttpServletRequest request) {
		if (!file.getOriginalFilename().equals("")) {
			String fileName = upload(file, request);

			dto.setName(file.getOriginalFilename());
			dto.setPath(fileName);

			s.insertFile(dto);

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
			String path = request.getServletContext().getRealPath("/mainImg");
			File f = new File(path, fileName);
			file.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}
	@GetMapping("file/content/{fileid}")
	public String content(@ModelAttribute("user")Employee user, @PathVariable int fileid, Model m) {
		Fileinfo dto = s.fileOne(fileid);
		m.addAttribute("dto", dto);
		return "file/content";
	}
	@GetMapping("file/update/{fileid}")
	public String updateform(@PathVariable int fileid, Model m) {
		Fileinfo dto = s.fileOne(fileid);
		m.addAttribute("dto", dto);
		return "file/updateform";
	}
	@PutMapping("/file/update")
	public String update(Fileinfo f) {
		s.updatefile(f);
		return "redirect:list";
	}
	@DeleteMapping("/file/delete")
	@ResponseBody
	public int delete(@RequestParam(name="fileid", defaultValue = "1") int fileid, Model m) {
		int i = s.deletefile(fileid);
		m.addAttribute("dto", i);
		
		return i;
	}
	@GetMapping("/file/search")
	public String search(int searchn, String search,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = s.filecountSearch(searchn,search);
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		int endRow = page * perPage;
		
		List<Fileinfo> fileList = s.fileListSearch(searchn,search,startRow);
		m.addAttribute("fList", fileList);

		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute("begin", begin);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		 m.addAttribute("end", end);
		}
		m.addAttribute("count", count);
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);
		
		return "file/search";
	}

}