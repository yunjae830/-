package com.tmail.board.Dto;

import java.util.List;

public class InsertResultDto {

	private List<String> emailFalse;
	private List<String> nameFalse;
	private int sum;
	
	public List<String> getEmailFalse() {
		return emailFalse;
	}
	public void setEmailFalse(List<String> emailFalse) {
		this.emailFalse = emailFalse;
	}
	public List<String> getNameFalse() {
		return nameFalse;
	}
	public void setNameFalse(List<String> nameFalse) {
		this.nameFalse = nameFalse;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
}
