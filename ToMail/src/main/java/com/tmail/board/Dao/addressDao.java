package com.tmail.board.Dao;

import java.util.List;

import com.tmail.board.Dto.addressDto;


public interface addressDao {

	String namespace = "email.";
	
	public List<addressDto> selectList(int members_seq);
	public addressDto selectOne_email_chk(String name);
	public int insert(addressDto dto);
	public int update(addressDto dto);
	public int delete(String name);
}
