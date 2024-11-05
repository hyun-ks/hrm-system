package com.hrm.dept;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;


@Mapper
public interface DepartmentDAO {
    // 실제로는 데이터베이스에서 부서 목록을 가져오는 코드가 있어야 합니다.
   @Select("SELECT * FROM em_dept")
   List<Department> dept();
   
   
   
   
}
