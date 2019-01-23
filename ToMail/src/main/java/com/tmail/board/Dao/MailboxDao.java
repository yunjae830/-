package com.tmail.board.Dao;

import java.util.List;

import com.tmail.board.Dto.Criteria;
import com.tmail.board.Dto.MailboxDto;

public interface MailboxDao {
	
	String namespace = "mailbox.";
	
	List<MailboxDto> getList(Criteria cri);
	void addMail(MailboxDto mail);
	MailboxDto getMail(int bno);
	boolean deleteMail(int bno);
	boolean updateMail(MailboxDto mail);
	int getTotal(Criteria cri);

}
