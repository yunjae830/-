package com.tmail.board.Biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmail.board.Biz.PersonalBiz;
import com.tmail.board.Dao.PersonalDao;
import com.tmail.board.Dto.PersonalDto;
@Service
public class PersonalBizImpl implements PersonalBiz {

	@Autowired
	private PersonalDao dao;
	@Override
	public int person(PersonalDto dto) {
		return dao.person(dto);
	}

	@Override
	public List<PersonalDto> personalList(PersonalDto dto) {
		return dao.personalList(dto);
	}

	@Override
	public int personalPwChange(PersonalDto dto) {
		return dao.personalPwChange(dto);
	}

}
