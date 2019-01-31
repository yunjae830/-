package com.tmail.board.Dto;

import java.util.List;

public class TestDto {

   private List<String> email;
   private String title;
   private String content;
   
   String template1 = "<html><body style=\"box-sizing: border-box;\"><h2>CSS Layout Flexbox</h2>" + 
   		"<p style=\"font-size: 20px; font-family: verdana;\">In this example, we have created a header, two columns/boxes and a footer. On smaller screens, the columns will stack on top of each other.</p>" + 
   		"<p>Resize the browser window to see the responsive effect.</p>" + 
   		"<p><strong>Note:</strong> Flexbox is not supported in Internet Explorer 10 eand earlier versions.</p>" + 
   		"<div><header style=\"background-color: #666; padding: 20px; text-align: center; font-size: 30px; color: white;\"><h2>";
   
   String template2 = "</h2></header><section style=\"display: -webkit-flex; display: flex;\">" + 
   		"<nav style=\"-webkit-flex: 1; -ms-flex: 1; flex: 1; background: #ccc; padding: 20px;\">" + 
   		"<ul style=\"list-style-type: none; padding: 0;\">" + 
   		"<li><a href=\"#\">London</a></li><li><a href=\"#\">Paris</a></li><li><a href=\"#\">Tokyo</a></li>\r\n" + 
   		"</ul></nav><article style=\"-webkit-flex: 3; -ms-flex: 3; flex: 3; background-color: #f1f1f1; padding: 10px;\">" + 
   		"<h1>Content title</h1><p>";
   
   String template3 = "</p></article></section><footer style=\"background-color: #777; padding: 30px; text-align: center; color: white;\"><b style=\"font-family:sans-serif; font-size: 20px;\">Footer</b>" + 
   		"</footer></div></body></html>";
   
   public String getTemplate1() {
	return template1;
   }
   public String getTemplate2() {
	return template2;
   }
   public String getTemplate3() {
	return template3;
   }
   
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