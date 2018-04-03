package com.army.adminMovieEro.movieAddList.model.vo;

public class MovieVisualVo {
	private int MV_VISUAL_SEQ;
	private int MV_INFO_SEQ;
	private String MV_TITLE;
	private String MV_STILLCUT;
	private String MV_TRAILER;
	
	public MovieVisualVo() {}

	public MovieVisualVo(int mV_VISUAL_SEQ, int mV_INFO_SEQ, String mV_TITLE, String mV_STILLCUT, String mV_TRAILER) {
		super();
		MV_VISUAL_SEQ = mV_VISUAL_SEQ;
		MV_INFO_SEQ = mV_INFO_SEQ;
		MV_TITLE = mV_TITLE;
		MV_STILLCUT = mV_STILLCUT;
		MV_TRAILER = mV_TRAILER;
	}

	public int getMV_VISUAL_SEQ() {
		return MV_VISUAL_SEQ;
	}

	public void setMV_VISUAL_SEQ(int mV_VISUAL_SEQ) {
		MV_VISUAL_SEQ = mV_VISUAL_SEQ;
	}

	public int getMV_INFO_SEQ() {
		return MV_INFO_SEQ;
	}

	public void setMV_INFO_SEQ(int mV_INFO_SEQ) {
		MV_INFO_SEQ = mV_INFO_SEQ;
	}

	public String getMV_TITLE() {
		return MV_TITLE;
	}

	public void setMV_TITLE(String mV_TITLE) {
		MV_TITLE = mV_TITLE;
	}

	public String getMV_STILLCUT() {
		return MV_STILLCUT;
	}

	public void setMV_STILLCUT(String mV_STILLCUT) {
		MV_STILLCUT = mV_STILLCUT;
	}

	public String getMV_TRAILER() {
		return MV_TRAILER;
	}

	public void setMV_TRAILER(String mV_TRAILER) {
		MV_TRAILER = mV_TRAILER;
	}

	@Override
	public String toString() {
		return "MovieVisualVo [MV_VISUAL_SEQ=" + MV_VISUAL_SEQ + ", MV_INFO_SEQ=" + MV_INFO_SEQ + ", MV_TITLE="
				+ MV_TITLE + ", MV_STILLCUT=" + MV_STILLCUT + ", MV_TRAILER=" + MV_TRAILER + "]";
	};
}
