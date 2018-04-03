<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body class="sticky-menu">
<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
	    <div class="container-fluid">
	        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
	        </a>
	        <a class="brand" href="#"><strong>movie愛路 관리자</strong></a>
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
	         <a href="calendar.html"><i class="icon-chevron-right"></i>영화관 목록</a>
	     </li>
	     <li>
	         <a href="stats.html"><i class="icon-chevron-right"></i>공지사항 목록</a>
	     </li>
	     <li>
	         <a href="form.html"><i class="icon-chevron-right"></i>회원정보 목록</a>
	     </li>
	 </ul>
</div>	
