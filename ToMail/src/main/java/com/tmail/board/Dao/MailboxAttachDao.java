package com.tmail.board.Dao;

import java.util.List;

import com.tmail.board.Dto.MailboxAttachDto;

public interface MailboxAttachDao {
	
	String namespace ="mailboxAttach.";
	
	void insert(MailboxAttachDto attach);
	void delete(String uuid);
	List<MailboxAttachDto> findByBno(int bno);
	void deleteAll(int bno);

}
