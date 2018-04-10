<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
       <div class="container-fluid">
            <div class="row-fluid">
                <div class="span9" id="content">
                     <!-- wizard -->
                    <div class="row-fluid section">
                         <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">공지사항 작성</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                    <div id="rootwizard">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab1">
                                               <form class="form-horizontal" action="noticeInsert.do">
                                                  <fieldset>
                                                    <div class="control-group">
													<c:set var="ID" value="${sessionScope.adminId}"/>
													
													<input type="hidden" name="MB_ID" value="${ID}">
													<label class="control-label" for="focusedInput">제목</label>
												<div class="controls">
													<input class="ntTitle input-xlarge focused" id="query" name="NOTICE_BOARD_TITLE" type="text" value="" required placeholder="title">
												</div>
												
												</div>
												<div class="control-group">
	
													<label class="control-label" for="focusedInput">내용</label>
												<div class="controls">
													<textarea class="ntContent input-xlarge focused" id="ckeditor" name="NOTICE_BOARD_CONTENT" required placeholder="content"></textarea>
												</div>
												
												
												</div>
											  <input type="submit" class="btn btn-primary" value="작성">
											  <a href="noticeAdmin.do"><input type="button" class="btn btn-primary" value="목록으로"></a>
											</fieldset>
										</form>
									</div>
                                        </div>  
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
	            <!-- /wizard -->
                </div>
            </div>
        </div>
        <!--/.fluid-container-->
<jsp:include page="../inc/footer.jsp" flush="false" />
<script type="text/javascript">
$(function() {

	CKEDITOR.replace('ckeditor', {
		width : '800px',
		height : '400px',
		filebrowserImageUploadUrl : 'noticeBoardImgInsert.do'
	});

	CKEDITOR.on('dialogDefinition', function(ev) {
		var dialogName = ev.data.name;
		var dialogDefinition = ev.data.definition;

		switch (dialogName) {
		case 'image': //Image Properties dialog
			//dialogDefinition.removeContents('info');
			dialogDefinition.removeContents('Link');
			dialogDefinition.removeContents('advanced');
			break;
		}
	});
	
	$( "#target" ).submit(function( event ) {
		  var userId = '${ID}';
		  var bTitle = this.hasClass("ntTitle");
		  var bContent = this.hasClass("ntContent");
		  if(bTitle.val() == ""){
			  alert("제목을 입력하지 않으셨습니다.");
			  bTitle.focus();
			  return false;
		  }
		  if(bContent.val() == ""){
			  alert("본문을 입력하지 않으셨습니다.");
			  bContent.focus();
			  return false;
		  }
		});

});
function membercheck(){
	var userId = '${ID}';
    if(userId==""){
    	alert("로그인을 해주시기 바랍니다");
    }
}
</script>