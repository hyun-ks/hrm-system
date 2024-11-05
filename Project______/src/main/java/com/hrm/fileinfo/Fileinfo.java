package com.hrm.fileinfo;

import java.util.Date;

import lombok.Data;

@Data
public class Fileinfo {
	
	private int fileid;
	private int userid;
	private String name;
	private String title;
	private String content;
	private String path;
	private Date regdate;
}