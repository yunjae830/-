package com.tmail.board.Dto;

public class HelpDto {

   private int help_seq;
   private String help_title;
   private String help_title_detail;
   private String members_name;
   public int getHelp_seq() {
      return help_seq;
   }
   public void setHelp_seq(int help_seq) {
      this.help_seq = help_seq;
   }
   public String getHelp_title() {
      return help_title;
   }
   public void setHelp_title(String help_title) {
      this.help_title = help_title;
   }
   public String getHelp_title_detail() {
      return help_title_detail;
   }
   public void setHelp_title_detail(String help_title_detail) {
      this.help_title_detail = help_title_detail;
   }
   public String getMembers_name() {
      return members_name;
   }
   public void setMembers_name(String members_name) {
      this.members_name = members_name;
   }
   @Override
   public String toString() {
      return "helpDto [help_seq=" + help_seq + ", help_title=" + help_title + ", help_title_detail="
            + help_title_detail + ", members_name=" + members_name + "]";
   }
}