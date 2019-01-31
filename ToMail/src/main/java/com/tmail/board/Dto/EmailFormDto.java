package com.tmail.board.Dto;

public class EmailFormDto {
	
	String htmlHead;
	String htmlBody;
	String htmlFooter;
	String content1;
	String content2;
	String content3;
	
	public EmailFormDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EmailFormDto(String htmlHead, String htmlBody, String htmlFooter, String content1, String content2,
			String content3) {
		super();
		this.htmlHead = htmlHead;
		this.htmlBody = htmlBody;
		this.htmlFooter = htmlFooter;
		this.content1 = content1;
		this.content2 = content2;
		this.content3 = content3;
	}

	public String getHtmlHead() {
		return htmlHead;
	}

	public void setHtmlHead(String htmlHead) {
		this.htmlHead = htmlHead;
	}

	public String getHtmlBody() {
		return htmlBody;
	}

	public void setHtmlBody(String htmlBody) {
		this.htmlBody = htmlBody;
	}

	public String getHtmlFooter() {
		return htmlFooter;
	}

	public void setHtmlFooter(String htmlFooter) {
		this.htmlFooter = htmlFooter;
	}

	public String getContent1() {
		return content1;
	}

	public void setContent1(String content1) {
		this.content1 = content1;
	}

	public String getContent2() {
		return content2;
	}

	public void setContent2(String content2) {
		this.content2 = content2;
	}

	public String getContent3() {
		return content3;
	}

	public void setContent3(String content3) {
		this.content3 = content3;
	}

}
