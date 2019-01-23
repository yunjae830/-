package com.tmail.board.Dto;

import java.util.Date;

public class MailboxDto {
/*	
	CREATE TABLE TBL_MAILBOX(
			BNO NUMBER(10, 0),
			WRITER VARCHAR2(50),
			RECIPIENT VARCHAR2(50),
			TITLE VARCHAR2(200),
			CONTENT VARCHAR2(2000),
			REGDATE DATE DEFAULT SYSDATE
		);
*/
	
	private int bno;
	private String writer;
	private String recipient;
	private String title;
	private String content;
	private Date regdate;
	
	public MailboxDto() {
		super();
	}
	
	public MailboxDto(int bno, String writer, String recipient, String title, String content, Date regdate) {
		super();
		this.bno = bno;
		this.writer = writer;
		this.recipient = recipient;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
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
