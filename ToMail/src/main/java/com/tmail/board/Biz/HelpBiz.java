package com.tmail.board.Biz;

import java.util.List;

import com.tmail.board.Dto.AddressDto;
import com.tmail.board.Dto.HelpDto;

public interface HelpBiz {

   public int insertHelp(HelpDto dto);
   public List<HelpDto>help_groupList();
   public String help_registerName(String email);
   public int help_update(HelpDto dto);
   public int help_delete(int help_seq);
   public List<String> help_email_return(AddressDto dto, List<String> cus_seq);
}