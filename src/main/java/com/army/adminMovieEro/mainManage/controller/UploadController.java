package com.army.adminMovieEro.mainManage.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.army.adminMovieEro.mainManage.util.MediaUtils;
import com.army.adminMovieEro.mainManage.util.UploadFileUtils;


@Controller
public class UploadController {
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	@Resource(name = "uploadPath")
	private String uploadPath;

	// deleteFile(삭제할 파일의 이름) => 이미지: 썸네일이름, 파일: 실제이름
	@ResponseBody
	@RequestMapping(value="deleteFile.do", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {
		// 파일이름에서 확장자 추출
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1); 
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null) { // 이미지파일일 경우 썸네일이름이 아닌 실제파일부터 제거
			// '/년/월/일'을 추출
			String front = fileName.substring(0, 12); 
			// 경로에서 's_'를 제거
			String end = fileName.substring(14);
			new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		}
		// 파일이름(썸네일이름이나 실제이름)이 일치하는 것을 제거
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}		
	
	// http://localhost:포트명/displayFile.do?fileName=/년/월/일/파일명.확장자 => 이미지파일 : 새창띄움, 그외 : 다운로드
	@ResponseBody // @ResponseBody를 이용해서 byte[] 데이터가 그대로 전송될 것임을 명시
	@RequestMapping("displayFile.do")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		logger.info("FILE NAME : " + fileName);

		try {
			// 파일이름에서 확장자 추출
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath+fileName);
			
			// 브라우저는 타입을 보고 보여줄지 다운로드창 띄울지를 결정함
			if (mType != null) {
				// 이미지타입인 경우 MIME타입 지정
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.lastIndexOf("_")+1);
				// 이미지가 아닌 경우 다운로드용으로 사용되는 "application/octet-stream"으로 지정 
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}
			
			// IOUtils.toByteArray() : 대상파일에서 데이터를 읽어냄
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
				
		return entity;
	}	
	
	@RequestMapping(value="uploadAjax.do" , method = RequestMethod.GET)
	public String uploadAjaxGet() throws Exception {
		return "uploadAjax";
	}	
	
	@ResponseBody
	@RequestMapping(value = "uploadAjax.do", 
					method = RequestMethod.POST,
					produces = "text/plain;charset=UTF-8") // 한국어 전송 위해 필요
	public ResponseEntity<String> uploadAjaxPost(MultipartFile file) throws Exception{
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());	
		// HttpStatus.CREATED : 원하는 리소스가 정상 생성됨
		return new ResponseEntity<>(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), 
				HttpStatus.CREATED
				);
	}	
	
	@RequestMapping(value="uploadForm.do" , method = RequestMethod.GET)
	public String uploadFormGet() {
		return "uploadForm";
	}
	
	@RequestMapping(value="uploadForm.do" , method = RequestMethod.POST)
	public void uploadFormPost(MultipartFile file, Model model) throws Exception {
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
	
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("savedName", savedName);
	}

	// 원본 파일의 이름과 파일 데이터를 byte[]로 변환한 정보를 파라미터로 처리해서 실제로 파일 업로드
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		// 중복되지 않는 고유한 키값을 설정
		UUID uid = UUID.randomUUID();
		
		// uploadPath에 지정한 파일이름으로 생성
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);

		// FileCopyUtils : 스프링에서 제공하는 파일처리
		FileCopyUtils.copy(fileData, target); 
		
		return savedName;
	}

}
