package com.tmail.board.Dto;

import java.util.List;

public class AddressDto {

   private int customer_seq;
   private String customer_name;
   private String customer_email;
   private int group_seq;
   private int members_seq;
   private String all_cus_seq;
   
   private List<String> email_list;
   
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
   
   public int getGroup_seq() {
      return group_seq;
   }
   public void setGroup_seq(int group_seq) {
      this.group_seq = group_seq;
   }
   public int getMembers_seq() {
      return members_seq;
   }
   public void setMembers_seq(int members_seq) {
      this.members_seq = members_seq;
   }
   public String getAll_cus_seq() {
	return all_cus_seq;
   }
   public void setAll_cus_seq(String all_cus_seq) {
	this.all_cus_seq = all_cus_seq;
	
	
   }
public List<String> getEmail_list() {
	return email_list;
}
public void setEmail_list(List<String> email_list) {
	this.email_list = email_list;
}
@Override
   public String toString() {
      return "Email [customer_seq=" + customer_seq + ", customer_name=" + customer_name + ", customer_email="
            + customer_email + ", members_seq=" + "]";
   }
}