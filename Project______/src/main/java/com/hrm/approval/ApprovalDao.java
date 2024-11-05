package com.hrm.approval;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.hrm.emp.Employee;
import com.hrm.fileinfo.Fileinfo;


@Mapper
public interface ApprovalDao {
	@Insert("insert into approval (appnum, num, userid, path, name, startdate, enddate, approval_1, approval_2, approval_3, status_1, status_2 ,status_3, result) values"
	         + "(#{appnum}, #{num}, #{userid}, #{path}, #{name}, #{startdate}, #{enddate}, #{approval_1}, #{approval_2}, #{approval_3}, #{status_1}, #{status_2}, #{status_3}, #{result})")
	int insertsign(Approval sign);
	
	@Select("select * from approval NATURAL JOIN approvaltype where appnum = #{appnum}")
	Approval signOne(int appnum);
	
	@Select("select * from approval limit #{start} , #{count}")
	List<Approval> signList(Map<String, Object> m);
	
	@Select("select count(*) from approval")
	int count();
	
	@Select("SELECT * FROM approval NATURAL JOIN approvaltype where userid= #{userid}")
	List<Approval> app(int userid);
	
	//@Select("SELECT * FROM approval")
	 
	@Delete("delete from approval where appnum = #{appnum}")
		int deleteapproval(int appnum);
	
	@Update("update approval set status_1 = #{status_1} where appnum=#{appnum} and status_1 = 0")
		int updateapproval1(@Param("appnum")int appnum, @Param("status_1") int status_1);
	@Update("update approval set status_2 = #{status_1} where appnum=#{appnum} and status_1 != 0 and status_2 = 0")
	int updateapproval2(@Param("appnum")int appnum, @Param("status_1") int status_1);

	@Update("update approval set status_3 = #{status_1} where appnum=#{appnum} and status_1 != 0 and status_2 != 0 and status_3 = 0")
	int updateapproval3(@Param("appnum")int appnum, @Param("status_1") int status_1);


	@Select("SELECT count(*) FROM hrm.approval"+
			" where (approval_1 = #{userid} and status_1 = 0)" 
			+" or (approval_2 = #{userid} and  status_1 = 1 and status_2 = 0)" 
			+" or (approval_3 = #{userid} and status_1 = 1 and status_2 = 1 and  status_3 = 0)"
			)
	int countOne(@Param("userid")int userid);

	@Select("SELECT a.appnum, a.num, t.atype AS at, a.startdate, a.enddate, a.userid, a.result, "
	        + "e.em_name AS em, e2.em_name AS em2, e3.em_name AS em3, e4.em_name AS em4, "
	        + "r2.em_position AS pos2, r3.em_position AS pos3, r4.em_position AS pos4, r.ranknum, "
	        + "CASE WHEN a.status_1 = 1 AND a.status_2 = 1 AND a.status_3 = 1 THEN '승인완료' "
	        + "WHEN a.status_1 = 2 OR a.status_2 = 2 OR a.status_3 = 2 THEN '반려' "
	        + "ELSE '진행중' END AS status_result "
	        + "FROM approval a "
	        + "NATURAL JOIN em_info e "
	        + "NATURAL JOIN approvaltype t "
	        + "NATURAL JOIN em_rank r "
	        + "INNER JOIN em_info e1 ON a.userid = e1.userid "
	        + "INNER JOIN em_info e2 ON a.approval_1 = e2.userid "
	        + "INNER JOIN em_info e3 ON a.approval_2 = e3.userid "
	        + "INNER JOIN em_info e4 ON a.approval_3 = e4.userid "
	        + "INNER JOIN em_rank r2 ON e2.ranknum = r2.ranknum "
	        + "INNER JOIN em_rank r3 ON e3.ranknum = r3.ranknum "
	        + "INNER JOIN em_rank r4 ON e4.ranknum = r4.ranknum "
	        + "INNER JOIN approvaltype t1 ON a.num = t1.num " 
	        + "WHERE a.userid = #{userid}"
	)      
	List<Map<String, Object>> em_search(int userid);
 
	
	@Select("SELECT * FROM hrm.approval natural join approvaltype"+
			" where (approval_1 = #{userid} and status_1 = 0)" 
			+" or (approval_2 = #{userid} and  status_1 = 1 and status_2 = 0)" 
			+" or (approval_3 = #{userid} and status_1 = 1 and status_2 = 1 and  status_3 = 0)"
			+" limit #{start}, 10")
	List<Approval> appOne(@Param("userid")int userid, @Param("start")int start);
}
