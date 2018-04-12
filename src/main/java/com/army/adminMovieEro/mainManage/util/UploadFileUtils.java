package com.army.adminMovieEro.mainManage.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	
	// 아이콘 생성 : 이미지가 아닌 경우
	private static String makeIcon(String uploadPath, String path, String fileName) {
		String iconName = uploadPath + path + File.separator + fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	// 썸네일 생성 : 이미지인  경우
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		// FIT_TO_HEIGHT로 높이값을 100px로 만듬
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		// 썸네일 이미지 파일명 앞에는 s_를 붙임
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName, newFile);
		
		// 윈도우 경로을 유닉스경로 /로 변경
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	// 폴더 생성
	private static void makeDir(String uploadPath, String... paths) {
		if(new File(paths[paths.length-1]).exists()) {
			return;
		}
		
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if( !dirPath.exists() ) {
				dirPath.mkdir();
			}
		}
	}
	
	// 저장경로 생성 => 년,월,일로 경로생성해서 makeDir() 호출
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		return datePath;
	}


	// 파일업로드메서드(파일의 저장경로, 원본파일의 이름, 파일의 데이터)
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		// 중복되지 않는 고유한 키값을 설정
		UUID uid = UUID.randomUUID();
		
		// uploadPath에 지정한 파일이름으로 생성
		String savedName = uid.toString() + "_" + originalName;
		
		// 저장경로
		String savedPath = calcPath(uploadPath);
				
		File target = new File(uploadPath+savedPath, savedName);

		// FileCopyUtils : 스프링에서 제공하는 파일처리
		FileCopyUtils.copy(fileData, target); 
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		String uploadedFileName = null;
		
		// MediaUtils클래스의 메소드를 이용해서 이미지인지 아닌지에 따른 분기처리
		if (MediaUtils.getMediaType(formatName) != null) {
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		
		return uploadedFileName;
	}

}
