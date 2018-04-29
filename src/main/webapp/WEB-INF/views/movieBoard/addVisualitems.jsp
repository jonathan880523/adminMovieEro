<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
<div class="container-fluid">
    <div class="row-fluid">
        <!-- form -->
        <form role="form">
         <!--/span-->
            <div class="row-fluid">
         	<div class="span4" id="content">
                 <!-- block -->
                 <c:set var="visualSession" value="${sessionScope.visualMap}" />
                 <c:set var="stillcut" value="${requestScope.resultStillcutList}"/>
                 <c:set var="trailer" value="${requestScope.resultTrailerList}"/>
                 <div class="block">
                     <div class="navbar navbar-inner block-header">
						 <div class="muted pull-left"><c:out value="${visualSession.MVTitle}"></c:out>: 스틸컷</div>
                     </div>
                     <div class="block-content collapse in">
                         <div class="span12">
                            <div class="table-toolbar">
                               <div class="btn-group span2">
                                  <button type="button" style="margin-bottom: 10px;" id="deleteStillcutBtn" class="btn btn-primary">삭제<i class="icon-remove icon-white"></i></button>
                               </div>
                               <div class="btn-group span2">
                                  <button type="button" id="addStillcutBtn" class="btn btn-primary">추가<i class="icon-inbox icon-white"></i></button>
                               </div>
                               <div class="btn-group span8">
                				  		<input type="file" id="stillcutFile" name="stillcutFile" class="span12" placeholder="파일을 추가해 주세요" value="">	
                               </div>
                            </div>
                             
                             <table id="movieListTable" border="0" class="table table-striped table-bordered">
                                  <thead>
                                      <tr>
                                      	<th class="span1"><input type="checkbox"></th>
                                      	<th class="span11">스틸컷</th>
                                      </tr>
                                  </thead>
                                 <tbody id="stillcutTBody">
                                 	<c:forEach var="listStillcut" items="${stillcut}">
                                    		<tr class="odd gradeX">
                                      	<td><input type="checkbox" name="stillcutSeq" value="${listStillcut.MV_STILLCUT_SEQ}"></td>
                                          <td>${listStillcut.MV_STILLCUT}</td>
                                     	</tr>
                                 	</c:forEach>
                                 </tbody>
                             </table>
                         </div>
                     </div>
                 </div>
                 <!-- /block -->
         </div>
         <div class="span1"></div>
         <div class="span4" id="content">
                 <!-- block -->
                 <div class="block">
                     <div class="navbar navbar-inner block-header">
                         	<div class="muted pull-left"><c:out value="${visualSession.MVTitle}"></c:out>: 트레일러</div>
                     </div>
                     <div class="block-content collapse in">
                         <div class="span12">
                            <div class="table-toolbar">
                               <div class="btn-group span2">
                                  <button type="button" id="deleteTrailerBtn" class="btn btn-primary">삭제<i class="icon-remove icon-white"></i></button>
                               </div>
                               <div class="btn-group span2">
                                  <button type="button" id="addTrailerBtn"class="btn btn-primary addVisualBtn">추가<i class="icon-inbox icon-white"></i></button>
                               </div>
                               <div class="btn-group span8">
                				  		<input type="file" id="trailerFile" name="trailerFile" class="span12" placeholder="파일을 추가해 주세요" value="">	
                               </div>
                               <div class="btn-group span8">
                				  		<input type="text" style="margin-top: 10px;" id="trailerURL" name="trailerDesc" class="span12" placeholder="간단한 설명을 써주세요" value="">	
                               </div>
                            </div>
                             
                             <table id="movieListTable" border="0" class="table table-striped table-bordered">
                                  <thead>
                                      <tr>
                                      	<th class="span1"><input type="checkbox"></th>
                                      	<th class="span11">트레일러</th>
                                      </tr>
                                  </thead>
                                 <tbody>
                                 	<c:forEach var="listTrailer" items="${trailer}">
                                    		<tr class="odd gradeX">
                                      	<td><input type="checkbox" name="trailerSeq" value="${listTrailer.MV_TRAILER_SEQ}"></td>
                                          <td>${listTrailer.MV_TRAILER}</td>
                                          <td>${listTrailer.MV_DESC}</td>
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
  
//영화 스틸컷 추가 ajax
  $(document).ready(function(){
		var formObj = $('form[role="form"]');
	  	
		//영화 추가 페이지로 이동
 		$("#addStillcutBtn").on('click', function(){
	   		formObj.attr('action','${pageContext.request.contextPath}/insertVisualItems.do');
	   		formObj.attr('method','get');
	   		formObj.attr('modelAttribute','uploadForm');
	   		formObj.attr('enctype','multipart/form-data');
	   		formObj.submit();
 		});
		
 		$("#addTrailerBtn").on('click', function(){
	   		formObj.attr('action','${pageContext.request.contextPath}/insertVisualItems.do');
	   		formObj.attr('method','get');
	   		formObj.submit();
 		});
 		
 		$("#deleteStillcutBtn").on('click', function(){
	   		formObj.attr('action','${pageContext.request.contextPath}/deleteVisualItems.do');
	   		formObj.attr('method','get');
	   		formObj.submit();
 		});
 		
 		$("#deleteTrailerBtn").on('click', function(){
	   		formObj.attr('action','${pageContext.request.contextPath}/deleteVisualItems.do');
	   		formObj.attr('method','get');
	   		formObj.submit();
 		});
  })
</script>
<jsp:include page="../inc/footer.jsp" flush="false" />