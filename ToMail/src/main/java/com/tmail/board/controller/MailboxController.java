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
import com.tmail.board.Dto.AddressDto;
import com.tmail.board.Dto.Criteria;
import com.tmail.board.Dto.MailboxAttachDto;
import com.tmail.board.Dto.MailboxDto;
import com.tmail.board.Dto.PageDto;
import com.tmail.board.Dto.RegisterDto;

@Controller
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
	public String getList(Criteria cri, String email, Model model) {
		model.addAttribute("email", email);
		model.addAttribute("list", biz.getList(cri, email));
		int total = biz.getTotal(cri, email);
		model.addAttribute("pageMaker", new PageDto(cri, total));
		return "getList";
	}
	
	@RequestMapping("/getTemplates")
	public String getTemplate(String email, Model model) {
		model.addAttribute("template", biz.getTemplates(email));
		return "templates";
	}
	
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<MailboxAttachDto>> getAttachList(int bno){
		return new ResponseEntity<>(biz.getAttachList(bno), HttpStatus.OK);
	}
	
	@RequestMapping(value= "/updateMail", method=RequestMethod.GET)
	public String updateMail(MailboxDto mail, int bno, String email, Criteria cri, Model model, HttpServletResponse response) {
		model.addAttribute("mail", biz.getMail(bno));
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		return "templateBuilder_view";
	}
	
	
	@RequestMapping(value="/addMail", method=RequestMethod.POST)
	public String addMail(MailboxDto mail, String email, RedirectAttributes rttr, Criteria cri) {
		biz.addMail(mail);
		rttr.addAttribute("email", email);
		return "redirect: /mailbox/getTemplates";
	}
	
	
	@RequestMapping(value="/updateMail", method=RequestMethod.POST)
	public String updateMail(MailboxDto mail, Criteria cri, RedirectAttributes rttr, String email,
			String template, HttpServletResponse response, AddressDto addr) throws MessagingException, IOException {
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		
		messageHelper.setFrom("jea830@hanmail.net");
		messageHelper.setTo(addr.getCustomer_email());
		messageHelper.setSubject(mail.getTitle());
		messageHelper.setText(mail.getContent(), true);
		
		
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
			rttr.addAttribute("email", email);
		}
		
		return "redirect: /mailbox/getList" + cri.getListLink();
	}
	
	
	
	@RequestMapping(value="/deleteMail")
	public String deleteMail(@RequestParam("bno") int bno, String email, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		List<MailboxAttachDto> attachList = biz.getAttachList(bno);
		
		if(biz.deleteMail(bno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
			rttr.addAttribute("email", email);
		}
		
		return "redirect: /mailbox/getList" + cri.getListLink();
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
