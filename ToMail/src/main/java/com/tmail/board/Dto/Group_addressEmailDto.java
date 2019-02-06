package com.tmail.board.Dto;

public class Group_addressEmailDto {

	private String group_address_email;
	private int members_seq;
	private int group_seq;
	
	public String getGroup_address_email() {
		return group_address_email;
	}
	public void setGroup_address_email(String group_address_email) {
		this.group_address_email = group_address_email;
	}
	public int getMembers_seq() {
		return members_seq;
	}
	public void setMembers_seq(int members_seq) {
		this.members_seq = members_seq;
	}
	public int getGroup_seq() {
		return group_seq;
	}
	public void setGroup_seq(int group_seq) {
		this.group_seq = group_seq;
	}
	@Override
	public String toString() {
		return "Group_addressEmailDto [group_address_email=" + group_address_email + ", members_seq=" + members_seq
				+ ", group_seq=" + group_seq + "]";
	}
}
