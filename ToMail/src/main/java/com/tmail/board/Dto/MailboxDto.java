package com.tmail.board.Dto;

import java.util.Date;
import java.util.List;

public class MailboxDto {
	/*
	CREATE TABLE TBL_MAILBOX(
			BNO NUMBER,
			MNO NUMBER,
			WRITER VARCHAR2(50),
			RECIPIENT VARCHAR2(255),
			TITLE1 VARCHAR2(255),
			TITLE2 VARCHAR2(255),
			TEXT1 VARCHAR2(2000),
			TEXT2 VARCHAR2(2000),
			TEXT3 VARCHAR2(2000),
			IMG1 VARCHAR2(100),
			IMG2 VARCHAR2(100),
			IMG3 VARCHAR2(100),
			LINK1 VARCHAR2(100),
			LINK2 VARCHAR2(100),
			LINK3 VARCHAR2(100),
			REGDATE DATE DEFAULT SYSDATE
		);
	*/
	
	private int bno;
	private int mno;
	private int template;
	private String writer;
	private String recipient;
	private String title1;
	private String title2;
	private String text1;
	private String text2;
	private String text3;
	private String img1;
	private String img2;
	private String img3;
	private String link1;
	private String link2;
	private String link3;
	private Date regdate;
	
	
	private List<MailboxAttachDto> attachList;
	
	public MailboxDto() {
		super();
	}
	
	

	public MailboxDto(int bno, int mno, String writer, String recipient, String title1, String title2, String text1,
			String text2, String text3, String img1, String img2, String img3, String link1, String link2, String link3,
			Date regdate, List<MailboxAttachDto> attachList) {
		super();
		this.bno = bno;
		this.mno = mno;
		this.writer = writer;
		this.recipient = recipient;
		this.title1 = title1;
		this.title2 = title2;
		this.text1 = text1;
		this.text2 = text2;
		this.text3 = text3;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.link1 = link1;
		this.link2 = link2;
		this.link3 = link3;
		this.regdate = regdate;
		this.attachList = attachList;
	}

	

	public int getBno() {
		return bno;
	}



	public void setBno(int bno) {
		this.bno = bno;
	}



	public int getMno() {
		return mno;
	}



	public void setMno(int mno) {
		this.mno = mno;
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



	public String getTitle1() {
		return title1;
	}



	public void setTitle1(String title1) {
		this.title1 = title1;
	}



	public String getTitle2() {
		return title2;
	}



	public void setTitle2(String title2) {
		this.title2 = title2;
	}



	public String getText1() {
		return text1;
	}



	public void setText1(String text1) {
		this.text1 = text1;
	}



	public String getText2() {
		return text2;
	}



	public void setText2(String text2) {
		this.text2 = text2;
	}



	public String getText3() {
		return text3;
	}



	public void setText3(String text3) {
		this.text3 = text3;
	}



	public String getImg1() {
		return img1;
	}



	public void setImg1(String img1) {
		this.img1 = img1;
	}



	public String getImg2() {
		return img2;
	}



	public void setImg2(String img2) {
		this.img2 = img2;
	}



	public String getImg3() {
		return img3;
	}



	public void setImg3(String img3) {
		this.img3 = img3;
	}



	public String getLink1() {
		return link1;
	}



	public void setLink1(String link1) {
		this.link1 = link1;
	}



	public String getLink2() {
		return link2;
	}



	public void setLink2(String link2) {
		this.link2 = link2;
	}



	public String getLink3() {
		return link3;
	}



	public void setLink3(String link3) {
		this.link3 = link3;
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



	public int getTemplate() {
		return template;
	}



	public void setTemplate(int template) {
		this.template = template;
	}

	
}
