package com.tmail.board.Dto;

import org.springframework.web.util.UriComponentsBuilder;

//import static org.springframework.test.web.client.match.MockRestRequestMatchers.queryParam;


public class Criteria {
	
	private int pageNum;
	private int amount;
	
	MailboxDto mailbox = new MailboxDto();
	
	public Criteria() {
		this(1, 5);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
		.queryParam("pageNum", this.pageNum)
		.queryParam("amount", this.getAmount());
		
		return builder.toUriString();
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

}
