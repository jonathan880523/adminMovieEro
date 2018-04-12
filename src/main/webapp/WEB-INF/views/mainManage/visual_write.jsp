<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />

<style>
.cf:after{display: block; content: ''; clear: both;}
.tab_menu{margin: 10px 0 20px 0;}
.tab_menu li{float: left; width: 50%; text-align: center; padding: 10px 0; background-color: #c1c1c1; list-style:none; border-radius: 5px;}
.tab_menu li.on{background-color: #03a9f4}
.tab_menu li a{display: block; color: #fff; font-weight: bold;}
/* 파일 업로드 */
.file_drop{width: 100%; height: 200px; border: 2px dotted #000;}
small{cursor: pointer;}
</style>

<div class="container-fluid">
	<div class="row-fluid">
	    <!-- form -->
		<form role="form" id="frmVisualImg" method="POST" action="visualWrite.do">
		 <!--/span-->
			<div class="span9" id="content">
				<div class="row-fluid">
				   	<!-- block -->
					<div class="block">
					    <div class="navbar navbar-inner block-header">
					        <div class="muted pull-left">비주얼이미지 등록</div>
					    </div>
					    <div class="tab_menu">
					    	<ul class="cf">
					    		<li class="on"><a href="visualList.do">비주얼 이미지</a></li>
					    		<li><a href="boxOfficeList.do">박스 오피스</a></li>
					    	</ul>
					    </div>
						<div class="block-content collapse in">
							<div class="span12">
								<div class="table-toolbar" style="margin-bottom:14px;">
									<div class="btn_board">
										<a class="btn" href="visualList.do"><i class="icon-eye-open"></i>목록</a>
										<!-- <a class="btn btn-inverse" href=""><i class="icon-refresh icon-white"></i>수정</a> -->
										<button class="btn btn-primary" id="iptVImgSubmit" type="button"><i class="icon-pencil icon-white"></i>등록</button>
										<a class="btn btn-danger" href=""><i class="icon-remove icon-white"></i>삭제</a>
									</div>	
								</div>

								<ul>
									<li><input type="text" id="iptMovieTitle" name="movie_title" /></li>
									<li>
										첨부하실 이미지를 아래박스에 드래그 해주세요
										<div class="file_drop"></div>
										<div class="upload_list"></div>
										<input type="hidden" class="ipt_img_url" name="iptImgUrl" value="" />								
									</li>
									<li>
										<label for="isAddY">등록 <input type="radio" id="isAddY" name="is_add" value="y" /></label>
										<label for="isAddN">미등록  <input type="radio" id="isAddN" name="is_add" value="n" checked="checked" /></label>
									</li>
								</ul>								
								
								<!-- <textarea name="ckeditorVisual" id="ckeditorVisual" rows="10" cols="80"></textarea> -->

							</div>
						</div>
					</div>
				<!-- /block -->
				</div>
			</div>
		</form>
	</div>
</div>
<script>
	$('#iptVImgSubmit').on('click', function(evt) {
		if($('#iptMovieTitle').val() === ''){
			alert('영화제목을 입력해주세요');
		} else if($('.upload_list small').children('input').val() === undefined) {
			alert('비주얼 이미지를 등록해주세요');
		} else {
			$('#frmVisualImg').submit();
		}		
	});


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
			url: 'deleteFile.do',
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
		
		if($('.upload_list').children('div').length === 0){
			var files = evt.originalEvent.dataTransfer.files;
			var file = files[0];
			//console.log(file);
			
			// ajax도 form태그로 만든 데이터 전송방식과 동일하게 파일 전송 가능(HTML5의 formData객체를 사용 )
			var formData = new FormData();
			formData.append("file", file);
			
			$.ajax({
				url: 'uploadAjax.do',
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
							+ "<small>X<input type='hidden' name='img_url' value='"+data+"'></small></div>";
					} else { // 그외 파일은 파일명만 출력
						str = "<div><a href='displayFile.do?fileName="+data+"'>" 
							+ getOriginalName(data) + "</a>";
							+ "<small>X<input type='hidden' name='img_url' value='"+data+"'></small></div>";
					}
					
					$(".upload_list").append(str);
				}
			});			
		} else {
			alert('이미지 파일은 하나만 등록 가능 합니다.');			
		}
	});
</script>
<script src="vendors/ckeditor/ckeditor.js"></script>
<script>
/*
	CKEDITOR.replace('ckeditorVisual');
	var ckContent = CKEDITOR.instances.ckeditorNoti
	ckContent.getData();
*/
</script>
<jsp:include page="../inc/footer.jsp" flush="false" />