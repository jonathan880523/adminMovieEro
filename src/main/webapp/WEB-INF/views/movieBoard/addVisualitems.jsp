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
                 <c:set var="movieVisualListResult" value="${requestScope.movieVisualList}" />
                 <c:set var="resultMovieVo" value="${requestScope.movieVo}"/>
                 <div class="block">
                     <div class="navbar navbar-inner block-header">
                         <div class="muted pull-left"><c:out value="${resultMovieVo.MV_TITLE}"></c:out>: 스틸컷</div>
                         
                         <%-- <input type="hidden" id="MOVIE_INFO_SEQ" value="${movieVisualListResult}"> --%>
                     </div>
                     <div class="block-content collapse in">
                         <div class="span12">
                            <div class="table-toolbar">
                               <div class="btn-group span2">
                                  <button type="button" id="deleteStillcutBtn" class="btn btn-primary">삭제<i class="icon-remove icon-white"></i></button>
                               </div>
                               <div class="btn-group span2">
                                  <button type="button" id="addStillcutBtn" class="btn btn-primary">추가<i class="icon-inbox icon-white"></i></button>
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
                                      	<td><input type="checkbox" name="movieUniNumDel" value="${listMap.VISUAL_SEQ}"></td>
                                          <td>${listMap.MOVIE_STILLCUT}</td>
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
                         <div class="muted pull-left"><c:out value="${resultMovieVo.MV_TITLE}"></c:out>: 트레일러</div>
                     </div>
                     <div class="block-content collapse in">
                         <div class="span12">
                            <div class="table-toolbar">
                               <div class="btn-group span2">
                                  <button type="button" id="deleteSelectedBtn" class="btn btn-primary">삭제<i class="icon-remove icon-white"></i></button>
                               </div>
                               <div class="btn-group span2">
                                  <button type="button" id="addItemBtn" class="btn btn-primary">추가<i class="icon-inbox icon-white"></i></button>
                               </div>
                               <div class="btn-group span8">
                				  		<input type="text" id="addStillcutURL" class="span12" placeholder="트레일러 URL을 입력해주세요(enter)" value="">	
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
                                      	<td><input type="checkbox" name="movieUniNumDel" value="${listMap.VISUAL_SEQ}"></td>
                                          <td>${listMap.MOVIE_TRAILER}</td>
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
<c:set var="MV_TITLE" value="${movieVisualListResult.MV_TITLE}"/>
<c:set var="MV_INFO_SEQ" value="${movieVisualListResult.MV_INFO_SEQ}"/>
<script>
  
//영화 스틸컷 추가 ajax
  $(document).ready(function(){
  	var stillcutData = {
  			MV_TITLE : MV_TITLE,
  			MV_INFO_SEQ : MV_INFO_SEQ,
  			MV_STILLCUT : $("#stillcutURL").val()
  		};
  	console.log("stillcutData : " + stillcutData);
  	
  	$("#addStillcutBtn").on('click', function(){
   	$.ajax({
   		url : "${pageContext.request.contextPath}/insertStillcut.do",
   		data : stillcutData,
   		success : function(data){
   			resultStillcutMapData = data;
   			console.log(resultStillcutMapData);
   			var seqVal = '<input type="checkbox" value="${resultStillcutMapData.VISUAL_SEQ}">'
   			var URLVal = '<input type="text" disabled value="${resultStillcutMapData.MOVIE_STILLCUT}">'
   			$("#stillcutTBody").append("tr td");
   			$("#stillcutTBody tr:last td").append(seqVal);
   			$("#stillcutTBody tr:last").append("td");
   			$("#stillcutTBody tr:last td:last").append(URLVal);
   			
   			/*
   			$('<input>').attr('type', 'checkbox')
   						.val(resultStillcutMapData.VISUAL_SEQ)
   						.appendTo("#stillcutTBody tr:last td");
   			*/
   		},
   		error : function(data, status){
   			
   		}
   	})
  	});
  })
</script>
<jsp:include page="../inc/footer.jsp" flush="false" />