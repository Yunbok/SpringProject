package com.solnamu.yb.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.solnamu.yb.mapper.ReplyMapper;
import com.solnamu.yb.dto.*;
@Component
public class ReplyService {
	@Autowired
	private ReplyMapper Mapper;

	public ArrayList<BoardReplyBean> getReplyList(int no) {
		return Mapper.getReplyList(no);
	}
	
	public String getReplyNoCount(int no) {
		return Mapper.getReplyNoCount(no);
	}

	public void getInsertReply(int no, int rno, String content, String writer) {
		Mapper.getInsertReply(no,rno,content,writer);
	}

	public ArrayList<BoardRereplyBean> getRereplyList(int no) {
		return Mapper.getRereplyList(no);
	}

	public String getRereplyNoCount(int no, int rno) {
		return Mapper.getRereplyNoCount(no,rno);
	}

	public void getInsertRereply(int no, int rno, int sno, String content, String writer) {
		Mapper.getInsertRereply(no,rno,sno,content,writer);
	}	
}
