package com.tmail.board.Biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmail.board.Biz.MailboxBiz;
import com.tmail.board.Dao.MailboxDao;
import com.tmail.board.Dto.Criteria;
import com.tmail.board.Dto.MailboxDto;

@Service
public class MailboxBizImpl implements MailboxBiz{
	
	@Autowired
	MailboxDao dao;

	@Override
	public List<MailboxDto> getList(Criteria cri) {
		return dao.getList(cri);
	}

	@Override
	public void addMail(MailboxDto mail) {
		dao.addMail(mail);
	}

	@Override
	public MailboxDto getMail(int bno) {
		return dao.getMail(bno);
	}

	@Override
	public boolean deleteMail(int bno) {
		return dao.deleteMail(bno);
	}

	@Override
	public boolean updateMail(MailboxDto mail) {
		return dao.updateMail(mail);
	}

	@Override
	public int getTotal(Criteria cri) {
		return dao.getTotal(cri);
	}
	
	

}
