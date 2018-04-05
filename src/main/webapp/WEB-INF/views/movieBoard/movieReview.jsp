<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
<div class="container-fluid">
	<div class="row-fluid">
		<form id="formSeachReview">
			<div class="span9" id="content">
				<div class="row-fluid">
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">영화 리뷰 목록</div>
						</div>
						<c:set var="loadMVTitle" value="${resultMVTitle}"/>
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">
								<input name="seachTitle" type="text" value="">
								<button id="searchReview" class="btn btn-primary" type="submit">검색</button>
							</div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
								<table class="table table-striped">
									<thead>
										<tr>
											<th><input type="checkbox"></th>
											<th>영화 제목</th>
											<th>제목</th>
											<th>작성자</th>
											<th>내용</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="reviewList" items="${loadMVTitle}">
										<tr>
											<td><input type="checkbox" value="${reviewList.MV_RV_SEQ}"></td>
											<td>${reviewList.MV_TITLE}</td>
											<td>${reviewList.MV_RV_TITLE}</td>
											<td>${reviewList.USER_ID}</td>
											<td colspan="3"><textarea rows="4" cols="100" readOnly>
												${reviewList.MV_RV_CONTENTS}
											</textarea></td>
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
	$(document).ready(function(){
		$("#searchReview").on('click',function(){
			$("#formSeachReview").attr('action','searchReview.do')
								 .attr('method','get')
								 .submit();
		});
	})
</script>
<jsp:include page="../inc/footer.jsp" flush="false" />