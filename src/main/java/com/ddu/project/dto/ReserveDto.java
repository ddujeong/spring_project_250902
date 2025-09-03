package com.ddu.project.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReserveDto {
	private int rid;
	private String machine;
	private Date rdatetime;
	private String status;
	private String memberid;
	private Date reservetime;
	
	private String rdatetimeStrDate;  // 날짜
	private String rdatetimeStrTime;  // 시간

}
