package com.tmail.board.Dto;

import java.util.Date;
import java.util.List;

public class MailboxDto {
	/*
	CREATE TABLE TBL_MAILBOX(
	BNO NUMBER,
	TEMPLATE VARCHAR2(100),
	EMAIL VARCHAR2(255),
	TITLE VARCHAR2(255),
	CONTENT VARCHAR2(2500),
	REGDATE DATE DEFAULT SYSDATE
);
	*/
	
	private int bno;
	private String template;
	private String title;
	private String content;
	private Date regdate;
	
	
	private List<MailboxAttachDto> attachList;


	public MailboxDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public MailboxDto(int bno, String template, String title, String content, Date regdate,
			List<MailboxAttachDto> attachList) {
		super();
		this.bno = bno;
		this.template = template;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.attachList = attachList;
	}


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public String getTemplate() {
		return template;
	}


	public void setTemplate(String template) {
		this.template = template;
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


	public List<MailboxAttachDto> getAttachList() {
		return attachList;
	}


	public void setAttachList(List<MailboxAttachDto> attachList) {
		this.attachList = attachList;
	}
	
}
