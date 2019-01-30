package com.tmail.board.Dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tmail.board.Dao.MailboxAttachDao;
import com.tmail.board.Dto.MailboxAttachDto;

@Repository
public class MailboxAttachDaoImpl implements MailboxAttachDao{
	
	@Autowired
	SqlSessionTemplate sql;

	@Override
	public void insert(MailboxAttachDto attach) {
		sql.insert(namespace + "insert", attach);
	}

	@Override
	public void delete(String uuid) {
		sql.delete(namespace + "delete", uuid);
	}

	@Override
	public List<MailboxAttachDto> findByBno(int bno) {
		return sql.selectList(namespace + "findByBno", bno);
	}

	@Override
	public void deleteAll(int bno) {
		sql.delete(namespace + "deleteAll", bno);
	}
	
}
