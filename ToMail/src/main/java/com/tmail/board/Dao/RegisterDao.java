package com.tmail.board.Dao;

import com.tmail.board.Dto.RegisterDto;

public interface RegisterDao {

   String namespace = "board.";
   
   public int joinInsert(RegisterDto dto);
   public int loginSelect(String email, String pw);
   public int joinCheck(String email,String pw);
   public int pass_ck(String email);
   public void pass_complate(String email);
   public int pass_change(RegisterDto dto);
   public String mail_check(String email);
   public int member_seq_return(String email);
   public String master_name_ck(String email);
}