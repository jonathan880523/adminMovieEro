package com.army.adminMovieEro.movieAddList.model.vo;

public class MovieAddListVo {
	private String ADMIN_ID;
	private String THEATER;
	private String TITLE;
	private String SUB_TITLE;
	private String PUB_DATE;
	private String DIRECTOR;
	private String ACTOR;
	private String USER_RATING;
	private String IMAGE;
	private String LINK;
	private int SEQUENCE;
	
	public MovieAddListVo() {
		super();
	}

	public MovieAddListVo(String aDMIN_ID, String tHEATER, String tITLE, String sUB_TITLE, String pUB_DATE,
			String dIRECTOR, String aCTOR, String uSER_RATING, String iMAGE, String lINK, int sEQUENCE) {
		super();
		ADMIN_ID = aDMIN_ID;
		THEATER = tHEATER;
		TITLE = tITLE;
		SUB_TITLE = sUB_TITLE;
		PUB_DATE = pUB_DATE;
		DIRECTOR = dIRECTOR;
		ACTOR = aCTOR;
		USER_RATING = uSER_RATING;
		IMAGE = iMAGE;
		LINK = lINK;
		SEQUENCE = sEQUENCE;
	}

	public String getADMIN_ID() {
		return ADMIN_ID;
	}

	public void setADMIN_ID(String aDMIN_ID) {
		ADMIN_ID = aDMIN_ID;
	}

	public String getTHEATER() {
		return THEATER;
	}

	public void setTHEATER(String tHEATER) {
		THEATER = tHEATER;
	}

	public String getTITLE() {
		return TITLE;
	}

	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}

	public String getSUB_TITLE() {
		return SUB_TITLE;
	}

	public void setSUB_TITLE(String sUB_TITLE) {
		SUB_TITLE = sUB_TITLE;
	}

	public String getPUB_DATE() {
		return PUB_DATE;
	}

	public void setPUB_DATE(String pUB_DATE) {
		PUB_DATE = pUB_DATE;
	}

	public String getDIRECTOR() {
		return DIRECTOR;
	}

	public void setDIRECTOR(String dIRECTOR) {
		DIRECTOR = dIRECTOR;
	}

	public String getACTOR() {
		return ACTOR;
	}

	public void setACTOR(String aCTOR) {
		ACTOR = aCTOR;
	}

	public String getUSER_RATING() {
		return USER_RATING;
	}

	public void setUSER_RATING(String uSER_RATING) {
		USER_RATING = uSER_RATING;
	}

	public String getIMAGE() {
		return IMAGE;
	}

	public void setIMAGE(String iMAGE) {
		IMAGE = iMAGE;
	}
	
	public String getLINK() {
		return LINK;
	}
	
	public void setLINK(String lINk) {
		LINK = lINk;
	}
	
	public int getSEQUENCE() {
		return SEQUENCE;
	}

	@Override
	public String toString() {
		return "MovieAddListVo [ADMIN_ID=" + ADMIN_ID + ", THEATER=" + THEATER + ", TITLE=" + TITLE + ", SUB_TITLE="
				+ SUB_TITLE + ", PUB_DATE=" + PUB_DATE + ", DIRECTOR=" + DIRECTOR + ", ACTOR=" + ACTOR
				+ ", USER_RATING=" + USER_RATING + ", IMAGE=" + IMAGE + ", LINK=" + LINK + ", SEQUENCE=" + SEQUENCE
				+ "]";
	}
}
