package com.tmail.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tmail.board.Biz.MailboxBiz;
import com.tmail.board.Dto.Criteria;
import com.tmail.board.Dto.MailboxDto;
import com.tmail.board.Dto.PageDto;

@Controller
@RequestMapping("/mailbox/")
public class MailboxController {

	@Autowired
	MailboxBiz biz;
	
	@RequestMapping("getList.do")
	public String getList(Criteria cri, Model model) {
		model.addAttribute("list", biz.getList(cri));
		int total = biz.getTotal(cri);
		model.addAttribute("pageMaker", new PageDto(cri, total));
		return "getList";
	}
	
	@RequestMapping(value="getMail.do", method=RequestMethod.GET)
	public String getMail(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("mail", biz.getMail(bno));
		return "getMail";
	}
	
	@RequestMapping(value="updateMail.do", method=RequestMethod.GET)
	public String updateMail(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("mail", biz.getMail(bno));
		return "updateMail";
	}
	
	@RequestMapping(value="addMail.do", method=RequestMethod.GET)
	public String addMail(Model model) {
		model.addAttribute("title", "Add Mail");
		return "addMail";
	}
	
	@RequestMapping(value="addMail.do", method=RequestMethod.POST)
	public String addMail(MailboxDto mail, RedirectAttributes rttr) {
		biz.addMail(mail);
		rttr.addFlashAttribute("result", mail.getBno());
		return "redirect: getList.do";
	}
	
	
	@RequestMapping(value="updateMail.do", method=RequestMethod.POST)
	public String updateMail(MailboxDto mail, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if(biz.updateMail(mail)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect: getList.do"; // + cri.getListLink();
	}
	
	
	@RequestMapping(value="deleteMail.do", method=RequestMethod.GET)
	public String deleteMail(@RequestParam("seqno") int seqno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if(biz.deleteMail(seqno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect: getList.do"; // + cri.getListLink();
	}
	
}
