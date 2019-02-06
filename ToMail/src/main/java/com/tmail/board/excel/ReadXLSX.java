package com.tmail.board.excel;
import java.io.File;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmail.board.Biz.AddressBiz;
import com.tmail.board.Dto.AddressDto;
import com.tmail.board.Dto.InsertResultDto;
@Service
public class ReadXLSX {
	@Autowired
	private AddressBiz biz;
	public void ReadXLSX_Read(String filePath, int members_seq, int group_seq) throws IOException {
		AddressDto dto = new AddressDto();
		InsertResultDto result = new InsertResultDto();
		FileInputStream fis = new FileInputStream(new File(filePath));
		XSSFWorkbook workbook = new XSSFWorkbook (fis);
		XSSFSheet sheet = workbook.getSheetAt(0);
		Iterator ite = sheet.rowIterator();
		List<String> exLeader = new ArrayList<String>();
		List<String> email = new ArrayList<String>();
		List<String> name = new ArrayList<String>();
		List<String> email_false = new ArrayList<String>();
		List<String> name_false = new ArrayList<String>();
		int sum = 0;
		while(ite.hasNext()){
			Row row = (Row) ite.next();
			Iterator<Cell> cite = row.cellIterator();
			while(cite.hasNext()){
				Cell c = cite.next();
				String exLeaders = (c.toString());
				exLeader.add(exLeaders);
			}
			System.out.println();
		}
		for(int i = 0; i<exLeader.size(); i++){
		    if(i%2!=0) {
		    	System.out.println(exLeader.get(i)+"이메일");
		    	email.add(exLeader.get(i));
		    }else if(i%2==0) {
		    	System.out.println(exLeader.get(i)+"이름");
		    	name.add(exLeader.get(i));
		    }
		}
		for(int i = 0; i<email.size(); i++) {
			dto.setCustomer_email(email.get(i));
			dto.setMembers_seq(members_seq);
			dto.setCustomer_name(name.get(i));
			int check = biz.address_check(dto);
			System.out.println("중복체크"+check);
			if(check==1) {
			dto.setGroup_seq(group_seq);
			int res = biz.insert(dto);
			sum = sum + res;
			}else {
				email_false.add(email.get(i));
				name_false.add(name.get(i));
			}
		}
		System.out.println(sum);
		System.out.println(email_false);
		System.out.println(name_false);
		result.setEmailFalse(email_false);
		result.setNameFalse(name_false);
		result.setSum(sum);
		fis.close();
	}
} 