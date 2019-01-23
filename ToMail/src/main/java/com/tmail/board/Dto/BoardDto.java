package com.tmail.board.Dto;


import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BoardDto {
/*	
	CREATE TABLE BOARD(
			SEQNO NUMBER PRIMARY KEY,
			NAME VARCHAR2(25),
			TITLE VARCHAR2(50),
			CONTENT VARCHAR2(250),
			REGDATE DATE
		);
*/
	
	private int seqno;
	private String name;
	private String title;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regdate;
	
	public BoardDto() {
		super();
	}
	
	// insert
	public BoardDto(String name, String title, String content) {
		super();
		this.name = name;
		this.title = title;
		this.content = content;
	}

	// update
	public BoardDto(int seqno, String title, String content) {
		super();
		this.seqno = seqno;
		this.title = title;
		this.content = content;
	}

	public int getSeqno() {
		return seqno;
	}

	public void setSeqno(int seqno) {
		this.seqno = seqno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
