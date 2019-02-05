package com.tmail.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tmail.board.Biz.MailboxBiz;
import com.tmail.board.Biz.RegisterBiz;
import com.tmail.board.Dto.Criteria;
import com.tmail.board.Dto.MailboxAttachDto;
import com.tmail.board.Dto.MailboxDto;
import com.tmail.board.Dto.PageDto;
import com.tmail.board.Dto.RegisterDto;

@Controller
@RequestMapping("/mailbox")
public class MailboxController {

	@Autowired
	MailboxBiz biz;
	
	@Autowired
	RegisterBiz regBiz;
	
	@Autowired
	JavaMailSender mailSender;
	
	RegisterDto regDto = new RegisterDto();
	
	@RequestMapping("/mailForm")
	public String getFileForm() {
		return "mailFormTest";
	}
	
	@RequestMapping("/getList")
	public String getList(Criteria cri, @RequestParam("mno") int mno, Model model) {
		model.addAttribute("list", biz.getList(cri, mno));
		int total = biz.getTotal(cri, mno);
		model.addAttribute("pageMaker", new PageDto(cri, total));
		return "getList";
	}
	
	@RequestMapping("/getTemplates")
	public String getTemplate(int mno, Model model) {
		model.addAttribute("template", biz.getTemplates(mno));
		return "templates";
	}
	
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<MailboxAttachDto>> getAttachList(int bno){
		return new ResponseEntity<>(biz.getAttachList(bno), HttpStatus.OK);
	}
	
