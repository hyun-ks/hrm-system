package com.hrm.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrm.attendance.AttendanceDAO;
import com.hrm.info.InfoDAO;

import lombok.Data;

@Service
@Data
public class MainService {
	@Autowired
	private final AttendanceDAO attendanceDAO;
	private final InfoDAO infoDAO;

}
