package com.tmail.board.Biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmail.board.Biz.ReplyBiz;
import com.tmail.board.Dao.ReplyDao;
import com.tmail.board.Dto.Criteria;
import com.tmail.board.Dto.ReplyDto;
import com.tmail.board.Dto.ReplyPageDto;


@Service
public class ReplyBizImpl implements ReplyBiz{

	@Autowired
	ReplyDao dao;
	
	@Override
	public int register(ReplyDto dto) {
		return dao.insert(dto);
	}

	@Override
	public ReplyDto get(Long rno) {
		return dao.read(rno);
	}

	@Override
	public int modify(ReplyDto dto) {
		return dao.update(dto);
	}

	@Override
	public int remove(Long rno) {
		return dao.delete(rno);
	}

//	@Override
//	public List<ReplyDto> getList(Criteria cri, Long bno) {
//		return dao.getListWithPaging(cri, bno);
//	}

	@Override
	public ReplyPageDto getListPage(Criteria cri, Long bno) {
		return new ReplyPageDto(dao.getCountByBno(bno), dao.getListWithPaging(cri, bno));
	}

}
