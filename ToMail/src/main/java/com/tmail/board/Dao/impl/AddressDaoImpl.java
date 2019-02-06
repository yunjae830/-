package com.tmail.board.Dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tmail.board.Dao.AddressDao;
import com.tmail.board.Dto.AddressDto;
import com.tmail.board.Dto.Address_GroupDto;
@Repository
public class AddressDaoImpl implements AddressDao {

	Logger log = LoggerFactory.getLogger(AddressDaoImpl.class);
	
   @Autowired
   private SqlSessionTemplate sqlSession;
   @Override
   public List<AddressDto> selectList(AddressDto dto) {
      List<AddressDto>res = null;
      System.out.println("select_list");
      try {
         res = sqlSession.selectList(namespace + "selectList", dto);
      } catch (Exception e) {
         System.out.println("selectList 오류");
         e.printStackTrace();
      }
      System.out.println(res+"디비에서 나온값");
      return res;
   }

   @Override
   public AddressDto selectOne_email_chk(String name) {
      AddressDto dto = sqlSession.selectOne(namespace + "selectOne_email_chk",name);
      try {
         
      } catch (Exception e) {
         System.out.println("selectOne 오류");
         e.printStackTrace();
      }
      return dto;
   }

   @Override
   public int insert(AddressDto dto) {
      int res = 0;
      System.out.println(dto.getCustomer_email()+"이메일\n"+dto.getCustomer_name()+"이름\n"+dto.getGroup_seq()+"그룸에스이큐\n"+dto.getMembers_seq()+"멤버에스이큐\n");
      try {
         res = sqlSession.insert(namespace + "insert", dto);
      } catch (Exception e) {
         System.out.println("insert 오류");
         e.printStackTrace();
      }
      return res;
   }

   @Override
   public int update(AddressDto dto) {
      int res = 0;
      System.out.println(dto.getCustomer_seq()+"커스토머에스이큐");
      System.out.println(dto.getCustomer_name()+"바뀐 이름");
      try {
         res = sqlSession.update(namespace + "update", dto);
      } catch (Exception e) {
         System.out.println("update 오류");
         e.printStackTrace();
      }
      
      return res;
   }

   @Override
   public int delete(String name) {
      int res = 0;
      try {
         res = sqlSession.delete(namespace + "delete", name);
      } catch (Exception e) {
         System.out.println("delete 오류");
         e.printStackTrace();
      }
      return res;
   }
   
   @Override
   public int address_check(AddressDto dto) {
      String names = null;
      String email = null;
      System.out.println("이메일 체크 시작");
      try {
         names = sqlSession.selectOne(namespace+ "address_check", dto);
         email = sqlSession.selectOne(namespace+"address_check2",dto);
      } catch (Exception e) {
         e.printStackTrace();
      }
      System.out.println("디비에서 나온 이름 :"+names + "\n 내가보낸 이름 :" + dto.getCustomer_name());
      if(dto.getCustomer_name().equals(names)||dto.getCustomer_email().equals(email)) {
         System.out.println("중복됐어요");
         return 0;
      }else {
         return 1;
      }
   }

   @Override
   public int group_insert(Address_GroupDto dto) {
      int res = 0;
      System.out.println(dto.getMembers_seq()+"dddddddddddddddd");
      try {
         res = sqlSession.insert(namespace+"group_insert", dto);
      } catch (Exception e) {
         e.printStackTrace();
      }
      if(res==1) {
         System.out.println("인서트 성공");
      }else if(res==0) {
         System.out.println("인서트 실패");
      }else {
         System.out.println("오류");
      }
      return res;
   }

   @Override
   public List<Address_GroupDto> selectList_Group(int members_seq) {
      List<Address_GroupDto>res = null;
      
      try {
         res = sqlSession.selectList(namespace+"group_selectList",members_seq);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return res;
   }

   @Override
   public int group_admin_size(int group_seq) {
      int res = 0;
      System.out.println(group_seq+"??");
      try {
         Object tmp = sqlSession.selectOne(namespace+"group_admin_size",group_seq);
         res = (tmp==null)?0:Integer.parseInt(tmp.toString());

      } catch (Exception e) {
         e.printStackTrace();
      }
      System.out.println(res+"!!!!!!!!!!");
      return res;
      
   }

   @Override
   public int delete_group(Address_GroupDto dto) {
      int res = 0;
      try {
         res = sqlSession.delete(namespace+"delete_group",dto);
         System.out.println(res+"ddddd");
      } catch (Exception e) {
         e.printStackTrace();
      }
      return res;
   }

   @Override
   public int update_group(Address_GroupDto dto) {
      int res = 0;
      System.out.println(dto.getGroup_seq());
      try {
         System.out.println(dto.getGroup_seq()+"\n"+dto.getMembers_seq()+"\n"+dto.getGroup_title());
         res = sqlSession.update(namespace+"update_group", dto);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return res;
   }

   @Override
   public int group_cnt(Address_GroupDto dto) {
      int res = 0;
      try {
         res = sqlSession.update(namespace+"group_cnt",dto);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return res;
   }

   @Override
   public int delete_addr(AddressDto dto) {
      int res = 0;
      try {
         res = sqlSession.delete(namespace+"delete_group_addr",dto);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return res;
   }

   @Override
   public String selectOne_email(AddressDto dto) {
      String res = null;
      System.out.println(dto.getCustomer_seq()+"디비에 넣을 seq"+dto.getMembers_seq()+"\t"+dto.getGroup_seq());
      try {
         res = sqlSession.selectOne(namespace+"selectOne_email_to", dto);
      } catch (Exception e) {
         e.printStackTrace();
      }
      System.out.println(res+"디비에서 나온 이메일 확인 값");
      return res;
   }

@Override
public List<String> selectOne_cus_seq(AddressDto dto) {
	System.out.println(dto.getGroup_seq()+"그룹그룹"+dto.getMembers_seq()+"멤버멤버");
	//List<Integer> ress = null;
	List<String> res = null;
	try {
		res = sqlSession.selectList(namespace +"selectList_cusSeq", dto);
		System.out.println(res);
		//res = (tmp==null)?0:Integer.parseInt(tmp.toString());
	} catch (Exception e) {
		e.printStackTrace();
	}
	return res;
}
}