	@RequestMapping(value= "/updateMail", method=RequestMethod.GET)
	public String updateMail(MailboxDto mail, int bno, int mno, int template, Criteria cri, Model model) {
		model.addAttribute("mail", biz.getMail(bno));
		
			if(template == 1) {
				return "template1";
			} else if(template ==2) {
				return "template2";
			} else if(template ==3) {
				return "template3";
			} else if(template ==4) {
				return "template4";
			} else if(template ==5) {
				return "template5";
			}
		
		return "updateMailTest";
	}
	
	
	@RequestMapping(value="/addMail", method=RequestMethod.POST)
	public String addMail(MailboxDto mail, int mno, RedirectAttributes rttr, Criteria cri) {
		biz.addMail(mail);
		rttr.addAttribute("mno", mno);
		return "redirect: /board/mailbox/getTemplates";
	}
	
	
	@RequestMapping(value="/updateMail", method=RequestMethod.POST)
	public String updateMail(MailboxDto mail, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, int mno,
			int template, HttpServletResponse response) throws MessagingException, IOException {
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		
		messageHelper.setFrom("jea830@hanmail.net");
		messageHelper.setTo("highkick89@naver.com");
		messageHelper.setSubject(mail.getTitle1());
		if(template == 1) {
		messageHelper.setText(
					"<body>\r\n" + 
					"\r\n" + 
					"	  <div style=\"margin-top: 30px;\" align=\"center\">"+		
					"<table style=\"font-family:'Times New Roman', Times, serif; background-color: #F5F5F5;\">\r\n" + 
					"  			<tr>\r\n" + 
					"  				<td style=\"background-color: #F5F5F5;\">\r\n" + 
					"  			</tr>\r\n" + 
					"  			\r\n" + 
					"  			<tr>\r\n" + 
					"  				<td style=\"background-color: #F5F5F5;\">\r\n" + 
					"		  			<header style=\"text-align: center; font-size: 30px;\">\r\n" + 
					"		  				<p>"
					+ 
					mail.getTitle1()
					+ "</p>\r\n" + 
					"		  			</header>\r\n" + 
					"  				</td>\r\n" + 
					"  			</tr>\r\n" + 
					"  			\r\n" + 
					"  			<tr>\r\n" + 
					"				<td style=\"background-color: #F5F5F5; height: 500px\">\r\n" + 
					"					<div style=\"column-count:2; width: 800px; word-wrap: break-word; font-size: 20px\">\r\n" + 
					""
					+ 
					mail.getText1()
					+ "\r\n" + 
					"					</div>\r\n" + 
					"				</td>\r\n" + 
					"	  				\r\n" + 
					"			</tr>\r\n" + 
					"			<tr>\r\n" + 
					"				<td style=\"height: 200px; background-color: #F5F5F5;\" class=\"uploadResult\">\r\n" + 
					"					<ul>\r\n" + 
					"					</ul>\r\n" + 
					"				</td>\r\n" + 
					"			</tr>\r\n" + 
					"			\r\n" + 
					"			<tr>\r\n" + 
					"				<td style=\"height: 200px;\">\r\n" + 
					"					<footer style=\"background-color: #F5F5F5; text-align: center;\">\r\n" + 
					"		  				<b style=\"font-family:sans-serif; font-size: 20px;\">"
					+ 
					mail.getText2()
					+ "</b>\r\n" + 
					"		  				<b style=\"font-size: 19px;\"><a href=\""
					+ 
					mail.getLink1()
					+ "\">Go to our page!</a></b>\r\n" + 
					"					</footer>\r\n" + 
					"				</td>\r\n" + 
					"			</tr>\r\n" + 
					"  		</table>" + "</div>\r\n" + 
							"\r\n" + 
							"</body>"
									, true);
		} else if (template == 2) {
			messageHelper.setText(
					"<body><table style=\"width: 600px\"><tr><td style=\"position: relative;\">\r\n" + 
					"      <img alt=\"\" src=\"http://localhost:8787/board/resources/img/bg.png\" style=\" width: 570px; height: 330px; background-size: 100% 100%; margin: 10px 15px 10px 15px; position: relative;\">\r\n" + 
					"      <div><h1 align=\"center\" class=\"title1\"><b>"
					+ mail.getTitle1()
					+ "</b></h1>\r\n" + 
					"         <h3 align=\"center\" id=\"text-block\" class=\"title2\">"
					+ mail.getTitle2()
					+ "</h3>\r\n" + 
					"      </div>\r\n" + 
					"      </td>\r\n" + 
					"   </tr>\r\n" + 
					"      <tr>\r\n" + 
					"         <td align=\"center\">\r\n" + 
					"         <a class=\"link1\" href=\""
					+ mail.getLink1()
					+ "\" style=\"background-color: #040047; -moz-border-radius: 42px; -webkit-border-radius: 42px; border-radius: 42px; display: inline-block; cursor: pointer; color: #ffffff; font-family: Arial; font-size: 15px; padding: 12px 53px; text-decoration: none; text-shadow: 0px 0px 0px #2f6627;\">버튼</a>\r\n" + 
					"         </td>\r\n" + 
					"      </tr>\r\n" + 
					"      <tr>\r\n" + 
					"         <td style=\"width: 570px; padding: 0px 30px 0px 15px;\"><hr></td>\r\n" + 
					"      </tr>\r\n" + 
					"      <tr>\r\n" + 
					"         <td>\r\n" + 
					"         <img alt=\"\" src=\"http://localhost:8787/board/resources/img/bg.png\"\r\n" + 
					"            style=\"width: 285px; height: 190px; background-size: 100% 100%; margin: 10px 5px 10px 10px; position: relative;\">\r\n" + 
					"            <span class=\"text1\"\r\n" + 
					"               style=\"display: inline-block; word-wrap: break-word; width: 280px; height: 185px; background-size: 100% 100%; margin: 10px 10px 10px 0px; border-color: white; font-size: 15px;\">\r\n" + 
					"               "
					+ mail.getText1()
					+ "</span>\r\n" + 
					"         </td>\r\n" + 
					"      </tr>\r\n" + 
					"      <tr>\r\n" + 
					"         <td><span class=\"text2\"\r\n" + 
					"               style=\"display: inline-block; word-wrap: break-word; width: 280px; height: 185px; background-size: 100% 100%; margin: 0px 5px 10px 10px; border-color: white; font-size: 15px; word-wrap:break-word;\">"
					+ mail.getText2()
					+ "</span>\r\n" + 
					"            <img alt=\"\" src=\"http://localhost:8787/board/resources/img/bg.png\"\r\n" + 
					"            style=\"width: 285px; height: 190px; background-size: 100% 100%; margin: 0px 10px 10px 0px; position: relative;\" align=\"right\">\r\n" + 
					"         </td>\r\n" + 
					"      </tr>\r\n" + 
					"      <tr>\r\n" + 
					"         <td><img alt=\"\" src=\"http://localhost:8787/board/resources/img/bg.png\"\r\n" + 
					"            style=\"width: 285px; height: 190px; background-size: 100% 100%; margin: 10px 5px 10px 10px; position: relative;\">\r\n" + 
					"            <span class=\"text3\"\r\n" + 
					"               style=\"display: inline-block; word-wrap: break-word; width: 280px; height: 185px; background-size: 100% 100%; margin: 10px 10px 10px 0px; border-color: white; font-size: 15px; word-wrap: break-word;\">"
					+ mail.getText3()
					+ "</span>\r\n" + 
					"\r\n" + 
					"         </td>\r\n" + 
					"      </tr>\r\n" + 
					"      <tr>\r\n" + 
					"         <td style=\"width: 570px; padding: 0px 30px 0px 15px;\"><hr></td>\r\n" + 
					"      </tr>\r\n" + 
					"      <tr>\r\n" + 
					"         <td>\r\n" + 
					"            <div align=\"center\"style=\"background-color: #040047; width: 570px; height: 60px; background-size: 100% 100%; margin: 10px 15px 10px 15px; padding: 20px 0 20px 0; vertical-align: center;\">\r\n" + 
					"               <a style=\"font-size: 18px; color: white;\"><fmt:formatDate value=\""
					+ mail.getRegdate()
					+ "\" pattern=\"yyyy-MM-dd\"/></a><br> \r\n" + 
					"               <b style=\"font-size: 28px; color: white;\"></b>\r\n" + 
					"            </div>\r\n" + 
					"\r\n" + 
					"         </td>\r\n" + 
					"      </tr>\r\n" + 
					"      <tr>\r\n" + 
					"         <td>\r\n" + 
					"            <div align=\"center\" style='display: inline;line-height:60px; min-width: 600px;'>\r\n" + 
					"               <div class=\"link2\"\r\n" + 
					"                  style=\" display: inline; float: left; background-color: #005DC9; color: white; width: 280px; height: 60px; margin: 0px 10px 10px 15px; cursor: pointer;\" onclick=\"location.href='"
					+ mail.getLink2()
					+ "'\">Facebook</div>\r\n" + 
					"               <div class=\"link3\"\r\n" + 
					"                  style=\"display: inline; float: left; background-color: black; width: 280px; height: 60px; margin: 0px 15px 10px 0px; color: white; cursor: pointer;\" onclick=\"location.href='"
					+ mail.getLink3()
					+ "'\">Instagram</div>\r\n" + 
					"            </div>\r\n" + 
					"         </td>\r\n" + 
					"      </tr>\r\n" + 
					"      <tr>\r\n" + 
					"         <td>\r\n" + 
					"            <div align=\"center\" style=\"margin-top: 10px; margin-bottom: 10px;\">\r\n" + 
					"               <img alt=\"\" src=\"http://localhost:8787/board/resources/img/home.png\" width=\"32px\" style=\"padding-right: 15px;\">\r\n" + 
					"            </div>\r\n" + 
					"         </td>\r\n" + 
					"      </tr>\r\n" + 
					"      <tr>\r\n" + 
					"         <td>\r\n" + 
					"         <div align=\"center\">\r\n" + 
					"             <small style=\"padding-right: 15px; color: #8C8C8C;\">이 이메일은 투메일로 작성되었습니다.</small>\r\n" + 
					"          </div>\r\n" + 
					"         </td>\r\n" + 
					"      </tr>\r\n" + 
					"   </table>" +
					"</body>"
									, true);
		}
		
		mailSender.send(message);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = null;
		out = response.getWriter();
		out.println("<script>alert('sent!');</script>");
		
		if(mail.getAttachList() !=null) {
			mail.getAttachList().forEach(attach-> System.out.println(attach));
		}
		
		if(biz.updateMail(mail)) {
			rttr.addFlashAttribute("result", "success");
			rttr.addAttribute("mno", mno);
		}
		
		return "redirect: /board/mailbox/getList" + cri.getListLink();
	}
	
	
	
	@RequestMapping(value="/deleteMail")
	public String deleteMail(@RequestParam("bno") int bno, int mno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		List<MailboxAttachDto> attachList = biz.getAttachList(bno);
		
		if(biz.deleteMail(bno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
			rttr.addAttribute("mno", mno);
		}
		
		return "redirect: /board/mailbox/getList" + cri.getListLink();
	}
	
	private void deleteFiles(List<MailboxAttachDto> attachList) {
		
		if(attachList == null || attachList.size() == 0){
			return;
		}
		
		attachList.forEach(attach -> {
			
			try {
				Path file = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
					
					Files.delete(thumbNail);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Delete file error : " + e.getMessage());
			}
			
			
		});
		
		
	}
	
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, value="/preview",
			consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> preview(@RequestBody MailboxDto dto, @RequestParam("bno") int bno) {
		dto.setBno(bno);
		
		return biz.updateMail(dto)
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@RequestMapping(value="/showPreview", produces= {MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public ResponseEntity<MailboxDto> showPreview(@RequestParam("bno") int bno){
		return new ResponseEntity<>(biz.getMail(bno), HttpStatus.OK);
	}
	
	
}
