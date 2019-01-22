package com.tmail.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tmail.board.Biz.addressBiz;
import com.tmail.board.Biz.registerBiz;
import com.tmail.board.Dto.addressDto;
import com.tmail.board.Dto.testDto;
import com.tmail.board.excel.excel_chk;
import com.tmail.board.sha256.SHA256;

@Controller
public class address_Controller {
@Autowired
private JavaMailSender mailSender;
@Autowired
private registerBiz reg_biz;
@Autowired
private addressBiz biz;
private excel_chk ex_ck;
	
	@RequestMapping(value="myaddr_Form.do")
	public String myaddr_Form(Model model, String email) {
		int members_seq = reg_biz.member_seq_return(email);
		model.addAttribute("members_seq", members_seq);
		model.addAttribute("list", biz.selectList(members_seq));
		return "guest_addr_insert";
	}
	@RequestMapping(value="myaddr_insert.do", method=RequestMethod.POST)
	public String myaddr(Model model, addressDto dto) {
		int res = biz.insert(dto);
		System.out.println(res+"-------------------!!!!!!!!!!!");
		if(res==0) {
			return "guest_addr_insert";
		}
		model.addAttribute("members_seq", dto.getMember_seq());
		model.addAttribute("list", biz.selectList(dto.getMember_seq()));
		return "guest_addr_insert";
	}
	@RequestMapping(value="detail.do")
	public String myaddr_detail(Model model,String name) {
		System.out.println(biz.selectOne_email_chk(name));
		model.addAttribute("dto", biz.selectOne_email_chk(name));
		
		return "guest_addr_detail";
	}
	@RequestMapping(value="test.do")
	public String test() {
		return "mailTest";
	}
	@RequestMapping("tests.do")
	public String tests(HttpServletResponse response, testDto dto) throws MessagingException, IOException {
		MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
        String setfrom = "jea830@hanmail.net";
        String tomail = dto.getEmail(); // 받는 사람 이메일
        String title = dto.getTitle(); // 제목
        String content = dto.getContent(); // 내용
        messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
        messageHelper.setTo(tomail); // 받는사람 이메일
        messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
        messageHelper.setText(content, true); // html이라는 의미로 true를 써준다.
        mailSender.send(message);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8"); // 한글깨짐 방지
        PrintWriter out_p = null;

           out_p = response.getWriter();
           out_p.println("<script>alert('메일을 보냈어요!');</script>");

           out_p.flush();
		return "";
	}
}
