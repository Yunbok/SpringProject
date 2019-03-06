package com.solnamu.yb.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.solnamu.yb.dto.BoardReplyBean;
import com.solnamu.yb.dto.BoardRereplyBean;

public interface ReplyMapper {
	final String SELECT_REPLY = "select * from reply where bno = #{no}";

	final String SELECT_REPLYNO = "select rno+1 from reply where bno = #{no} order by rno desc limit 1";

	final String INSERT_REPLY = "insert into reply(bno,rno,content,writer,regDate) values(#{no},#{rno},#{content},#{writer},sysdate())";

	final String SELECT_REREPLY = "select * from rereply where bno = #{no}";

	final String SELECT_REREPLYNO = "select sno+1 from rereply where bno = #{no} and rno = #{rno} order by sno desc limit 1";

	final String INSERT_REREPLY = "insert into rereply(bno,rno,sno,content,writer,regDate) values(#{no},#{rno},#{sno},#{content},#{writer},sysdate())";
	
	@Select(SELECT_REPLY)
	@Results(value = {
			@Result(property="bno", column="bno"),
			@Result(property="rno", column="rno"),
			@Result(property="content", column="content"),
			@Result(property="writer", column="writer"),
			@Result(property="regDate", column="regDate")	
	})
	ArrayList<BoardReplyBean> getReplyList(@Param("no") int no);

	
	@Select(SELECT_REPLYNO)
	String getReplyNoCount(@Param("no") int no);

	@Insert(INSERT_REPLY)
	void getInsertReply(@Param("no") int no, @Param("rno") int rno, @Param("content") String content,@Param("writer") String writer);

	
	@Select(SELECT_REREPLY)
	@Results(value = {
			@Result(property="bno", column="bno"),
			@Result(property="rno", column="rno"),
			@Result(property="sno", column="sno"),
			@Result(property="content", column="content"),
			@Result(property="writer", column="writer"),
			@Result(property="regDate", column="regDate")	
	})
	ArrayList<BoardRereplyBean> getRereplyList(int no);

	
	@Select(SELECT_REREPLYNO)
	String getRereplyNoCount(@Param("no") int no,@Param("rno") int rno);

	@Insert(INSERT_REREPLY)
	void getInsertRereply(@Param("no") int no,@Param("rno") int rno,@Param("sno") int sno,@Param("content") String content,@Param("writer") String writer);
}
