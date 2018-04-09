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
<div class="container-fluid">
	<div class="row-fluid">
	    <!-- form -->
		<form role="form">
		 <!--/span-->
			<div class="span9" id="content">
				<div class="row-fluid">
				   	<!-- block -->
					<div class="block">
					    <div class="navbar navbar-inner block-header">
					        <div class="muted pull-left">메인화면 리스트</div>
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
										<a class="btn" href=""><i class="icon-eye-open"></i>목록</a>
										<!-- <a class="btn btn-inverse" href=""><i class="icon-refresh icon-white"></i>수정</a> -->
										<a class="btn btn-primary" href=""><i class="icon-pencil icon-white"></i>확인</a>
										<a class="btn btn-danger" href=""><i class="icon-remove icon-white"></i>삭제</a>
									</div>	
								</div>

								<textarea name="ckeditorVisual" id="ckeditorVisual" rows="10" cols="80">
								</textarea>

							</div>
						</div>
					</div>
				<!-- /block -->
				</div>
			</div>
		</form>
	</div>
</div>
<script src="vendors/ckeditor/ckeditor.js"></script>
<script>
	CKEDITOR.replace('ckeditorVisual');
	var ckContent = CKEDITOR.instances.ckeditorNoti
	ckContent.getData();
</script>
<jsp:include page="../inc/footer.jsp" flush="false" />