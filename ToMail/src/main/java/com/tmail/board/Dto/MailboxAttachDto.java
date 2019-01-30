package com.tmail.board.Dto;

public class MailboxAttachDto {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private int bno;

	public MailboxAttachDto() {
		super();
	}

	public MailboxAttachDto(String uuid, String uploadPath, String fileName, boolean fileType, int bno) {
		super();
		this.uuid = uuid;
		this.uploadPath = uploadPath;
		this.fileName = fileName;
		this.fileType = fileType;
		this.bno = bno;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public boolean isFileType() {
		return fileType;
	}

	public void setFileType(boolean fileType) {
		this.fileType = fileType;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

}
