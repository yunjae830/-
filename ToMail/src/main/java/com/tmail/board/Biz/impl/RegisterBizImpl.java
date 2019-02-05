package com.tmail.board.Biz.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmail.board.Biz.RegisterBiz;
import com.tmail.board.Dao.RegisterDao;
import com.tmail.board.Dto.RegisterDto;

@Service
public class RegisterBizImpl implements RegisterBiz {
   
   @Autowired
   private RegisterDao dao;
   
   @Override
   public int joinInsert(RegisterDto dto) {
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
   public int pass_change(RegisterDto dto) {
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
   @Override
   public String master_name_ck(String email) {
      return dao.master_name_ck(email);
   }
   
	@Override
	public RegisterDto getMember(int members_seq) {
		return dao.getMember(members_seq);
	}

}