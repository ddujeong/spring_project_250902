package com.ddu.project.dto;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDto {
	
	private int bnum;
	private String btitle;
	private String bcontent;
	private String memberid;
	private int bhit;
	private Date bdate;
	
	private MemberDto memberDto;
	private List<CommentDto> commentDtos;

}
