package com.tmail.board.excel;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import com.tmail.board.Dto.AddressDto;

@Service
public class CustomerExcelReader {

   @SuppressWarnings("resource")
   public List<AddressDto> xlsToCustomerVOList(String filePath) {

      List<AddressDto> list = new ArrayList<AddressDto>();

      FileInputStream fis = null;
      HSSFWorkbook wb = null;

      try {
         fis = new FileInputStream(filePath);

         wb = new HSSFWorkbook(fis);

         HSSFSheet curSheet;
         HSSFRow curRow;
         HSSFCell curCell;
         AddressDto vo;

         for (int sheetIndex = 0; sheetIndex < wb.getNumberOfSheets(); sheetIndex++) {
            curSheet = wb.getSheetAt(sheetIndex);
            for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
               if (rowIndex != 0) {
                  curRow = curSheet.getRow(rowIndex);
                  vo = new AddressDto();
                  String value;

                  if (!"".equals(curRow.getCell(0).getStringCellValue())) {
                     for (int cellIndex = 0; cellIndex < curRow.getPhysicalNumberOfCells(); cellIndex++) {
                        curCell = curRow.getCell(cellIndex);

                        if (true) {
                           value = "";
                           switch (curCell.getCellType()) {
                           case HSSFCell.CELL_TYPE_FORMULA:
                              value = curCell.getNumericCellValue() + "";
                              break;
                           case HSSFCell.CELL_TYPE_NUMERIC:
                              value = curCell.getNumericCellValue() + "";
                              break;
                           case HSSFCell.CELL_TYPE_STRING:
                              value = curCell.getStringCellValue() + "";
                              break;
                           case HSSFCell.CELL_TYPE_BLANK:
                              value = curCell.getBooleanCellValue() + "";
                              break;
                           case HSSFCell.CELL_TYPE_ERROR:
                              value = curCell.getErrorCellValue() + "";
                              break;
                           default:
                              value = new String();
                              break;
                           }
                           switch (cellIndex) {

                           case 0: // 이름
                              vo.setCustomer_name(value);
                              ;
                              break;

                           case 1: // 이메일
                              vo.setCustomer_email(value);
                              break;

                           default:
                              break;
                           }
                           
                        }
                     }
                     list.add(vo);
                     System.out.println(vo.getCustomer_email()+"\n" + vo.getCustomer_name());
                  }
               }
            }
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if( wb != null) 
            if( fis != null) fis.close();
         }catch (Exception e) {
            e.printStackTrace();
         }
      }

      return list;
   }
   
   
    public List<AddressDto> xlsxToCustomerVoList(String filePath) {
           // 반환할 객체를 생성
           List<AddressDto> list = new ArrayList<AddressDto>();
           
           FileInputStream fis = null;
           XSSFWorkbook wb = null;
           
           try {
               
               fis= new FileInputStream(filePath);
               // HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체
               wb = new XSSFWorkbook(fis);
               
               // 탐색에 사용할 Sheet, Row, Cell 객체
               XSSFSheet curSheet;
               XSSFRow   curRow;
               XSSFCell  curCell;
               AddressDto vo;
               
               // Sheet 탐색 for문
               for(int sheetIndex = 0 ; sheetIndex < wb.getNumberOfSheets(); sheetIndex++) {
                   // 현재 Sheet 반환
                   curSheet = wb.getSheetAt(sheetIndex);
                   // row 탐색 for문
                   for(int rowIndex=0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
                       // row 0은 헤더정보이기 때문에 무시
                       if(rowIndex != 0) {
                           // 현재 row 반환
                           curRow = curSheet.getRow(rowIndex);
                           vo = new AddressDto();
                           String value;
                           
                           // row의 첫번째 cell값이 비어있지 않은 경우 만 cell탐색
                           if(!"".equals(curRow.getCell(0).getStringCellValue())) {
                               
                               // cell 탐색 for 문
                               for(int cellIndex=0;cellIndex<curRow.getPhysicalNumberOfCells(); cellIndex++) {
                                   curCell = curRow.getCell(cellIndex);
                                   
                                   if(true) {
                                       value = "";
                                       // cell 스타일이 다르더라도 String으로 반환 받음
                                       switch (curCell.getCellType()){
                                       case HSSFCell.CELL_TYPE_FORMULA:
                                           value = curCell.getCellFormula();
                                           break;
                                       case HSSFCell.CELL_TYPE_NUMERIC:
                                           value = curCell.getNumericCellValue()+"";
                                           break;
                                       case HSSFCell.CELL_TYPE_STRING:
                                           value = curCell.getStringCellValue()+"";
                                           break;
                                       case HSSFCell.CELL_TYPE_BLANK:
                                           value = curCell.getBooleanCellValue()+"";
                                           break;
                                       case HSSFCell.CELL_TYPE_ERROR:
                                           value = curCell.getErrorCellValue()+"";
                                           break;
                                       default:
                                           value = new String();
                                           break;
                                       }
                                       
                                       // 현재 column index에 따라서 vo에 입력
                                       switch (cellIndex) {
                                  
                                           
                                       case 0: // 이름
                                           vo.setCustomer_name(value);;
                                           break;
                                 
                                           
                                       case 1: // 이메일
                                           vo.setCustomer_email(value);
                                           break;
           
                                       default:
                                           break;
                                       }
                                   }
                               }
                               // cell 탐색 이후 vo 추가
                               list.add(vo);
                               System.out.println(vo.getCustomer_name()+"\n" + vo.getCustomer_email());
                           }
                       }
                   }
               }
           } catch (FileNotFoundException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
           } catch (IOException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
               
           } finally {
               try {
                   // 사용한 자원은 finally에서 해제
                   if( wb!= null) 
                   if( fis!= null) fis.close();
                   
               } catch (IOException e) {
                   // TODO Auto-generated catch block
                   e.printStackTrace();
               }
           }
           return list;
       }
   }
