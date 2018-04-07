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
                 <c:set var="movieVisualListResult" value="${requestScope.resultVisualItems}" />
                 <c:set var="ifNullTitle" value="${requestScope.nullTitle}"/>
                 <div class="block">
                     <div class="navbar navbar-inner block-header">
						 <c:if test="${not empty movieVisualListResult}">
						 	<div class="muted pull-left"><c:out value="${movieVisualListResult.MV_TITLE}"></c:out>: 스틸컷</div>
                         	<input type="hidden" name="MVInfoSeq" value="${movieVisualListResult.MV_INFO_SEQ}">
                         	<input type="hidden" name="MVTitle" value="${movieVisualListResult.MV_TITLE}">
						 </c:if>
						 <c:if test="${empty movieVisualListResult}">
                         	<div class="muted pull-left"><c:out value="${ifNullTitle}"></c:out>: 스틸컷</div>
						 </c:if>
                     </div>
                     <div class="block-content collapse in">
                         <div class="span12">
                            <div class="table-toolbar">
                               <div class="btn-group span2">
                                  <button type="button" id="deleteStillcutBtn" class="btn btn-primary">삭제<i class="icon-remove icon-white"></i></button>
                               </div>
                               <div class="btn-group span2">
                                  <button type="button" id="addStillcutBtn" class="btn btn-primary addVisualBtn">추가<i class="icon-inbox icon-white"></i></button>
                               </div>
                               <div class="btn-group span8">
                				  		<input type="text" id="stillcutURL" name="stillcutURL" class="span12" placeholder="스틸컷 URL을 입력해주세요(enter)" value="">	
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
                                 	<c:forEach var="listMap" items="${movieVisualListResult}">
                                    		<tr class="odd gradeX">
                                      	<td><input type="checkbox" name="movieUniNumDel" value="${listMap.MV_VISUAL_SEQ}"></td>
                                          <td>${listMap.MV_STILLCUT}</td>
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
                         <c:if test="${empty movieVisualListResult}">
                         	<div class="muted pull-left"><c:out value="${ifNullTitle}"></c:out>: 트레일러</div>
						 </c:if>
						 <c:if test="${not empty movieVisualListResult}">
						 	<div class="muted pull-left"><c:out value="${movieVisualListResult.MV_TITLE}"></c:out>: 트레일러</div>
						 </c:if>
                     </div>
                     <div class="block-content collapse in">
                         <div class="span12">
                            <div class="table-toolbar">
                               <div class="btn-group span2">
                                  <button type="button" id="deleteSelectedBtn" class="btn btn-primary">삭제<i class="icon-remove icon-white"></i></button>
                               </div>
                               <div class="btn-group span2">
                                  <button type="button" class="btn btn-primary addVisualBtn">추가<i class="icon-inbox icon-white"></i></button>
                               </div>
                               <div class="btn-group span8">
                				  		<input type="text" id="addStillcutURL" name="trailerURL" class="span12" placeholder="트레일러 URL을 입력해주세요(enter)" value="">	
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
                                 	<c:forEach var="listMap" items="${movieVisualListResult}">
                                    		<tr class="odd gradeX">
                                      	<td><input type="checkbox" name="movieUniNumDel" value="${listMap.MV_VISUAL_SEQ}"></td>
                                          <td>${listMap.MV_TRAILER}</td>
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
 		$(".addVisualBtn").on('click', function(){
	   		formObj.attr('action','${pageContext.request.contextPath}/insertVisualItems.do');
	   		formObj.attr('method','get');
	   		formObj.submit();
 		});
  	
  })
</script>
<jsp:include page="../inc/footer.jsp" flush="false" />