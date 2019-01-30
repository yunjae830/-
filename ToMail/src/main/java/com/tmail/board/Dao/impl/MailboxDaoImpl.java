package com.tmail.board.Dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tmail.board.Dao.MailboxDao;
import com.tmail.board.Dto.Criteria;
import com.tmail.board.Dto.MailboxDto;

@Repository
public class MailboxDaoImpl implements MailboxDao{

	@Autowired
	SqlSessionTemplate sql;
	
	@Override
	public List<MailboxDto> getList(Criteria cri) {
		return sql.selectList(namespace + "getListWithPaging", cri);
	}

	@Override
	public void addMail(MailboxDto mail) {
		sql.insert(namespace + "addMail", mail);
	}
	
	@Override
	public void insertSelectKey(MailboxDto mail) {
		sql.insert(namespace + "insertSelectKey", mail);
	}
	
	@Override
	public MailboxDto getMail(int bno) {
		return sql.selectOne(namespace + "getMail", bno);
	}
	
	@Override
	public boolean deleteMail(int bno) {
		return sql.delete(namespace + "deleteMail", bno) == 1;
	}

	@Override
	public boolean updateMail(MailboxDto mail) {
		return sql.update(namespace + "updateMail", mail) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		return sql.selectOne(namespace + "getTotalCount", cri);
	}

	

}
