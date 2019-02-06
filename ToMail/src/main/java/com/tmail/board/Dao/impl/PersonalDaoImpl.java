package com.tmail.board.Dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tmail.board.Dao.PersonalDao;
import com.tmail.board.Dto.AddressDto;
import com.tmail.board.Dto.PersonalDto;
@Repository
public class PersonalDaoImpl implements PersonalDao {
	@Autowired
	private SqlSessionTemplate SqlSession;
	
	@Override
	public int person(PersonalDto dto) {
			String myPersonal = "";
			try {
				myPersonal = SqlSession.selectOne(namespace + "personalSelect", dto);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			if(dto.getMembers_pw().equals(myPersonal)) {
				
				return 1;
			}
			else {
				return 0;
				}
	}

	@Override
	public List<PersonalDto> personalList(PersonalDto dto) {
		List<PersonalDto>res = null; 
		
		try {
			res = SqlSession.selectList(namespace + "personalList", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int personalPwChange(PersonalDto dto) {
		
		int res = 0;
		
		try {
			res = SqlSession.update(namespace + "personalPwChange", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	
}
