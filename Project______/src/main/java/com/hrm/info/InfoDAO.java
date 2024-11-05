package com.hrm.info;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
//EmployeeDAO.java
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.hrm.emp.Employee;

import java.util.List;

@Mapper
public interface InfoDAO {

	@Select("select * from em_info where userid=#{userid}")
	Employee findOne(int userid);

	@Update("update em_info "
			+ "set em_phone = #{em_phone},  em_email = #{em_email}, Password = #{Password}, em_address = #{em_address}"
			+ "where userid = #{userid}")
	int empupdate(Employee emp);
	
}