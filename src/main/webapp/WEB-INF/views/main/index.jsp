<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
        <div class="container-fluid">
            <div class="row-fluid">
                <!--/span-->
                <div class="span9" id="content">
                    <div class="row-fluid">
                        <div class="alert alert-success">
                            <h4>${getPosition}님</h4>
                        	환영합니다</div>
                        	<div class="navbar">
                        	</div>
                    	</div>
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="span12">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                </div>
                                <div class="block-content collapse in">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>영화 제목</th>
                                                <th>스틸컷 갯수</th>
                                                <th>트레일러 갯수</th>
                                                <th>리뷰 갯수</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:set var="MVList" value="${requestScope.movieInfoList}"/>
                                        <c:forEach var="listCounts" items="${MVList}" varStatus="status">
                                            <tr>
                                                <td>${status.count}</td>
                                                <td>${listCounts.MVTItle}</td>
                                                <td>${listCounts.stillcutSize}</td>
                                                <td>${listCounts.trailerSize}</td>
                                                <td>${listCounts.reviewSize}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                        </div>
                    </div>
                </div>
            </div>
           </div>
        <script>
        $(function() {
        });
        </script>
        <jsp:include page="../inc/footer.jsp" flush="false" />