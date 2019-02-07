package com.tmail.board.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tmail.board.Dto.Criteria;
import com.tmail.board.Dto.MailboxDto;
import com.tmail.board.Dto.RegisterDto;

public interface MailboxDao {
	
	String namespace = "mailbox.";
	
	List<MailboxDto> getList(@Param("cri") Criteria cri, @Param("email") String email);
	List<MailboxDto> getTemplates(String email);
	void addMail(MailboxDto mail);
	void insertSelectKey(MailboxDto mail);
	MailboxDto getMail(int bno);
	boolean deleteMail(int bno);
	boolean updateMail(MailboxDto mail);
	int getTotal(String email);

}
