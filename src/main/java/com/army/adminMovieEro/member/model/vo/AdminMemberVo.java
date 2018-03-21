package com.army.adminMovieEro.member.model.vo;

public class AdminMemberVo {
	private String ADMIN_ID;
	private String ADMIN_PW;
	private String POSITION;
	
	public AdminMemberVo() {
		super();
	}

	public AdminMemberVo(String aDMIN_ID, String aDMIN_PW, String pOSITION) {
		super();
		ADMIN_ID = aDMIN_ID;
		ADMIN_PW = aDMIN_PW;
		POSITION = pOSITION;
	}

	public String getADMIN_ID() {
		return ADMIN_ID;
	}

	public void setADMIN_ID(String aDMIN_ID) {
		ADMIN_ID = aDMIN_ID;
	}

	public String getADMIN_PW() {
		return ADMIN_PW;
	}

	public void setADMIN_PW(String aDMIN_PW) {
		ADMIN_PW = aDMIN_PW;
	}

	public String getPOSITION() {
		return POSITION;
	}

	public void setPOSITION(String pOSITION) {
		POSITION = pOSITION;
	}

	@Override
	public String toString() {
		return "AdminMemberVo [ADMIN_ID=" + ADMIN_ID + ", ADMIN_PW=" + ADMIN_PW + ", POSITION=" + POSITION + "]";
	}
	
}
