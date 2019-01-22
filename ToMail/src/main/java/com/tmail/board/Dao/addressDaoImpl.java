package com.tmail.board.Dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tmail.board.Dto.addressDto;
@Repository
public class addressDaoImpl implements addressDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public List<addressDto> selectList(int members_seq) {
		List<addressDto>res = null;
		
		try {
			res = sqlSession.selectList(namespace + "selectList", members_seq);
		} catch (Exception e) {
			System.out.println("selectList 오류");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public addressDto selectOne_email_chk(String name) {
		addressDto dto = sqlSession.selectOne(namespace + "selectOne_email_chk",name);
		try {
			
		} catch (Exception e) {
			System.out.println("selectOne 오류");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(addressDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(namespace + "insert", dto);
		} catch (Exception e) {
			System.out.println("insert 오류");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(addressDto dto) {
		int res = 0;
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

}
