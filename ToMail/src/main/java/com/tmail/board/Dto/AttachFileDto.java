package com.tmail.board.Dto;

public class AttachFileDto {

	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
	
	public AttachFileDto() {
		super();
	}

	public AttachFileDto(String fileName, String uploadPath, String uuid, boolean image) {
		super();
		this.fileName = fileName;
		this.uploadPath = uploadPath;
		this.uuid = uuid;
		this.image = image;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public boolean isImage() {
		return image;
	}

	public void setImage(boolean image) {
		this.image = image;
	}
}
