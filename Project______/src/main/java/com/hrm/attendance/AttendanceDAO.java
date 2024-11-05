package com.hrm.attendance;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.hrm.emp.Employee;

@Mapper
public interface AttendanceDAO {
	
	@Select("select userid, em_name, checktime, commit from em_info natural join em_att where userid = #{userid}")
	List<Attendance> update(@Param("userid") int userid);
	
	 @Insert("insert into em_att(userid, checkTime, commit) values(	#{userid}, now(), #{commit})")
	 int insert(@Param("userid") int userid, @Param("commit") String commit);
	 
	 @Select("select count(*) from em_att where userid = #{userid} and commit=#{commit} and checktime > DATE_FORMAT(now(), '%Y-%m-%d 00:00:00')")
	 int find(@Param("userid") int userid, @Param("commit") String commit);
	 
	 @Select("select userid, em_name, checktime, commit from em_info natural join em_att where userid = #{userid} and checktime between #{startDate} and #{endDate}")
	 List<Attendance> search(@Param("userid") int userid, @Param("startDate") Date startDate, @Param("endDate") Date endDate);
	 
	 @Select("select userid, em_photo, em_position, em_name, checktime, commit from em_rank natural join em_info natural join em_att ORDER BY checktime desc")
	 List<Attendance> viewall();
	 
	 @Select("select userid, concat(em_name, ' ' ,em_position) as em_name from em_info natural join em_rank where dept_no = #{dept_no}")
	 List<Attendance> name(@Param("dept_no") int dept_no);
	 
	 @Select(
	 "select concat(TIMESTAMPDIFF(HOUR, checktime, now()),'시', round(TIMESTAMPDIFF(MINUTE, checktime, now())%60),'분', round(TIMESTAMPDIFF(SECOND,checktime, now())%60),'초') "
	 +"as time from em_att " 
	 +"where userid = #{userid} and checktime = (select max(checktime) from em_att where userid = #{userid});")
	 String sub(@Param("userid") int userid);
	 
	 @Select("select now()")
	 Date getDate();
	 
	 
}
