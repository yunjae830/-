package com.tmail.board.Dto;

public class AddressDto {

	private int customer_seq;
	private String customer_name;
	private String customer_email;
	private int members_seq;
	
	public int getCustomer_seq() {
		return customer_seq;
	}
	public void setCustomer_seq(int customer_seq) {
		this.customer_seq = customer_seq;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public int getMember_seq() {
		return members_seq;
	}
	public void setMember_seq(int member_seq) {
		this.members_seq = member_seq;
	}
	@Override
	public String toString() {
		return "Email [customer_seq=" + customer_seq + ", customer_name=" + customer_name + ", customer_email="
				+ customer_email + ", members_seq=" + "]";
	}
}
