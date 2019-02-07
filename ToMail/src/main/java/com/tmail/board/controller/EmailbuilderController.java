package com.tmail.board.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.tmail.board.Dto.InsertResultDto;
import com.tmail.board.Dto.SummernoteDto;
import com.tmail.board.Dto.TestDto;

import oracle.net.ns.ClientProfile;

@Controller
public class EmailbuilderController {
	
	@RequestMapping(value="EmailBuilderForm.do")
	public String EmailBuilderForm() {
		return "EmailBuilder_head";
	}
	
	@RequestMapping(value="testess.do")
	   public String testess() {
		return "emailTemplate";
	}
	
	@RequestMapping(value="convas.do",method=RequestMethod.POST)
		public String convas(@RequestParam("profile") Profile profile){
		System.out.println(profile);
			return "mailTest";
	}
	@RequestMapping(value="tem.do")
	public String template(HttpSession session ,int num) {
		session.setAttribute("num", num);
		if(num==1) {
			return "tem1";
		}else if(num==2) {
			return "tem2";
		}else if(num==3) {
			return "tem3";
		}else if(num==4) {
			return "tem4";
		}else if(num==5) {
			return "tem5";
		}
			return "error";
	}
	@RequestMapping(value="tem_sel.do")
	public String template_select(HttpSession session, Model model, SummernoteDto dto) {
		 ArrayList<String> list = (ArrayList<String>)session.getAttribute("emails");
		 for(int i = 0; i<list.size(); i++) {
			 System.out.println(list.get(i)+"리스트 내용 출력");
		 }
		String email = (String) session.getAttribute("email");
		session.setAttribute("emails", list);
		session.setAttribute("client_email", email);
		int num = (Integer) session.getAttribute("num");
		System.out.println(num);
		if(num==1) {
			model.addAttribute("template", "tem1.jsp");
			model.addAttribute("title",dto.getBuild_content());
			return "templateBuilder_view";
		}else if(num==2) {
			model.addAttribute("template", "tem2.jsp");
			model.addAttribute("title",dto.getBuild_content());
			return "templateBuilder_view";
		}else if(num==3) {
			model.addAttribute("template", "tem3.jsp");
			model.addAttribute("title",dto.getBuild_content());
			return "templateBuilder_view";
		}else if(num==4) {
			model.addAttribute("template", "tem4.jsp");
			model.addAttribute("title",dto.getBuild_content());
			return "templateBuilder_view";
		}else if(num==5) {
			model.addAttribute("template", "tem5.jsp");
			model.addAttribute("title",dto.getBuild_content());
			return "templateBuilder_view";
		}
		return "error";
	}
}
