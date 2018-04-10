<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
var result = '${msg}';
if(result !== '') {
	alert('글이 ${msg}'+' 완료되었습니다');
}
</script>

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
					        <div class="muted pull-left">비주얼이미지 목록</div>
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
										<!-- <a class="btn" href=""><i class="icon-eye-open"></i>목록</a> -->
										<!-- <a class="btn btn-inverse" href=""><i class="icon-refresh icon-white"></i>수정</a> -->
										<a class="btn btn-primary" href="visualWrite.do"><i class="icon-pencil icon-white"></i>등록</a>
										<!-- <a class="btn btn-danger" href=""><i class="icon-remove icon-white"></i>삭제</a> -->
									</div>
								</div>
								<table id="movieListTable" border="0" class="table table-striped table-bordered">
									<colgroup>
										<col width="8%">
										<col width="25%">
										<col width="40%">
										<col width="17%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th>글번호</th>
											<th>영화제목</th>
											<th>이미지주소</th>
											<th>등록일자</th>
											<th>등록여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${requestScope.listVO}" var="vo">
											<tr class="odd gradeX">
										    	<td>${vo.img_no}</td>
										    	<td><a href="visualView.do?img_no=${vo.img_no}">${vo.movie_title}</a></td>
										    	<td>${vo.img_url}</td>
										    	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.reg_date}"/></td>
										    	<c:if test="${vo.is_add == 'y'}">
											    	<td>등록</td>									    	
										    	</c:if>
										    	<c:if test="${vo.is_add == 'n'}">
											    	<td>미등록</td>									    											    	
										    	</c:if>
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

<jsp:include page="../inc/footer.jsp" flush="false" />