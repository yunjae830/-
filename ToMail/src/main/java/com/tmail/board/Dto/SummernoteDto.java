package com.tmail.board.Dto;

import java.util.Date;
import java.util.List;

import oracle.sql.CLOB;

public class SummernoteDto {

	private int bulid_seq;
	private String build_content;
	private String build_summer;
	private Date build_date;
	private List<String> email;
	
	
	public List<String> getEmail() {
		return email;
	}
	public void setEmail(List<String> email) {
		this.email = email;
	}
	public int getBulid_seq() {
		return bulid_seq;
	}
	public void setBulid_seq(int bulid_seq) {
		this.bulid_seq = bulid_seq;
	}
	public String getBuild_content() {
		return build_content;
	}
	public void setBuild_content(String build_content) {
		this.build_content = build_content;
	}
	public String getBuild_summer() {
		return build_summer;
	}
	public void setBuild_summer(String build_summer) {
		this.build_summer = build_summer;
	}
	public Date getBuild_date() {
		return build_date;
	}
	public void setBuild_date(Date build_date) {
		this.build_date = build_date;
	}
	@Override
	public String toString() {
		return "summernoteDto [bulid_seq=" + bulid_seq + ", build_content=" + build_content + ", build_summer="
				+ build_summer + ", build_date=" + build_date + "]";
	}
}
