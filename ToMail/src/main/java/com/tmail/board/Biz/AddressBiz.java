package com.tmail.board.Biz;

import java.util.List;

import com.tmail.board.Dto.AddressDto;
import com.tmail.board.Dto.Address_GroupDto;

public interface AddressBiz {
   
   public List<AddressDto> selectList(AddressDto dto);
   public AddressDto selectOne_email_chk(String name);
   public int insert(AddressDto dto);
   public int update(AddressDto dto);
   public int delete(String name);
   public int address_check(AddressDto dto);
   public int group_insert(Address_GroupDto dto);
   public List<Address_GroupDto> selectList_Group(int members_seq);
   public int group_admin_size(int group_seq);
   public int delete_group(Address_GroupDto dto);
   public int update_group(Address_GroupDto dto);
   public int group_cnt(Address_GroupDto dto);
   public int delete_addr(AddressDto dto);
   public String selectOne_email(AddressDto dto);
}