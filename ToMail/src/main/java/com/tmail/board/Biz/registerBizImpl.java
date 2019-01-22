package com.tmail.board.Biz;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmail.board.Dao.registerDao;
import com.tmail.board.Dto.registerDto;

@Service
public class registerBizImpl implements registerBiz {
	@Autowired
	private registerDao dao;
	@Override
	public int joinInsert(registerDto dto) {
		return dao.joinInsert(dto);
	}
	@Override
	public int loginSelect(String email,String pw) {
		return dao.loginSelect(email,pw);
	}
	@Override
	public int joinCheck(String email,String pw) {
		return dao.joinCheck(email,pw);
	}
	@Override
	public int pass_ck(String email) {
		return dao.pass_ck(email);
	}
	@Override
	public void pass_complate(String email) {
		dao.pass_complate(email);
		
	}
	@Override
	public int pass_change(registerDto dto) {
		return dao.pass_change(dto);
	}
	@Override
	public String mail_check(String email) {	
		return dao.mail_check(email);
	}
	@Override
	public int member_seq_return(String email) {
		return dao.member_seq_return(email);
	}

}
