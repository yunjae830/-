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

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.tmail.board.Biz.AddressBiz;
import com.tmail.board.Biz.RegisterBiz;
import com.tmail.board.Dto.AddressDto;
import com.tmail.board.Dto.Address_GroupDto;
import com.tmail.board.Dto.EmailFormDto;
import com.tmail.board.Dto.TestDto;
import com.tmail.board.excel.CustomerExcelReader;

@Controller
public class AddressController {
   @Autowired
   private JavaMailSender mailSender;
   @Autowired
   private RegisterBiz reg_biz;
   @Autowired
   private AddressBiz biz;
   @Autowired
   private CustomerExcelReader ex_red;
   
   private EmailFormDto emailFormDto = new EmailFormDto();

   @RequestMapping(value = "myaddr_Form.do")
   public String myaddr_Form(Model model, HttpSession session, int group_seq, AddressDto dto) {
      String email = (String) session.getAttribute("group_email");
      int members_seq = reg_biz.member_seq_return(email);
      dto.setMembers_seq(members_seq);
      dto.setGroup_seq(group_seq);
      model.addAttribute("group_seq", group_seq);
      model.addAttribute("members_seq", members_seq);
      model.addAttribute("list", biz.selectList(dto));
      model.addAttribute("email", email);
      return "guest_addr_insert";
   }

