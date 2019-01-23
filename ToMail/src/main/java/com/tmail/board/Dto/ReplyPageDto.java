package com.tmail.board.Dto;

import java.util.List;

public class ReplyPageDto {
	
	private int replyCnt;
	private List<ReplyDto> list;
	
	public ReplyPageDto(int replyCnt, List<ReplyDto> list) {
		super();
		this.replyCnt = replyCnt;
		this.list = list;
	}

	public ReplyPageDto() {
		super();
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}

	public List<ReplyDto> getList() {
		return list;
	}

	public void setList(List<ReplyDto> list) {
		this.list = list;
	}

}
