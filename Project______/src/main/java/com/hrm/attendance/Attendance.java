package com.hrm.attendance;

import java.util.Date;


import lombok.Data;

@Data
public class Attendance {
	
	 private Date checktime;
	 private int userid;
	 private String commit;
	 private int ranknum;
	 private String em_name;
	 private String em_photo;
	 private String em_position;
	 
	
}
