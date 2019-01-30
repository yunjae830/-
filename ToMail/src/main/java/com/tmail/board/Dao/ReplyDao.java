package com.tmail.board.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tmail.board.Dto.Criteria;
import com.tmail.board.Dto.ReplyDto;


public interface ReplyDao {
	
	String namespace = "reply.";
	
	int insert(ReplyDto dto);
	ReplyDto read(Long bno);
	int delete(Long bno);
	int update(ReplyDto dto);
	List<ReplyDto> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	public int getCountByBno(Long bno);

}
