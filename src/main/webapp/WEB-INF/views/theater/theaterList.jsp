<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
<style type="text/css">
div.wizard-navigation .nav-pills>li+li {
	margin-left: 0px;
}

#wizard .nav-pills>li>a {
	background-color: transparent;
}
.my-image {
    width: 150px;
    height: auto;
}

#map {
	height: 350px;
	width: 100%;
}

.mda-list>.mda-list-item>.mda-list-item-text h3, .mda-list>.mda-list-item>.mda-list-item-text h4
	{
	line-height: 1em;
}

.mda-form-control .bootstrap-tagsinput, .mda-form-control .bootstrap-tagsinput input
	{
	width: 100%;
	padding: 2px;
	background-color: transparent !important;
	height: auto;
	border: 0;
	border-radius: 0;
	box-shadow: none;
	border: 0;
}

.mda-list>.mda-list-item>.mda-list-item-text {
	float: none;
}
</style>
<div class="container-fluid">
	<div class="row-fluid">
	    <!-- form -->
		<form name="form" enctype="multipart/form-data">
		 <!--/span-->
			<div class="span9" id="content">
				<div class="row-fluid">
				   	<!-- block -->
					<div class="block">
					    <div class="navbar navbar-inner block-header">
					        <div class="muted pull-left">영화관 리스트</div>
					    </div>
						<div class="block-content collapse in">
							<div class="span12">
								<div class="table-toolbar">
									<div class="btn-group">
										<button type="button" id="insertMovieBtn" class="btn btn-primary">추가<i class="icon-plus icon-white"></i></button>
									</div>
									<div class="btn-group">
										<button type="button" id="deleteBtn" class="btn btn-primary">삭제<i class="icon-remove icon-white"></i></button>
									</div>
									<div class="btn-group">
										<button type="button" id="insertVisualItemsBtn" class="btn btn-primary">사진추가<i class="icon-film icon-white"></i></button>
										<input type="file"  name="image" />
									</div>
								</div>
								<table id="movieListTable" border="0" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th><input type="checkbox"></th>
											<th>지점명</th>
											<th>주소</th>
											<th>가격</th>
											<th>정보</th>
											<th>이미지</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="theaterlist" value="${requestScope.theaterlist}"></c:set>
										<c:forEach var="theater" items="${theaterlist}">
										<tr class="odd gradeX">
									 		<td><input type="checkbox" id = "RENTAL_SERVICE_NO" name="RENTAL_SERVICE_NO" value="${theater.RENTAL_SERVICE_NO}"></td>
									    	<td>${theater.RENTAL_SERVICE_TITLE}</td>
									    	<td>${theater.RENTAL_SERVICE_POSITION}</td>
									    	<td>${theater.RENTAL_SERVICE_PRICE}</td>
									    	<td>${theater.RENTAL_SERVICE_INFO}</td>
									    	<td>
									    	
									    	<c:set var="theaterImage" value="${requestScope.theaterImage}"></c:set>
											<c:forEach var="theaterImg" items="${theaterImage}">
											<c:if test="${theater.RENTAL_SERVICE_NO eq theaterImg.RENTAL_SERVICE_NO}">
											<input>
											${theaterImg.RENTAL_SERVICE_OIMAGE}<br>
											<button id ="imaView" onclick="imaView();">사진보기</button>
											<button id="imgDelete"  onclick="imaDelete();">삭제하기</button><br>
											</c:if>
											</c:forEach>
									    	</td>	
										</tr>
									</c:forEach>
									</tbody>
								</table>
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
//영화 목록에서 영화 삭제
var formObj = $('form[name="form"]');

$(document).ready(function(){
		//영화 추가 페이지로 이동
		$("#insertMovieBtn").on('click', function(){
   		formObj.attr('action','${pageContext.request.contextPath}/addtheater.do');
   		formObj.attr('method','post');
   		formObj.submit();
		});
	
		//영화 목록에서 영화 삭제
		$("#deleteBtn").on('click', function(){
   		formObj.attr('action','${pageContext.request.contextPath}/deledtTheater.do');
   		formObj.attr('method','post');
   		formObj.submit();
		});
	   	//영상 추가 목록으로 이동
   	$("#insertVisualItemsBtn").on('click', function(){
   		formObj.attr('action','${pageContext.request.contextPath}/theaterFileUpload.do');
   		formObj.attr('method','post');
   		formObj.submit();
		});
})

function imaView() {
	alert("버튼1을 누르셨습니다.");
}

function DeleteView() {
	alert("버튼2을 누르셨습니다.");
}

</script>