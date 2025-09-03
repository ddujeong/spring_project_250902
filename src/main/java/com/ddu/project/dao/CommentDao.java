package com.ddu.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ddu.project.dto.CommentDto;
import com.ddu.project.dto.NoticeDto;


public interface CommentDao {
	
public int commentWriteDao(String ctext, String memberid, int bnum);
	
	public List<CommentDto> commentListDao(int bnum);
	
	public int commentDeleteDao(int cnum);
	
	public int allCountDao(int bnum);
	
	public int commentModifyDao(String ctext, int cnum);
	
}
