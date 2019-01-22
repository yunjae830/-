package com.tmail.board.Biz;

import com.tmail.board.Dto.registerDto;

public interface registerBiz {
	public int joinInsert(registerDto dto);
	public int loginSelect(String email,String pw);
	public int joinCheck(String email, String pw);
	public int pass_ck(String email);
	public void pass_complate(String email);
	public int pass_change(registerDto dto);
	public String mail_check(String email);
	public int member_seq_return(String email);
}
