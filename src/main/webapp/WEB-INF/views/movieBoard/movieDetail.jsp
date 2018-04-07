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
					        <div class="muted pull-left">영화 디테일</div>
					    </div>
						<div class="block-content collapse in">
							<div class="span12">
								<div class="table-toolbar" style="margin-bottom:14px;">
								</div>
								<table id="movieListTable" border="0" class="table table-striped table-bordered">
									<thead>
										<tr>
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
									 		<input type="hidden" name="hiddenSeq" value="${listMap.MV_INFO_SEQ}">
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