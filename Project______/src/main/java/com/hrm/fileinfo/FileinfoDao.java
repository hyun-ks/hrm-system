package com.hrm.fileinfo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.hrm.board.Board;


@Mapper
public interface FileinfoDao {
	@Insert("insert into fileinfo (name, userid, title, content, path, regdate ) values"
			+ "(#{name}, #{userid}, #{title}, #{content}, #{path},now())")
	int insertFile(Fileinfo file);
	
	@Select("select * from fileinfo order by regdate desc limit #{start} , #{count}")
	List<Fileinfo> fileList(Map<String, Object> m);
	
	@Select("select * from fileinfo where fileid = #{fileid}")
	Fileinfo fileOne(int fileid);
	
	@Update(" update fileinfo set title=#{title} , content=#{content} where fileid=#{fileid}")
	int updatefile(Fileinfo dto);
	
	@Delete("delete from fileinfo where fileid = #{fileid}")
	int deletefile(int fileid);
	
	@Select({"<script>",
		"select * from fileinfo" ,
		"<where>",
			"<choose>",
				"<when test='searchn == 0'>",
				"title like concat('%',#{search},'%')</when>",
				"<when test='searchn == 1'> content like concat('%',#{search},'%') </when>",
				"<when test='searchn == 2'> userid like concat('%',#{search},'%') </when>",
			"</choose>",
		"</where> ",
		"order by regdate desc  limit #{start} , #{count}",  "</script>"})
	List<Fileinfo> fileListSearch(Map<String, Object> m);
	
	@Select({"<script>",
		"select count(*) from fileinfo",
		"<where>",
			"<choose>",
				"<when test='searchn == 0'>",
				"title like concat('%',#{search},'%')</when>",
				"<when test='searchn == 1'> content like concat('%',#{search},'%') </when>",
				"<when test='searchn == 2'> userid like concat('%',#{search},'%') </when>",
			"</choose>",
		"</where>" ,"</script>"})
	int filecountSearch(Map<String, Object> m);
	
	@Select("select count(*) from fileinfo")
	int count();
}