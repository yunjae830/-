package com.tmail.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tmail.board.Biz.HelpBiz;
import com.tmail.board.Biz.RegisterBiz;
import com.tmail.board.Dto.HelpDto;

@Controller
public class HelpController {
	@Autowired
	private RegisterBiz biz;
	@Autowired
	private HelpBiz help_biz;

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
}