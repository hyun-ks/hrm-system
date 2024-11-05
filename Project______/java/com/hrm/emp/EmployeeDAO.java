package com.hrm.emp;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface EmployeeDAO {
    // 가정상의 데이터베이스나 외부 소스에서 사원 목록을 가져오는 메서드
	
	
    @Select("select * from em_info natural join em_dept")
    List<Employee> emp();
    
    @Insert("INSERT INTO em_info(userid, em_name, em_birth,em_hiredate,em_gender,em_phone,em_address,em_email,em_photo,em_salaly,auth_set,vac_no,dept_no,Password)"
    		+ " values(#{userid}, #{em_name}, #{em_birth},#{em_hiredate},#{em_gender},#{em_phone},#{em_address},#{em_email},#{em_photo},#{em_salaly},#{auth_set},#{vac_no},#{dept_no},#{Password})")
    int insert(Employee e);//반환되는건 행의개수

    @Select("select * from em_info natural join em_dept where userid = #{userid}")
	Employee empOne(int userid);
    
}
