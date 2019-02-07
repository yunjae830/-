package com.tmail.board.Dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<MailboxDto> getList(Criteria cri, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("email", email);
		return sql.selectList(namespace + "getListWithPaging", map);
	}
	
	@Override
	public int getTotal(String email) {
		return sql.selectOne(namespace + "getCountByEmail", email);
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
	public List<MailboxDto> getTemplates(String email) {
		return sql.selectList(namespace + "getTemplates", email);
	}

	

	

}
