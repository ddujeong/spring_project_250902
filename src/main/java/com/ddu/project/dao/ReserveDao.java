package com.ddu.project.dao;

import java.util.Date;
import java.util.List;

import com.ddu.project.dto.ReserveDto;

public interface ReserveDao {
	
	public int reserveDao(String machine, Date rdatetime, String memberid);
	
	public int reserveDeleteDao(int rid);
	
	public int reserveCheckDao(String machine, Date rdatetime);
	
	public List<ReserveDto> reserveListDao(String memberid);
	

}
