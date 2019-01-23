package com.tmail.board.Biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmail.board.Dao.AddressDao;
import com.tmail.board.Dto.AddressDto;
@Service
public class AddressBizImpl implements AddressBiz {
	@Autowired
	private AddressDao dao;
	@Override
	public List<AddressDto> selectList(int members_seq) {
		return dao.selectList(members_seq);
	}

	@Override
	public AddressDto selectOne_email_chk(String name) {
		return dao.selectOne_email_chk(name);
	}

	@Override
	public int insert(AddressDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(AddressDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(String name) {
		return dao.delete(name);
	}

}
