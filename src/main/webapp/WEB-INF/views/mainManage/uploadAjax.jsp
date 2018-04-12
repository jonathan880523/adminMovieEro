<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Ajax로 파일 업로드</title>
<style>
.file_drop{width: 100%; height: 200px; border: 2px dotted #000;}
small{cursor: pointer;}
</style>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body>
	<h1>Ajax File Upload</h1>
	<div class="file_drop">
	
	</div>
	<div class="upload_list">
	
	</div>
<script>
	// 섬네일이 아닌 원본 이미지 경로 가져오기
	function getImageLink(fileName) {
		if(!checkImageType(fileName)){
			return;
		}
		// '/년/월/일'을 추출
		var front = fileName.substr(0, 12);
		// 경로에서 's_'를 제거
		var end = fileName.substr(14);
		
		return front + end;
	}

	// 첨부파일 이름이 UUID와 결합될때 "_"가 사용되는 것을 이용해서 원래의 파일이름만 추출
	function getOriginalName(fileName) {
		if(checkImageType(fileName)){
			return;
		}
		
		var idx = fileName.indexOf("_") + 1;
		return fileName.substr(idx);
	}
	
	// 파일의 확장자가 존재하는지 검사
	function checkImageType(fileName) {
		// i의 의미는 대소문자 구분없앰
		var pattern = /jpg|gif|png|jpeg/i;
		return fileName.match(pattern);
	}

	// preventDefault() : 브라우저 새창에서 파일 열리는거 막기위함
	$('.file_drop').on('dragenter dragover', function(evt) {
		evt.preventDefault();
	});
	
	// 클릭으로 파일삭제
	$('.upload_list').on('click', 'small', function(evt) {
		var that = $(this);
	
		$.ajax({
			url: '/deleteFile.do',
			type: 'POST',
			dataType: 'text',
			data: {fileName:that.children('input').val()},
			success: function(result){
				if(result==='deleted'){
					//alert('삭제완료');
					that.parent('div').remove();
				}
			}			
		});
		
	});
	
	// 드래그드랍으로 파일추가
	$('.file_drop').on('drop', function(evt) {
		evt.preventDefault();
		
		var files = evt.originalEvent.dataTransfer.files;
		var file = files[0];
		//console.log(file);
		
		// ajax도 form태그로 만든 데이터 전송방식과 동일하게 파일 전송 가능(HTML5의 formData객체를 사용 )
		var formData = new FormData();
		formData.append("file", file);
		
		$.ajax({
			url: '/uploadAjax.do',
			data: formData,
			dataType: 'text',
			processData: false, // 데이터를 query string으로 변환 할 것인지(application / x-www-form-urlencoded)
			contentType: false, // Content-Type: multipart/form-data
			type: 'POST',
			success: function(data){
				//alert(data);
				var str = "";
				
				if(checkImageType(data)) { // 이미지 파일은 섬네일과 파일명 출력
					str = "<div><a href='displayFile.do?fileName=" + getImageLink(data) +"'>"
						+ "<img src='displayFile.do?fileName=" + data + "'/></a>"
						+ "<small>X<input type='hidden' value='"+data+"'></small></div>";
				} else { // 그외 파일은 파일명만 출력
					str = "<div><a href='displayFile.do?fileName="+data+"'>" 
						+ getOriginalName(data) + "</a>";
						+ "<small>X<input type='hidden' value='"+data+"'></small></div>";
				}
				
				$(".upload_list").append(str);
			}
		});
	});
	

</script>
</body>
</html>