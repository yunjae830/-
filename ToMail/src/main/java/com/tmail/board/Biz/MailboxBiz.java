package com.tmail.board.Biz;

import java.util.List;

import com.tmail.board.Dto.Criteria;
import com.tmail.board.Dto.MailboxAttachDto;
import com.tmail.board.Dto.MailboxDto;

public interface MailboxBiz {
	
	List<MailboxDto> getList(Criteria cri, int mno);
	List<MailboxDto> getTemplates(int mno);
	void addMail(MailboxDto mail);
	MailboxDto getMail(int bno);
	boolean deleteMail(int bno);
	boolean updateMail(MailboxDto mail);
	int getTotal(Criteria cri, int mno);
	List<MailboxAttachDto> getAttachList(int bno);

}
