package com.tmail.board.Biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmail.board.Dao.addressDao;
import com.tmail.board.Dto.addressDto;
@Service
public class addressBizImpl implements addressBiz {
	@Autowired
	private addressDao dao;
	@Override
	public List<addressDto> selectList(int members_seq) {
		return dao.selectList(members_seq);
	}

	@Override
	public addressDto selectOne_email_chk(String name) {
		return dao.selectOne_email_chk(name);
	}

	@Override
	public int insert(addressDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(addressDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(String name) {
		return dao.delete(name);
	}

}
