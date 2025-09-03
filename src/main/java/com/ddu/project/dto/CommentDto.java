package com.ddu.project.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentDto {
	
	private int cnum;
	private String memberid;
	private String ctext;
	private Date cdate;
	private int bnum;
	
	private MemberDto memberDto;

}