   @RequestMapping(value="myaddr_insert.do", method=RequestMethod.POST)
   public String myaddr(Model model, AddressDto dto, HttpSession session, int members_seq, HttpServletResponse response, MultipartHttpServletRequest multi) throws IOException {
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
         File filename = null;
         for (int i = 0; i < files.size(); i++) {
               inputStream = files.get(i).getInputStream();
               System.out.println(files.get(i).getOriginalFilename() + " 업로드");
               filename = new File(path + "/" + files.get(i).getOriginalFilename());
               ex_red.xlsxToCustomerVoList(path + "/" + files.get(i).getOriginalFilename());
               if (!filename.exists()) {
                  filename.createNewFile();
               }
               outputStream = new FileOutputStream(filename);
               int read = 0;
               byte[] b = new byte[(int) files.get(i).getSize()];

               while ((read = inputStream.read(b)) != -1) {
                  outputStream.write(b, 0, read);
               }
         }
         }else if(!(dto.getCustomer_email().equals("")&&dto.getCustomer_name().equals(""))) {
      int check = biz.address_check(dto);
      dto.setMembers_seq(members_seq);
      if(check==0) {
         response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8"); // 한글깨짐 방지
            PrintWriter out_p = null;
            try {
               out_p = response.getWriter();
               out_p.println("<script>alert('이미 존재하는 이메일이에요.');</script>");
            } catch (IOException e) {
               e.printStackTrace();
            } finally {
               out_p.flush();
            }
            String email = (String) session.getAttribute("group_email");
            model.addAttribute("group_seq", dto.getGroup_seq());
            model.addAttribute("email",email);
            model.addAttribute("members_seq", members_seq);
          model.addAttribute("list", biz.selectList(dto));
         return "guest_addr_insert";
      }else {
         int res = biz.insert(dto);
         String email = (String) session.getAttribute("group_email");
         System.out.println(res+"-------------------!!!!!!!!!!!");
         if(res==0) {   
            model.addAttribute("group_seq", dto.getGroup_seq());
               model.addAttribute("email",email);
               model.addAttribute("members_seq", members_seq);
             model.addAttribute("list", biz.selectList(dto));
            return "guest_addr_insert";
         }
            model.addAttribute("group_seq", dto.getGroup_seq());
         model.addAttribute("members_seq", members_seq);
         model.addAttribute("list", biz.selectList(dto));
         model.addAttribute("email", email);
         return "guest_addr_insert";
      }
      
         }else {
            response.setCharacterEncoding("UTF-8");
               response.setContentType("text/html; charset=UTF-8"); // 한글깨짐 방지
               PrintWriter out_p = null;
               try {
                  out_p = response.getWriter();
                  out_p.println("<script>alert('구독자를 입력해주세요.');</script>");
               } catch (IOException e) {
                  e.printStackTrace();
               } finally {
                  out_p.flush();
               }
               String email = (String) session.getAttribute("group_email");
               model.addAttribute("group_seq", dto.getGroup_seq());
               model.addAttribute("email",email);
               model.addAttribute("members_seq", members_seq);
             model.addAttribute("list", biz.selectList(dto));
            return "guest_addr_insert";
         }
         return"error";
   }

   // 그룹 만들기
   @RequestMapping(value = "group_mail.do")
   public String group_addressMail(Model model, HttpSession session, String email, Address_GroupDto dto) {
      int members_seq = reg_biz.member_seq_return(email);
      List<Address_GroupDto> group_list = biz.selectList_Group(members_seq);
      session.setAttribute("group_email", email);
      model.addAttribute("member_seq", members_seq);
      model.addAttribute("email", email);
      for (int i = 0; i < group_list.size(); i++) {
         int res = biz.group_admin_size(group_list.get(i).getGroup_seq());
         dto.setGroup_seq(group_list.get(i).getGroup_seq());
         dto.setMember_seq(members_seq);
         dto.setCnt(res);
         int num = biz.group_cnt(dto);
         System.out.println("cnt업데이트"+num);
      }
      model.addAttribute("list", biz.selectList_Group(members_seq));
      return "group_addressEmail";
   }
   //그룹 인서트
   @RequestMapping(value = "group.do")
   public String group_insert(Address_GroupDto dto, Model model, HttpSession session) {
      int res = biz.group_insert(dto);
      List<Address_GroupDto> group_list = biz.selectList_Group(dto.getMembers_seq());
      String email = (String) session.getAttribute("group_email");
      System.out.println("그룹그룹" + res);
      model.addAttribute("member_seq", dto.getMembers_seq());
      model.addAttribute("email", email);
      for (int i = 0; i < group_list.size(); i++) {
         int ress = biz.group_admin_size(group_list.get(i).getGroup_seq());
         dto.setGroup_seq(group_list.get(i).getGroup_seq());
         dto.setMember_seq(dto.getMembers_seq());
         dto.setCnt(ress);
         int num = biz.group_cnt(dto);
         System.out.println("cnt업데이트"+num);
      }
      model.addAttribute("list", group_list);
      return "group_addressEmail";
   }
   //그룹이름 업데이트
   @RequestMapping(value="group_update.do")
   public String group_update(Address_GroupDto dto, Model model, HttpSession session) {
      String email = (String) session.getAttribute("group_email");
      List<Address_GroupDto> group_list = biz.selectList_Group(dto.getMembers_seq());
      biz.update_group(dto);
      model.addAttribute("member_seq", dto.getMembers_seq());
      model.addAttribute("email", email);
      for (int i = 0; i < group_list.size(); i++) {
         int ress = biz.group_admin_size(group_list.get(i).getGroup_seq());
         dto.setGroup_seq(group_list.get(i).getGroup_seq());
         dto.setMember_seq(dto.getMembers_seq());
         dto.setCnt(ress);
         int num = biz.group_cnt(dto);
         System.out.println("cnt업데이트"+num);
      }
      model.addAttribute("list", biz.selectList_Group(dto.getMembers_seq()));
      return "group_addressEmail";
   }
   //주소록 이름 업데이트
   @RequestMapping(value="addr_update.do")
   public String address_update(HttpSession session,Model model,AddressDto dto) {
      String email = (String) session.getAttribute("group_email");
      int members_seq = reg_biz.member_seq_return(email);
      dto.setMembers_seq(members_seq);
      biz.update(dto);
      model.addAttribute("group_seq", dto.getGroup_seq());
      model.addAttribute("members_seq", members_seq);
      model.addAttribute("list", biz.selectList(dto));
      model.addAttribute("email", email);
      return "guest_addr_insert";
   }
   //그룹 삭제 버튼 클릭시
   @RequestMapping(value="delete_dd.do")
   public String group_delete(HttpSession session, Model model, int group_seq,Address_GroupDto dto) {
      String email = (String) session.getAttribute("group_email");
      int members_seq = reg_biz.member_seq_return(email);
      dto.setGroup_seq(group_seq); dto.setMember_seq(members_seq);
      System.out.println(group_seq+"@@@@@@"+members_seq);
      int res = biz.delete_group(dto);
      List<Address_GroupDto> group_list = biz.selectList_Group(members_seq);
      model.addAttribute("member_seq", members_seq);
      model.addAttribute("email", email);
      for (int i = 0; i < group_list.size(); i++) {
         int ress = biz.group_admin_size(group_list.get(i).getGroup_seq());
         dto.setGroup_seq(group_list.get(i).getGroup_seq());
         dto.setMember_seq(members_seq);
         dto.setCnt(ress);
         int num = biz.group_cnt(dto);
         System.out.println("cnt업데이트"+num);
      }
      model.addAttribute("list", biz.selectList_Group(members_seq));
      return "group_addressEmail";
   }
   //주소록에서 삭제버튼 클릭시
   @RequestMapping(value="delete_ad.do")
   public String address_delete(HttpSession session, Model model, int group_seq, AddressDto dto, int customer_seq) {
      String email = (String) session.getAttribute("group_email");
      int members_seq = reg_biz.member_seq_return(email);
      dto.setMembers_seq(members_seq);
      dto.setGroup_seq(group_seq);
      dto.setCustomer_seq(customer_seq);
      biz.delete_addr(dto);
      model.addAttribute("group_seq", group_seq);
      model.addAttribute("members_seq", members_seq);
      model.addAttribute("list", biz.selectList(dto));
      model.addAttribute("email", email);
      return "guest_addr_insert";
   }
   //check박스 선택,전체삭제가능
   @RequestMapping(value="delete_addr.do")
   public String delete_addr(int[] delete_addr, int group_seq, HttpSession session, AddressDto dto, Model model) {
      String email = (String) session.getAttribute("group_email");
      int members_seq = reg_biz.member_seq_return(email);
      System.out.println("----------");
      System.out.println(group_seq);
      for(int i = 0; i<delete_addr.length; i++ ) {
         dto.setMembers_seq(members_seq);
         dto.setGroup_seq(group_seq);         
         dto.setCustomer_seq(delete_addr[i]);
         biz.delete_addr(dto);
      }
      model.addAttribute("group_seq", group_seq);
      model.addAttribute("members_seq", members_seq);
      model.addAttribute("list", biz.selectList(dto));
      model.addAttribute("email", email);
      return "guest_addr_insert";
   }
   //check박스 구독자 seq가져와서 email을 디비에서 뽑음
   @RequestMapping(value="addr_check.do")
   public String addr_check(int[] all_value, int group_seq, HttpSession session, AddressDto dto, Model model) {
      List<String> addr_email = new ArrayList<String>();
      String email = (String) session.getAttribute("group_email");
      int members_seq = reg_biz.member_seq_return(email);
      session.setAttribute("mno", members_seq);
      for(int i=0; i<all_value.length; i++) {
         System.out.println(all_value[i]+"\t"+members_seq+"\t"+group_seq);
         dto.setMembers_seq(members_seq);
         dto.setGroup_seq(group_seq);         
         dto.setCustomer_seq(all_value[i]);
         String addr_emails = biz.selectOne_email(dto);
         System.out.println(addr_emails);
         addr_email.add(addr_emails);
      }
      TestDto testDto = new TestDto();
      model.addAttribute("testDto", testDto);
      System.out.println(addr_email+"list값");
      model.addAttribute("email", addr_email);
//      return "mailTest";
      return "getList";
   }
   // 테스트중
//   @RequestMapping(value = "test.do")
//   public String test() {
//      return "addMailTest";
//   }

   @RequestMapping(value="tests.do", method=RequestMethod.POST)
   public String tests(HttpServletResponse response, TestDto dto) throws MessagingException, IOException {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
      String setfrom = "jea830@hanmail.net";
      List<String> tomail = dto.getEmail(); // 받는 사람 이메일
      String title = dto.getTitle(); // 제목
      String content = dto.getContent(); // 내용
      for(int i = 0; i < tomail.size(); i++) {
      messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
      messageHelper.setTo(tomail.get(i)); // 받는사람 이메일
      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
      messageHelper.setText(content, true); // html이라는 의미로 true를 써준다.
      
      mailSender.send(message);
      }
      response.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8"); // 한글깨짐 방지
      PrintWriter out_p = null;

      out_p = response.getWriter();
      out_p.println("<script>alert('메일을 보냈어요!');</script>");

      out_p.flush();
      return "";
   }
   
   
   
   
   
}