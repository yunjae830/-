package com.tmail.board.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value="change_img.do")
	public String imgChange(HttpServletResponse response, MultipartHttpServletRequest multi, Model model, HttpSession session) throws IOException {
			int num = (Integer) session.getAttribute("num");
			InputStream inputStream = null;
	       OutputStream outputStream = null;
	       if(multi.getFile("files").getSize()>0) {            
	       // 파일경로
	       String path = "";
	       try {
	          path = WebUtils.getRealPath(multi.getSession().getServletContext(), "/storage");
	       } catch (FileNotFoundException e1) {
	          e1.printStackTrace();
	       }
	       System.out.println(path);
	       // 파일들을 List형식으로 보관
	       List<MultipartFile> files = multi.getFiles("files");

	       File file = new File(path);
	       // 파일이 없다면 디렉토리를 생성
	       if (file.exists() == false) {
	          file.mkdirs();
	       }
	       String paths = "";
	       //List<String> paths = new ArrayList<String>();
	       File filename = null;
	       for (int i = 0; i < files.size(); i++) {
	             inputStream = files.get(i).getInputStream();
	             System.out.println(files.get(i).getOriginalFilename() + " 업로드");
	             filename = new File(path + "/" + files.get(i).getOriginalFilename());
	             if (!filename.exists()) {
	                filename.createNewFile();
	             }
	             outputStream = new FileOutputStream(filename);
	             int read = 0;
	             byte[] b = new byte[(int) files.get(i).getSize()];

	             while ((read = inputStream.read(b)) != -1) {
	                outputStream.write(b, 0, read);
	             }
	            System.out.println(session.getServletContext().getRealPath("/")+"경로경로");
	             System.out.println(path + "\\" + files.get(i).getOriginalFilename());
	             paths = path + "\\" + files.get(i).getOriginalFilename();
	       }
	       session.setAttribute("img1", paths);
	       if(num==1) {
				model.addAttribute("template", "tem1.jsp");
				System.out.println(paths);
				model.addAttribute("img", paths);
				return "templateBuilder_view";
			}else if(num==2) {
				model.addAttribute("template", "tem2.jsp");
				model.addAttribute("img", paths);
				return "templateBuilder_view";
			}else if(num==3) {
				model.addAttribute("template", "tem3.jsp");
				model.addAttribute("img", paths);
				return "templateBuilder_view";
			}else if(num==4) {
				model.addAttribute("template", "tem4.jsp");
				model.addAttribute("img", paths);
				return "templateBuilder_view";
			}else if(num==5) {
				model.addAttribute("template", "tem5.jsp");
				model.addAttribute("img", paths);
				return "templateBuilder_view";
			}
	           return "templateBuilder_view";
	      }else {
	    	  response.setCharacterEncoding("UTF-8");
	          response.setContentType("text/html; charset=UTF-8"); // 한글깨짐 방지
	          PrintWriter out_p = null;
	          try {
	             out_p = response.getWriter();
	             out_p.println("<script>alert('이미지를 넣어주세요');</script>");
	          } catch (IOException e) {
	             e.printStackTrace();
	          } finally {
	             out_p.flush();
	          }
	          if(num==1) {
					model.addAttribute("template", "tem1.jsp");
					return "templateBuilder_view";
				}else if(num==2) {
					model.addAttribute("template", "tem2.jsp");
					return "templateBuilder_view";
				}else if(num==3) {
					model.addAttribute("template", "tem3.jsp");
					return "templateBuilder_view";
				}else if(num==4) {
					model.addAttribute("template", "tem4.jsp");
					return "templateBuilder_view";
				}else if(num==5) {
					model.addAttribute("template", "tem5.jsp");
					return "templateBuilder_view";
				}
	          
	    	  }
	       return "templateBuilder_view";
	}
}
