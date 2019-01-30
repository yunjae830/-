package com.tmail.board.Biz;

import com.tmail.board.Dto.Criteria;
import com.tmail.board.Dto.ReplyDto;
import com.tmail.board.Dto.ReplyPageDto;


public interface ReplyBiz {
	
	int register(ReplyDto dto);
	ReplyDto get(Long rno);
	int modify (ReplyDto dto);
	int remove(Long rno);
//	List<ReplyDto> getList(Criteria cri, Long bno);
	ReplyPageDto getListPage(Criteria cri, Long bno);

}
