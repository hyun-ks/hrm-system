package com.hrm.attendance;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Attendance {
	
	 private LocalDateTime checktime;
	 private int userid;
	 private String commit;
	 private int ranknum;
	 private String em_name;
	 
	
}
