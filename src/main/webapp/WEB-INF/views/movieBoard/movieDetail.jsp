<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
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
					        <div class="muted pull-left">영화 리스트</div>
					    </div>
						<div class="block-content collapse in">
							<div class="span12">
								<div class="table-toolbar" style="margin-bottom:14px;">
									<div class="btn-group">
										<button type="button" id="insertMovieBtn" class="btn btn-primary">추가<i class="icon-plus icon-white"></i></button>
									</div>
									<div class="btn-group">
										<button type="button" id="deleteBtn" class="btn btn-primary">삭제<i class="icon-remove icon-white"></i></button>
									</div>
									<div class="btn-group">
										<button type="button" id="insertVisualItemsBtn" class="btn btn-primary">영상추가<i class="icon-film icon-white"></i></button>
									</div>
									<div class="btn-group">
										<button type="button" id="insertDetailInfoBtn" class="btn btn-primary">영화정보 추가<i class="icon-list icon-white"></i></button>
									</div>
								</div>
								<table id="movieListTable" border="0" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th><input type="checkbox"></th>
											<th>제목</th>
											<th>장르</th>
											<th>국가</th>
											<th>런타임</th>
											<th>개봉일</th>
											<th>배우</th>
											<th>감독</th>
											<th>등급</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="movieDetailResult" value="${requestScope.detailResult}" /> 
										<c:forEach var="listMap" items="${movieDetailResult}">
										<tr class="odd gradeX">
									 		<td><input type="checkbox" name="movieUniNumDel" value="${listMap.MOVIE_INFO_SEQ}"></td>
									    	<td>${listMap.MV_TITLE}</a></td>
									    	<td>${listMap.MV_GENRE}</td>
									    	<td>${listMap.MV_COUNTRY}</td>
									    	<td>${listMap.MV_RUNTIME}</td>
									    	<td>${listMap.MV_RELEASE_DATE}</td>
									    	<td>${listMap.MV_ACTOR}</td>
									    	<td>${listMap.MV_DIRECTOR}</td>
									    	<td>${listMap.MV_GRADE}</td>
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
</script>
<jsp:include page="../inc/footer.jsp" flush="false" />