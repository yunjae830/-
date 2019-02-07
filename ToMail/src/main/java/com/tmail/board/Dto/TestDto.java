package com.tmail.board.Dto;

import java.util.List;

public class TestDto {

   private List<String> email;
   private String title;
   private String content;
   
   
   public List<String> getEmail() {
      return email;
   }
   public void setEmail(List<String> email) {
      this.email = email;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   @Override
   public String toString() {
      return "testDto [email=" + email + ", title=" + title + ", content=" + content + "]";
   }
   
   
}