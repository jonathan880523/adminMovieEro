package com.army.adminMovieEro.movieAddList.model.vo;

public class MovieVisualVo {
	private String VISUAL_SEQ;
	private String MOVIE_INFO_SEQ;
	private String MOVIE_TRAILER;
	private String MOVIE_STILLCUT;
	
	public MovieVisualVo() {};
	
	public MovieVisualVo(String vISUAL_SEQ, String mOVIE_INFO_SEQ, String mOVIE_TRAILER, String mOVIE_STILLCUT) {
		super();
		VISUAL_SEQ = vISUAL_SEQ;
		MOVIE_INFO_SEQ = mOVIE_INFO_SEQ;
		MOVIE_TRAILER = mOVIE_TRAILER;
		MOVIE_STILLCUT = mOVIE_STILLCUT;
	}

	public String getVISUAL_SEQ() {
		return VISUAL_SEQ;
	}

	public void setVISUAL_SEQ(String vISUAL_SEQ) {
		VISUAL_SEQ = vISUAL_SEQ;
	}

	public String getMOVIE_INFO_SEQ() {
		return MOVIE_INFO_SEQ;
	}

	public void setMOVIE_INFO_SEQ(String mOVIE_INFO_SEQ) {
		MOVIE_INFO_SEQ = mOVIE_INFO_SEQ;
	}

	public String getMOVIE_TRAILER() {
		return MOVIE_TRAILER;
	}

	public void setMOVIE_TRAILER(String mOVIE_TRAILER) {
		MOVIE_TRAILER = mOVIE_TRAILER;
	}

	public String getMOVIE_STILLCUT() {
		return MOVIE_STILLCUT;
	}

	public void setMOVIE_STILLCUT(String mOVIE_STILLCUT) {
		MOVIE_STILLCUT = mOVIE_STILLCUT;
	}

	@Override
	public String toString() {
		return "MovieVisualVo [VISUAL_SEQ=" + VISUAL_SEQ + ", MOVIE_INFO_SEQ=" + MOVIE_INFO_SEQ + ", MOVIE_TRAILER="
				+ MOVIE_TRAILER + ", MOVIE_STILLCUT=" + MOVIE_STILLCUT + "]";
	}
	
}
