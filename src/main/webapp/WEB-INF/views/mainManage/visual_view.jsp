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
</style>
<script>
$(function(){
	var $form = $('#frmVisualView');
	$('#btnVvMod').on('click', function(){
		$form.attr('action', 'visualModi.do').attr('method', 'get').submit();
	});
	$('#btnVvDel').on('click', function(){
		$form.attr('action', 'visualDel.do').submit();		
	});
});
</script>
<div class="container-fluid">
	<div class="row-fluid">
	    <!-- form -->
		<form role="form" id="frmVisualView" method="post">
			<!-- 삭제할 글 번호  -->		
			<input type="hidden" name="img_no" value="${visualImageVO.img_no}" />
			
			<div class="span9" id="content">
				<div class="row-fluid">
				   	<!-- block -->
					<div class="block">
					    <div class="navbar navbar-inner block-header">
					        <div class="muted pull-left">비주얼이미지 상세</div>
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
										<button class="btn btn-inverse" id="btnVvMod" type="button"><i class="icon-refresh icon-white"></i>수정</button>
										<button class="btn btn-danger" id="btnVvDel" type="button"><i class="icon-remove icon-white"></i>삭제</button>
										<!-- <a class="btn btn-primary" href=""><i class="icon-pencil icon-white"></i>등록</a> -->
									</div>						
								</div>
									뷰페이지
								<div>
									<ul>
										<li>글번호 : ${visualImageVO.img_no}</li>
										<li>영화제목 : ${visualImageVO.movie_title}</li>
										<li>이미지주소 : ${visualImageVO.img_url}</li>
										<li>등록일 : ${visualImageVO.reg_date}</li>
										<li>등록여부 : ${visualImageVO.is_add}</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				<!-- /block -->
				</div>
			</div>
		</form>
	</div>
</div>

<jsp:include page="../inc/footer.jsp" flush="false" />