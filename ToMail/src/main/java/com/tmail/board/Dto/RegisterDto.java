package com.tmail.board.Dto;

public class RegisterDto {
	
	private int members_seq;
	private String members_email;
	private String members_name;
	private String members_pw;
	private int login_check;
   
   public int getMembers_seq() {
	return members_seq;
   }
   public void setMembers_seq(int members_seq) {
	this.members_seq = members_seq;
   }
   public int getLogin_check() {
      return login_check;
   }
   public void setLogin_check(int login_check) {
      this.login_check = login_check;
   }
   public String getMembers_email() {
      return members_email;
   }
   public void setMembers_email(String members_email) {
      this.members_email = members_email;
   }
   public String getMembers_name() {
      return members_name;
   }
   public void setMembers_name(String members_name) {
      this.members_name = members_name;
   }
   public String getMembers_pw() {
      return members_pw;
   }
   public void setMembers_pw(String members_pw) {
      this.members_pw = members_pw;
   }
   @Override
   public String toString() {
      return "joinVO [members_email=" + members_email + ", members_name=" + members_name + ", members_pw="
            + members_pw + "]";
   }
}