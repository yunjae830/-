package com.tmail.board.Biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmail.board.Biz.MailboxBiz;
import com.tmail.board.Dao.MailboxAttachDao;
import com.tmail.board.Dao.MailboxDao;
import com.tmail.board.Dto.Criteria;
import com.tmail.board.Dto.MailboxAttachDto;
import com.tmail.board.Dto.MailboxDto;

@Service
public class MailboxBizImpl implements MailboxBiz{
	
	MailboxDao dao;
	
	MailboxAttachDao attachDao;
	
	
	@Autowired
	public void setDao(MailboxDao dao) {
		this.dao = dao;
	}

	@Autowired
	public void setAttachDao(MailboxAttachDao attachDao) {
		this.attachDao = attachDao;
	}

	@Override
	public List<MailboxDto> getList(Criteria cri) {
		return dao.getList(cri);
	}

	@Transactional
	@Override
	public void addMail(MailboxDto mail) {
		dao.insertSelectKey(mail);
		
		if(mail.getAttachList() == null || mail.getAttachList().size() <=0) {
			return;
		}
		
		mail.getAttachList().forEach(attach->{
			attach.setBno(mail.getBno());
			attachDao.insert(attach);
		});
	}

	@Override
	public MailboxDto getMail(int bno) {
		return dao.getMail(bno);
	}
	
	@Transactional
	@Override
	public boolean deleteMail(int bno) {
		attachDao.deleteAll(bno);
		return dao.deleteMail(bno);
	}

	@Transactional
	@Override
	public boolean updateMail(MailboxDto mail) {
		
		attachDao.deleteAll(mail.getBno());
		boolean updateResult = dao.updateMail(mail);
		
		if(updateResult && mail.getAttachList() != null) {
			
			mail.getAttachList().forEach(attach -> {
				attach.setBno(mail.getBno());
				attachDao.insert(attach);
			});
		}
		
		return updateResult;
	}

	
	@Override
	public int getTotal(Criteria cri) {
		return dao.getTotal(cri);
	}

	@Override
	public List<MailboxAttachDto> getAttachList(int bno) {
		
		return attachDao.findByBno(bno);
	}
	
	

}
