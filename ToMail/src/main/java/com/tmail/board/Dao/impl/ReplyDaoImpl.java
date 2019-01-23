package com.tmail.board.Dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tmail.board.Dao.ReplyDao;
import com.tmail.board.Dto.Criteria;
import com.tmail.board.Dto.ReplyDto;


@Repository
public class ReplyDaoImpl implements ReplyDao{

	@Autowired
	SqlSessionTemplate sql;
	
	@Override
	public int insert(ReplyDto dto) {
		return sql.insert(namespace + "insert", dto);
	}

	@Override
	public ReplyDto read(Long bno) {
		return sql.selectOne(namespace + "read", bno);
	}

	@Override
	public int delete(Long bno) {
		return sql.delete(namespace + "delete", bno);
	}

	@Override
	public int update(ReplyDto dto) {
		return sql.update(namespace + "update", dto);
	}

	@Override
	public List<ReplyDto> getListWithPaging(Criteria cri, Long bno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("bno", bno);
		return sql.selectList(namespace + "getListWithPaging", map);
	}

	@Override
	public int getCountByBno(Long bno) {
		return sql.selectOne(namespace + "getCountByBno", bno);
	}
}
