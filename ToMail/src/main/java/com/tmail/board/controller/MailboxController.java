package com.tmail.board.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tmail.board.Biz.MailboxBiz;
import com.tmail.board.Dto.Criteria;
import com.tmail.board.Dto.MailboxAttachDto;
import com.tmail.board.Dto.MailboxDto;
import com.tmail.board.Dto.PageDto;

@Controller
@RequestMapping("/mailbox")
public class MailboxController {

	@Autowired
	MailboxBiz biz;
	
	@RequestMapping("/file")
	public String getFileForm() {
		return "file";
	}
	
	@RequestMapping("/getList")
	public String getList(Criteria cri, Model model) {
		model.addAttribute("list", biz.getList(cri));
		int total = biz.getTotal(cri);
		model.addAttribute("pageMaker", new PageDto(cri, total));
		return "getList";
	}
	
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<MailboxAttachDto>> getAttachList(int bno){
		return new ResponseEntity<>(biz.getAttachList(bno), HttpStatus.OK);
	}
	
	@RequestMapping(value="/getMail", method=RequestMethod.GET)
	public String getMail(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("mail", biz.getMail(bno));
		return "getMail";
	}
	
	@RequestMapping(value= "/updateMail", method=RequestMethod.GET)
	public String updateMail(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("mail", biz.getMail(bno));
		return "updateMail";
	}
	
	@RequestMapping(value="/addMail", method=RequestMethod.GET)
	public String addMail(Model model) {
		model.addAttribute("title", "Add Mail");
		return "addMail";
	}
	
	@RequestMapping(value="/addMail", method=RequestMethod.POST)
	public String addMail(MailboxDto mail, RedirectAttributes rttr) {
		
		if(mail.getAttachList() != null) {
			mail.getAttachList().forEach(attach-> System.out.println(attach));
		}
		
		biz.addMail(mail);
		rttr.addFlashAttribute("result", mail.getBno());
		
		return "redirect: /board/mailbox/getList";
	}
	
	
	@RequestMapping(value="/updateMail", method=RequestMethod.POST)
	public String updateMail(MailboxDto mail, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		if(mail.getAttachList() !=null) {
			mail.getAttachList().forEach(attach-> System.out.println(attach));
		}
		
		if(biz.updateMail(mail)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect: /board/mailbox/getList" + cri.getListLink();
	}
	
	
	@RequestMapping(value="/deleteMail")
	public String deleteMail(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		List<MailboxAttachDto> attachList = biz.getAttachList(bno);
		
		if(biz.deleteMail(bno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
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
	
}
