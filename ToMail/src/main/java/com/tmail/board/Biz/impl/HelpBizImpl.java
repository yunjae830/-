package com.tmail.board.Biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmail.board.Biz.HelpBiz;
import com.tmail.board.Dao.HelpDao;
import com.tmail.board.Dto.HelpDto;

@Service
public class HelpBizImpl implements HelpBiz{

   @Autowired
   private HelpDao dao;
   @Override
   public int insertHelp(HelpDto dto) {
      return dao.insertHelp(dto);
   }
   @Override
   public List<HelpDto> help_groupList() {
      return dao.help_groupList();
   }
   @Override
   public String help_registerName(String email) {
      return dao.help_registerName(email);
   }
   @Override
   public int help_update(HelpDto dto) {
	return dao.help_update(dto);
   }
   @Override
   public int help_delete(int help_seq) {
	   return dao.help_delete(help_seq);
}

}