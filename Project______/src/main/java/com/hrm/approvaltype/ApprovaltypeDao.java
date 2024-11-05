package com.hrm.approvaltype;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ApprovaltypeDao {
	 @Select("SELECT * FROM approvaltype")
	   List<Approvaltype> type();
}