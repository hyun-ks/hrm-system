package com.hrm.main;

import java.util.Date;

import com.hrm.attendance.Attendance;
import com.hrm.emp.Employee;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public class Main {
		private Attendance attendance;
		private Employee employee;
}
