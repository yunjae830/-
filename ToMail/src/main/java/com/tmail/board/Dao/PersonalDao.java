package com.tmail.board.Dao;

import java.util.List;

import com.tmail.board.Dto.PersonalDto;

public interface PersonalDao {
	
	String namespace = "person.";
	
	public int person(PersonalDto dto);
	public List<PersonalDto> personalList(PersonalDto dto);
	public int personalPwChange(PersonalDto dto);
}
