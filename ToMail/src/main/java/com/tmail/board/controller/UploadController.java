package com.tmail.board.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {

	@GetMapping("uploadAjax.do")
	public String uploadAjax() {
		return "uploadAjax";
	}
	
	@PostMapping("uploadAjaxAction.do")
	public void uploadAjaxPost(MultipartFile[] uploadFile) {
		String uploadFolder = "C:\\upload";
		for (MultipartFile multipartFile : uploadFile) {
			System.out.println("[------------------");
			System.out.println("Upload File Name: " + multipartFile.getOriginalFilename());
			System.out.println("Upload File Size: " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			System.out.println("only file name:" + uploadFileName);
			
			File saveFile = new File(uploadFolder, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} // end catch
			
		} // end for
	}
	
}
