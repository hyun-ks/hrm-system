package com.hrm.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hrm.emp.Employee;

@SessionAttributes("user")
@Controller
public class BoardController {
	@Autowired
	BoardService s;
	
	@ModelAttribute("user")
	public Employee getDto() {
		return new Employee();
	}
	@RequestMapping("/board/list")
	public String list(@RequestParam(name="p", defaultValue = "1") int page, Model m ) {
		
		//글이 있는지 체크
		int count = s.count();
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		
		List<Board> boardList = s.boardList(startRow);
		
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
		return "board/list";
	}
	
	@GetMapping("board/content/{num}")
	public String content(@ModelAttribute("user")Employee user, @PathVariable int num, Model m) {
		Board dto = s.boardOne(num);
		m.addAttribute("dto", dto);
		return "board/content";
	}
	@GetMapping("board/update/{num}")
	public String updateform(@PathVariable int num, Model m) {
		Board dto = s.boardOne(num);
		m.addAttribute("dto", dto);
		return "board/updateform";
	}
	@PutMapping("/board/update")
	public String update(Board b) {
		s.updateBoard(b);
		return "redirect:list";
	}
	
	@DeleteMapping("/board/delete")
	@ResponseBody
	public int delete(@RequestParam(name="no", defaultValue = "1") int num, Model m) {
		int i = s.deleteBoard(num);
		m.addAttribute("dto", i);
		
		return i;
	}
	@GetMapping("/board/write")
	public String writeForm(@ModelAttribute("user")Employee dto) {
		return "board/write";
	}
	
	@PostMapping("/board/write")
	public String write(Board b) {
		s.insert(b);
		return "redirect:list";
	}
	
	@GetMapping("/board/search")
	public String search(int searchn, String search,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = s.boardcountSearch(searchn,search);
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		int endRow = page * perPage;
		
		List<Board> boardList = s.boardListSearch(searchn,search,startRow);
		m.addAttribute("bList", boardList);

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
		
		return "board/search";
	}
}
