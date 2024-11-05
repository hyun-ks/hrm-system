package com.hrm.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	@Autowired
	BoardDao dao;
	public int insert(Board b) {
		return dao.insert(b);
	}
	public List<Board> boardList(int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.boardList(m);
	}
	public int count() {
		return dao.count();
	}
	public Board boardOne(int num) {
		dao.addReadcount(num);
		return dao.boardOne(num);
	}
	public int updateBoard(Board dto) {
		return dao.updateBoard(dto);
	}
	public int deleteBoard(int num) {
		return dao.deleteBoard(num);
	}
	
	public List<Board> boardListSearch(int searchn, String search,int start){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.boardListSearch(m);
	}
	public int boardcountSearch(int searchn, String search) {
		//System.out.println(searchn+search);
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.boardcountSearch(m);
	}
}
