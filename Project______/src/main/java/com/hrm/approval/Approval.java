package com.hrm.approval;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Approval {
	private int num;
	private int userid;
	private String path;
	private String name;
	private String atype;
	private int appnum;
	@DateTimeFormat(pattern ="yyyy-MM-dd")
	private Date startdate;
	@DateTimeFormat(pattern ="yyyy-MM-dd")
	private Date enddate;
	private int approval_1;
	private int approval_2;
	private int approval_3;
	private int status_1;
	private int status_2;
	private int status_3;
	private String em2;
	private String em3;
	private String em4;
	private String result;
	
	
}