package com.ddu.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ddu.project.dto.NoticeDto;


public interface NoticeDao {
	
public int boardWriteDao(String btitle, String memberid, String bcontent);
	
	public List<NoticeDto> boardListDao();
	
	public int boardDeleteDao(int bnum);
	
	public int allCountDao();
	
	public NoticeDto contentViewDao(int bnum);
	
	public void upBhitDao(@Param("bnum") int bnum);
	
	public int boardModifyDao(String btitle, String bcontent, int bnum);
	
	public List<NoticeDto> pageListDao(int startRow, int endRow); // 페이징 된 게시판 글 목록 보기

}
