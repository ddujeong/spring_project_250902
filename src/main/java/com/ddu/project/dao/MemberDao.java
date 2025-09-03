package com.ddu.project.dao;

public interface MemberDao {
	
	public int memberJoinDao(String memberid, String memberpw, String membername, String memberphone);
	
	public int memberIdCheckDao(String memberid);
	
	public int loginOkDao(String memberid, String memberpw);
	
	public int memberDeleteDao(String memberid);

	
}
