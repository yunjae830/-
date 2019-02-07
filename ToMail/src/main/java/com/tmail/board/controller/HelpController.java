package com.tmail.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tmail.board.Biz.AddressBiz;
import com.tmail.board.Biz.HelpBiz;
import com.tmail.board.Biz.RegisterBiz;
import com.tmail.board.Dto.AddressDto;
import com.tmail.board.Dto.Address_GroupDto;
import com.tmail.board.Dto.HelpDto;

@Controller
public class HelpController {

	Logger log = LoggerFactory.getLogger(HelpController.class);

	@Autowired
	private RegisterBiz biz;
	@Autowired
	private HelpBiz help_biz;
	@Autowired
	private AddressBiz address_biz;

	@RequestMapping(value = "helpform.do")
	public String helpform(String email, Model model, HttpSession session, HelpDto dto) {
		session.setAttribute("email", email);
		String name = help_biz.help_registerName(email);
		System.out.println(name + "디비에서 나온이름");
		model.addAttribute("list", help_biz.help_groupList());
		model.addAttribute("name", name);
		return "help_tomail";
	}

	@RequestMapping(value = "help_insert.do")
	public String help_insert(Model model, HttpSession session, HelpDto dto) {
		String email = (String) session.getAttribute("email");
		String name = help_biz.help_registerName(email);
		System.out.println(name + "디비에서 나온이름");
		dto.setMembers_name(name);
		help_biz.insertHelp(dto);
		model.addAttribute("list", help_biz.help_groupList());
		model.addAttribute("name", name);
		return "help_tomail";
	}

	@RequestMapping(value = "help_update.do")
	public String help_update(String email, Model model, HttpSession session, HelpDto dto,
			HttpServletResponse response) {
		session.setAttribute("email", email);
		String name = help_biz.help_registerName(email);
		dto.setMembers_name(name);
		int num = help_biz.help_update(dto);
		System.out.println(name + "디비에서 나온이름");
		if (num == 1) {
			model.addAttribute("list", help_biz.help_groupList());
			model.addAttribute("name", name);
			return "help_tomail";
		} else if (num == 0) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8"); // 한글깨짐 방지
			PrintWriter out_p = null;
			try {
				out_p = response.getWriter();
				out_p.println("<script>alert('실패..');</script>");
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				out_p.flush();
			}
			model.addAttribute("list", help_biz.help_groupList());
			model.addAttribute("name", name);
			return "help_tomail";
		}
		return "error";
	}

	@RequestMapping(value = "delete_help.do")
	public String help_delete(int help_seq, Model model, HttpSession session, HttpServletResponse response) {
		int res = help_biz.help_delete(help_seq);
		String email = (String) session.getAttribute("email");
		String name = help_biz.help_registerName(email);
		System.out.println(name + "디비에서 나온이름");
		if (res == 1) {
			model.addAttribute("list", help_biz.help_groupList());
			model.addAttribute("name", name);
			return "help_tomail";
		} else if (res == 0) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8"); // 한글깨짐 방지
			PrintWriter out_p = null;
			try {
				out_p = response.getWriter();
				out_p.println("<script>alert('실패..');</script>");
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				out_p.flush();
			}
			model.addAttribute("list", help_biz.help_groupList());
			model.addAttribute("name", name);
			return "help_tomail";
		}
		return "error";
	}

	// 클라이언트가 선택한 그룹
	@RequestMapping(value = "addr_group.do")
	public String group_seq(int[] all_value, HttpSession session, AddressDto dto, Model model) {
		List<String> addr_email = new ArrayList<String>();
		List<String> cus_seq = null;
		List<String> emails = new ArrayList<String>();
		String email = (String) session.getAttribute("group_email");
		System.out.println(email + "세션 이메일------------------");
		int members_seq = biz.member_seq_return(email);
		System.out.println(members_seq + "멤버 seq 리턴");
		for (int i = 0; i < all_value.length; i++) {
			int res = address_biz.group_admin_size(all_value[i]);
			System.out.println(all_value[i] + "그룹SEQ-------------------");
			if (res != 0) {
				dto.setGroup_seq(all_value[i]);
				dto.setMembers_seq(members_seq);
				cus_seq = address_biz.selectOne_cus_seq(dto);
				System.out.println(cus_seq+"cus_seq-----return");
				System.out.println("controller:" + dto.getCustomer_seq() + "");
				List<String> emails_return = help_biz.help_email_return(dto,cus_seq);
				System.out.println(emails_return+"##################");
				for(String j : emails_return){
				    emails.add(j);
				}
				//System.out.println("controller:" + addr_email.get(i));
				System.out.println("controller end");
			}
		}
		System.out.println(emails + "++++++++++++++");
		session.setAttribute("emails", emails);
		model.addAttribute("email",email);
		return "emailTemplate";
	}
}