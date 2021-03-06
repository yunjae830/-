package com.tmail.board.Dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tmail.board.Dao.RegisterDao;
import com.tmail.board.Dto.RegisterDto;

@Repository
public class RegisterDaoImpl implements RegisterDao {
   
   @Autowired
   private SqlSessionTemplate sqlSession;
   
   public int joinInsert(RegisterDto dto) {
      int res = 0;
      try {
         res = sqlSession.insert(namespace+"joinInsert",dto);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return res;
   }

   @Override
   public int loginSelect(String email,String pw) {
      String select_pw = null;
      try {
         select_pw = sqlSession.selectOne(namespace+"loginSelect",email);
         
      } catch(Exception e) {
         e.printStackTrace();
      }
      if(pw.equals(select_pw)) {
         return 1;
      }else {
         return 0;
      }
   }

   @Override
   public int joinCheck(String email,String pw) {

      String select_email = null;
      try {
         select_email = sqlSession.selectOne(namespace+"joincheck",email);
         
      } catch(Exception e) {
         e.printStackTrace();
      }
      if(email.equals(select_email)) {
         return 0;
      }else {
         return 1;
      }
   }

   @Override
   public int pass_ck(String email) {
      
      String seach_email = null;
      
      try {
         seach_email = sqlSession.selectOne(namespace+"pass_ck",email);
      } catch (Exception e) {
         e.printStackTrace();
      }
      if(email.equals(seach_email)) {
         return 1;
      }else {
         return 0;
      }
   }

   @Override
   public void pass_complate(String email) {
      int res = 0;
      try {
         res = sqlSession.update(namespace+"pass_ck_complate",email);
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   @Override
   public int pass_change(RegisterDto dto) {
      int res = 0;
      try {
         res = sqlSession.update(namespace+"pass_change", dto);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return res;
   }

   @Override
   public String mail_check(String email) {
      String mail_ck = null;
      try {
         mail_ck = sqlSession.selectOne(namespace+"mail_check", email);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return mail_ck;
   }

   @Override
   public int member_seq_return(String email) {
      int member_seq = 0;
      try {
         member_seq = sqlSession.selectOne(namespace+"member_seq_return", email);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return member_seq;
   }

   @Override
   public String master_name_ck(String email) {
      String master_name = "";
      System.out.println(email);
      try {
         master_name = sqlSession.selectOne(namespace+"master_name_selectOne",email);
      } catch (Exception e) {
         e.printStackTrace();
      }
      if(master_name.equals("관리자")) {
      return master_name;
      }else {
         return "false";
      }
   }

	@Override
	public RegisterDto getMember(int members_seq) {
		return sqlSession.selectOne(namespace + "selectMember" , members_seq);
	}

}