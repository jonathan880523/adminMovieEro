<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<body class="sticky-menu">
<%-- <c:set var="loginId" value="${adminId}"/>
<c:if test="${empty loginId}">
<script>
location.href="./logOut.do"
</script>
   <c:redirect url="${pageContext.request.contextPath}/logOut.do" />
</c:if>
 --%><div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
	    <div class="container-fluid">
	        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
	        </a>
	        <a class="brand" href="${pageContext.request.contextPath}/main.do"><strong>movie愛路 관리자</strong></a>
	        <div class="nav-collapse collapse">
	            <ul class="nav pull-right">
	                <li>
	                    <a tabindex="-1" href="${pageContext.request.contextPath}/logOut.do">Logout</a>
	                </li>
	            </ul>
	        </div>
	        <!--/.nav-collapse -->
	    </div>
	</div>
</div>
<div class="span3" id="sidebar">
	 <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
	     <li>
	         <a href="${pageContext.request.contextPath}/loadMovie.do"><i class="icon-chevron-right"></i>영화 목록</a>
	     </li>
	     <li>
	         <a href="${pageContext.request.contextPath}/loadReview.do"><i class="icon-chevron-right"></i>영화 리뷰 목록</a>
	     </li>
	     <li>
	         <a href="${pageContext.request.contextPath}/loadDetail.do"><i class="icon-chevron-right"></i>영화 디테일 목록</a>
	     </li>
	     <li>
	         <a href="theaterList.do"><i class="icon-chevron-right"></i>영화관 목록</a>
	     </li>
	     <li>
	         <a href="noticeAdmin.do"><i class="icon-chevron-right"></i>공지사항 목록</a>
	     </li>
	     <li>
	         <a href="#"><i class="icon-chevron-right"></i>회원정보 목록</a>
	     </li>
	     <li>
	         <a href="visualList.do"><i class="icon-chevron-right"></i>메인화면 관리</a>
	     </li>	     
	 </ul>
</div>	
