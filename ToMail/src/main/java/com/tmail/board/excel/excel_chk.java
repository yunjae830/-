package com.tmail.board.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.Locale;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.tmail.board.Biz.addressBizImpl;
import com.tmail.board.Dto.addressDto;
public class excel_chk {
		public void excelDataInsert(String fileFullPath, int members_seq){
			File file = new File(fileFullPath);
			FileInputStream inputDocument = null;
			Workbook workbook = null;
			try {
				inputDocument = new FileInputStream(file);
				if (file.getName().toLowerCase().endsWith("xlsx")) { // 엑셀 파일의 확장자(버전)에 따라서 생성해야 할 Workbook 객체가 다르다.
					workbook = new XSSFWorkbook(inputDocument);
				}else{
					workbook = new HSSFWorkbook(inputDocument);
				}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			addressBizImpl biz = new addressBizImpl(); // DB에 데이터를 Insert하기 위해 생성한 서비스  객체(각자 상황에 맞게...)
			try {
				Sheet workSheet = workbook.getSheetAt(0); // 첫번째 Sheet
				Iterator<Row> rowIterator = workSheet.iterator();
				int rowSize = workSheet.getLastRowNum() + 1; // 행의 총 개수 (행은 0부터 시작함)
				for(int i=1; i<rowSize; i++){ // i를 1부터 시작해야 두번째 행부터 데이터가 입력된다.
					Row row = workSheet.getRow(i);
					int cellLength = (int) row.getLastCellNum(); // 열의 총 개수
					String valueStr = ""; // 엑셀에서 뽑아낸 데이터를 담아놓을 String 변수 선언 및 초기화
					addressDto address = new addressDto(); // DB에 Insert하기 위해 valueStr 데이터를 옮겨담을 객체 (각자 DB 테이블의 데이터 타입에 맞춰서...)
					for(int j=0; j<cellLength; j++){
						Cell cell = row.getCell(j);
						// 셀에 있는 데이터들을 타입별로 분류해서 valueStr 변수에 담는다.
						if (cell == null || cell.getCellType() == Cell.CELL_TYPE_BLANK) { // CELL_TYPE_BLANK로만 체크할 경우 비어있는  셀을 놓칠 수 있다.
							System.out.println(j + "번, 빈값 들어감.");
							valueStr = "";
						}else{
							switch(cell.getCellType()){
								case Cell.CELL_TYPE_STRING :
									valueStr = cell.getStringCellValue();
									break;
								case Cell.CELL_TYPE_NUMERIC : // 날짜 형식이든 숫자 형식이든 다 CELL_TYPE_NUMERIC으로 인식함.
									if(DateUtil.isCellDateFormatted(cell)){ // 날짜 유형의 데이터일 경우,
										SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
										String formattedStr = dateFormat.format(cell.getDateCellValue());
										valueStr = formattedStr;
										break;
									}else{ // 순수하게 숫자 데이터일 경우,
										Double numericCellValue = cell.getNumericCellValue();
										if(Math.floor(numericCellValue) == numericCellValue){ // 소수점 이하를 버린 값이 원래의 값과 같다면,,
											valueStr = numericCellValue.intValue() + ""; // int형으로 소수점 이하 버리고 String으로 데이터 담는다.
										}else{
											valueStr = numericCellValue + "";
										}
										break;
									}
								case Cell.CELL_TYPE_BOOLEAN :
									valueStr = cell.getBooleanCellValue() + "";
									break;
							}
						}
						// 담아놨던 valueStr 데이터를 셀 순서대로 DTO에 set.
						switch (j) {
							case 0 :
								address.setCustomer_seq(Integer.parseInt(valueStr)); // 담아줘야할 DTO 객체의 메서드 타입에 따라 String을 형변환
								System.out.println(j + "번 Cell, " + "Customer_seq : " + Integer.parseInt(valueStr));
								break;
							case 1 :
								address.setCustomer_name(valueStr);
								System.out.println(j + "번 Cell, " + "name : " + valueStr);
								break;
							case 2 :
								address.setCustomer_email(valueStr);
								System.out.println(j + "번 Cell, " + "email : " + valueStr);
								break;
						} // switch end
					} // for loop(j) end (Cells)
					biz.insert(address); // Data insert.
					System.out.println(i+"번 행 Instert 완료---------------------------------------------------");
				} // for loop(i) end (Rows)
				inputDocument.close();		
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}