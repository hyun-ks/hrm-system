package com.hrm.login;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.hrm.emp.Employee;

@Mapper
public interface LoginDAO {
	@Select("select password from em_info where userid = #{userid}")
	String login(String Username);
	
}
