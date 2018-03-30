package com.army.adminMovieEro.movieAddList.model.vo;

public class MovieListVo {
	private String TITLE;
	private String SUB_TITLE;
	private String PUB_DATE;
	private String DIRECTOR;
	private String ACTOR;
	private String USER_RATING;
	private String LINK;
	private int MOVIE_INFO_SEQ;

	public MovieListVo() {
		super();
	}

	public MovieListVo(String TITLE, String SUB_TITLE, String PUB_DATE, String DIRECTOR, String ACTOR,
			String USER_RATING, String LINK, int MOVIE_INFO_SEQ) {
		super();
		this.TITLE = TITLE;
		this.SUB_TITLE = SUB_TITLE;
		this.PUB_DATE = PUB_DATE;
		this.DIRECTOR = DIRECTOR;
		this.ACTOR = ACTOR;
		this.USER_RATING = USER_RATING;
		this.LINK = LINK;
		this.MOVIE_INFO_SEQ = MOVIE_INFO_SEQ;
	}

	
	public MovieListVo(String TITLE, int MOVIE_INFO_SEQ) {
		super();
		this.TITLE = TITLE;
		this.MOVIE_INFO_SEQ = MOVIE_INFO_SEQ;
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

	public String getLINK() {
		return LINK;
	}

	public void setLINK(String lINk) {
		LINK = lINk;
	}

	public int getMOVIE_INFO_SEQ() {
		return MOVIE_INFO_SEQ;
	}

	@Override
	public String toString() {
		return "MovieListVo [TITLE=" + TITLE + ", SUB_TITLE=" + SUB_TITLE + ", PUB_DATE=" + PUB_DATE + ", DIRECTOR="
				+ DIRECTOR + ", ACTOR=" + ACTOR + ", USER_RATING=" + USER_RATING + ", LINK=" + LINK
				+ ", MOVIE_INFO_SEQ=" + MOVIE_INFO_SEQ + "]";
	}
}
