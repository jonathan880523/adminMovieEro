package com.army.adminMovieEro.mainManage.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

/**
 * MediaUtils : 확장자를 가지고 이미지인지 구분하는 클래스
 * 브라우저에서 파일을 다운로드 할 것인지 보여줄 것인지 결정하기 위해 필요
 * */
public class MediaUtils {
	private static Map<String, MediaType> mediaMap;
	
	static {
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	public static MediaType getMediaType(String type) {
		
		return mediaMap.get(type.toUpperCase());
	}
	
}
