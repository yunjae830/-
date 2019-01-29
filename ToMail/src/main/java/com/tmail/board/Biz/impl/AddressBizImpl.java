package com.tmail.board.Biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmail.board.Biz.AddressBiz;
import com.tmail.board.Dao.AddressDao;
import com.tmail.board.Dto.AddressDto;
import com.tmail.board.Dto.Address_GroupDto;
@Service
public class AddressBizImpl implements AddressBiz {
   @Autowired
   private AddressDao dao;
   @Override
   public List<AddressDto> selectList(AddressDto dto) {
      return dao.selectList(dto);
   }

   @Override
   public AddressDto selectOne_email_chk(String name) {
      return dao.selectOne_email_chk(name);
   }

   @Override
   public int insert(AddressDto dto) {
      return dao.insert(dto);
   }

   @Override
   public int update(AddressDto dto) {
      return dao.update(dto);
   }

   @Override
   public int delete(String name) {
      return dao.delete(name);
   }
   @Override
   public int address_check(AddressDto dto) {      
      return dao.address_check(dto);
   }

   @Override
   public int group_insert(Address_GroupDto dto) {
      return dao.group_insert(dto);
   }

   @Override
   public List<Address_GroupDto> selectList_Group(int members_seq) {
      return dao.selectList_Group(members_seq);
   }

   @Override
   public int group_admin_size(int group_seq) {
      return dao.group_admin_size(group_seq);
   }

   @Override
   public int delete_group(Address_GroupDto dto) {
      return dao.delete_group(dto);
   }

   @Override
   public int update_group(Address_GroupDto dto) {
      return dao.update_group(dto);
   }

   @Override
   public int group_cnt(Address_GroupDto dto) {
      return dao.group_cnt(dto);
   }

   @Override
   public int delete_addr(AddressDto dto) {
      return dao.delete_addr(dto);
   }

   @Override
   public String selectOne_email(AddressDto dto) {
      return dao.selectOne_email(dto);
   }
}