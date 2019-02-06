package com.tmail.board.Biz;

import java.util.List;

import com.tmail.board.Dto.PersonalDto;

public interface PersonalBiz {

	public int person(PersonalDto dto);
	public List<PersonalDto> personalList(PersonalDto dto);
	public int personalPwChange(PersonalDto dto);
}
