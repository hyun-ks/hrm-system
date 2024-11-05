package com.hrm.fileinfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrm.board.Board;

@Service
public class FileinfoService {
	@Autowired
	FileinfoDao dao;
	
	public int insertFile(Fileinfo file) {
		return dao.insertFile(file);
	}
	public List<Fileinfo> fileList(int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.fileList(m);
	}
	public Fileinfo fileOne(int fileid) {
		return dao.fileOne(fileid);
	}
	public int updatefile(Fileinfo dto) {
		return dao.updatefile(dto);
	}
	public int deletefile(int fileid) {
		return dao.deletefile(fileid);
	}
	public List<Fileinfo> fileListSearch(int searchn, String search,int start){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.fileListSearch(m);
	}
	public int filecountSearch(int searchn, String search) {
		//System.out.println(searchn+search);
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.filecountSearch(m);
	}
	public int count() {
		return dao.count();
	}
}