package com.hrm.attendance;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface AttendanceDAO {
	//로그인에서 세션정보 가져오기때문에 데이터는 찾을필요없음
	
	 @Insert("insert into em_att(userid, checkTime, commit) values(#{userid}, now(), #{commit})")
	 int insert(@Param("userid") int userid, @Param("commit") String commit);
	 
	 @Select("select count(*) from em_att where userid = #{userid} and commit=#{commit} and checktime > DATE_FORMAT(now(), '%Y-%m-%d 00:00:00')")
	 int find(@Param("userid") int userid, @Param("commit") String commit);//출석중복확인
	 
	 @Select("select * from em_att where userid = #{userid} and checktime between #{startDate} and #{endDate}")
	 List<Attendance> search(@Param("userid") int userid, @Param("startDate") Date startDate, @Param("endDate") Date endDate);
	 
	 @Select("select * from em_att")
	 List<Attendance> viewall();
	 
	 @Select("select em_name, userid from em_info where dept_no = #{dept_no}")
	 List<Attendance> name(@Param("dept_no") int dept_no);
}
