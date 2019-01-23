package com.tmail.board.Biz;

import java.util.List;

import com.tmail.board.Dto.AddressDto;

public interface AddressBiz {
	
	public List<AddressDto> selectList(int members_seq);
	public AddressDto selectOne_email_chk(String name);
	public int insert(AddressDto dto);
	public int update(AddressDto dto);
	public int delete(String name);
}
