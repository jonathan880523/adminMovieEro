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
								<input name="searchValue" type="text" value="">
								<select id="searchOption" name="searchOption">
									<option selected disabled>선택</option>
									<option id="MVTitle" value="reviewMVTitle">영화 제목</option>
									<option id="reviewSubject" value="reviewSubject">제목</option>
									<option id="reviewUserId" value="reviewUserId">작성자</option>
									<option id="reviewContext" value="reviewContext">내용</option>
								</select>
								<button id="searchReviewBtn" class="btn btn-primary" type="submit" style="margin-bottom:14px;">검색</button>
								<button id="deleteReviewBtn" class="btn btn-primary" style="margin-bottom:14px;">삭제</button>
								<button id="reloadReviewBtn" class="btn btn-primary" style="margin-bottom:14px;">초기화</button>
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
											<td><input type="checkbox" name="reviewSeq" value="${reviewList.MV_RV_SEQ}"></td>
											<td>${reviewList.MV_TITLE}</td>
											<td>${reviewList.MV_RV_TITLE}</td>
											<td>${reviewList.USER_ID}</td>
											<td><textarea rows="4" cols="200" readOnly>
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
		$("#searchReviewBtn").on('click',function(){
			$("#formSeachReview").attr('action','searchReview.do')
								 .attr('method','get')
								 .submit();
		});
		
		$("#deleteReviewBtn").on('click',function(){
			$("#formSeachReview").attr('action','deleteReview.do')
								 .attr('method','get')
								 .submit();
		});
		
		$("#reloadReviewBtn").on('click',function(){
			$("#formSeachReview").attr('action','reloadReview.do')
								 .attr('method','get')
								 .submit();
		});
	})
</script>
<jsp:include page="../inc/footer.jsp" flush="false" />