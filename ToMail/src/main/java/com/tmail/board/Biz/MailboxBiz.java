package com.tmail.board.Biz;

import java.util.List;

import com.tmail.board.Dto.Criteria;
import com.tmail.board.Dto.MailboxAttachDto;
import com.tmail.board.Dto.MailboxDto;

public interface MailboxBiz {
	
	List<MailboxDto> getList(Criteria cri, String email);
	List<MailboxDto> getTemplates(String email);
	void addMail(MailboxDto mail);
	MailboxDto getMail(int bno);
	boolean deleteMail(int bno);
	boolean updateMail(MailboxDto mail);
	int getTotal(Criteria cri, String email);
	List<MailboxAttachDto> getAttachList(int bno);

}
