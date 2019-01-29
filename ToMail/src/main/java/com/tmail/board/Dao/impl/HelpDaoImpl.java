package com.tmail.board.Dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tmail.board.Dao.HelpDao;
import com.tmail.board.Dto.HelpDto;

@Repository
public class HelpDaoImpl implements HelpDao{

   @Autowired
   private SqlSessionTemplate sqlSession;
   
   @Override
   public int insertHelp(HelpDto dto) {
      int res = 0;
      
      try {
         res = sqlSession.insert(namespace+"help_insert",dto);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return res;
   }

   @Override
   public List<HelpDto> help_groupList() {
      List<HelpDto>res = null;
      try {
         res = sqlSession.selectList(namespace+"help_selectList");
         System.out.println(res);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return res;
   }

   @Override
   public String help_registerName(String email) {
      String emails= "";
      
      try {
         emails = sqlSession.selectOne(namespace+"help_registerName",email);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return emails;
   }

@Override
public int help_update(HelpDto dto) {
	int res = 0;
	
	try {
		res = sqlSession.update(namespace+"help_update",dto);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return res;
}

@Override
public int help_delete(int help_seq) {
	int res = 0;
	
	try {
		res = sqlSession.delete(namespace+"help_delete",help_seq);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return res;
}

}