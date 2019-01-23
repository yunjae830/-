package com.tmail.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tmail.board.Biz.ReplyBiz;
import com.tmail.board.Dto.Criteria;
import com.tmail.board.Dto.ReplyDto;
import com.tmail.board.Dto.ReplyPageDto;


@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	public ReplyController(ReplyBiz biz) {
		this.biz = biz;
	}

	@Autowired
	private ReplyBiz biz;
	
	@PostMapping(value="new.do", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create (@RequestBody ReplyDto dto){
		
		int insertCount = biz.register(dto);
		
		return insertCount == 1 ? 
				new ResponseEntity<>("success", HttpStatus.OK)
			:	new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="pages/{bno}/{page}.do", produces= 
			{MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDto> getList(
			@PathVariable("page") int page,
			@PathVariable("bno") Long bno) {
		
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<>(biz.getListPage(cri, bno), HttpStatus.OK);
	}
	
	@GetMapping(value="{rno}.do", produces= {MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyDto> get(@PathVariable("rno") Long rno) {
		
		return new ResponseEntity<>(biz.get(rno), HttpStatus.OK);
	}
	
	@DeleteMapping(value="{rno}.do", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
		
		return biz.remove(rno) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, value="{rno}.do",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyDto dto, @PathVariable("rno") int rno){
		dto.setRno(rno);
		return biz.modify(dto) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
