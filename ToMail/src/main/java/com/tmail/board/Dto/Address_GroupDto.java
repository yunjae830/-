package com.tmail.board.Dto;

import java.util.Date;
import java.util.List;

public class Address_GroupDto {
   
   private int group_seq;
   private String group_title;
   private Date group_date;
   private int members_seq;
   private int cnt;
   
   public void setMembers_seq(int members_seq) {
      this.members_seq = members_seq;
   }


   public int getGroup_seq() {
      return group_seq;
   }


   public void setGroup_seq(int group_seq) {
      this.group_seq = group_seq;
   }


   public String getGroup_title() {
      return group_title;
   }


   public void setGroup_title(String group_title) {
      this.group_title = group_title;
   }


   public Date getGroup_date() {
      return group_date;
   }


   public void setGroup_date(Date group_date) {
      this.group_date = group_date;
   }


   public int getMembers_seq() {
      return members_seq;
   }


   public void setMember_seq(int member_seq) {
      this.members_seq = member_seq;
   }

   public int getCnt() {
      return cnt;
   }


   public void setCnt(int cnt) {
      this.cnt = cnt;
   }


   @Override
   public String toString() {
      return "Address_GroupDto [group_seq=" + group_seq + ", group_title=" + group_title + ", group_date="
            + group_date + ", members_seq=" + members_seq + ", cnt=" + cnt + "]";
   }

   
}