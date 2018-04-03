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
                                <div class="muted pull-left">영화 추가 위자드</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                    <div id="rootwizard">
                                        <div class="navbar">
                                          <div class="navbar-inner">
                                            <div class="container">
                                        <ul>
                                            <li><a href="#tab1" data-toggle="tab">영화 검색 옵션</a></li>
                                            <li><a href="#tab2" data-toggle="tab">영화 선택</a></li>
                                            <li><a href="#tab3" data-toggle="tab">결과</a></li>
                                        </ul>
                                         </div>
                                          </div>
                                        </div>
                                        <div id="bar" class="progress progress-striped active">
                                          <div class="bar"></div>
                                        </div>
                                        <div class="tab-content">
                                            <div class="tab-pane" id="tab1">
                                               <form class="form-horizontal" action="#tab2">
                                                  <fieldset>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">제목</label>
                                                      <div class="controls">
                                                        <input class="input-xlarge focused" id="query" name="query" type="text" value="" required placeholder="필수">
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">검색 출력 갯수</label>
                                                      <div class="controls">
                                                        <input class="input-xlarge focused" id="display" name="display" type="text" value="10" placeholder="전체일 경우 미입력(기본값  10, 최대  100)">
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">장르</label>
                                                      <div class="controls">
                                                        <select id="genre" name="genre">
                                                        	<option value="" selected>전체</option>
                                                        	<option value="1">드라마</option>
                                                        	<option value="2">판타지</option>
                                                        	<option value="3">서부</option>
                                                        	<option value="4">공포</option>
                                                        	<option value="5">로맨스</option>
                                                        	<option value="6">모험</option>
                                                        	<option value="7">스릴러</option>
                                                        	<option value="8">느와르</option>
                                                        	<option value="9">컬트</option>
                                                        	<option value="10">다큐멘터리</option>
                                                        	<option value="11">코미디</option>
                                                        	<option value="12">가족</option>
                                                        	<option value="13">미스터리</option>
                                                        	<option value="14">전쟁</option>
                                                        	<option value="15">애니메이션</option>
                                                        	<option value="16">범죄</option>
                                                        	<option value="17">뮤지컬</option>
                                                        	<option value="18">SF</option>
                                                        	<option value="19">액션</option>
                                                        	<option value="20">무협</option>
                                                        	<option value="21">에로</option>
                                                        	<option value="22">서스펜스</option>
                                                        	<option value="23">서사</option>
                                                        	<option value="24">블랙코미디</option>
                                                        	<option value="25">실험</option>
                                                        	<option value="26">영화카툰</option>
                                                        	<option value="27">영화음악</option>
                                                        	<option value="28">영화패러디포스터</option>
                                                        </select>
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">국가</label>
                                                      <div class="controls">
                                                        <select id="country" name="country">
                                                        	<option value = "" selected>전체</option>
                                                        	<option value="KR">한국</option>
                                                        	<option value="JP">일본</option>
                                                        	<option value="US">미국</option>
                                                        	<option value="HK">홍콩</option>
                                                        	<option value="GB">영국</option>
                                                        	<option value="FR">프랑스</option>
                                                        	<option value="ETC">기타</option>
                                                        </select>
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">제작 년도(최소)</label>
                                                      <div class="controls">
                                                        <input class="input-xlarge focused" id="yearfrom" name="yearfrom" type="text" value="" placeholder="전체일 경우 미입력">
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">제작 년도(최대)</label>
                                                      <div class="controls">
                                                        <input class="input-xlarge focused" id="yearto" name="yearto" type="text" value="" placeholder="전체일 경우 미입력">
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">검색하기</label>
                                                      <div class="controls">
                                                        <input class="btn btn-primary" id="searchMovieAjax" name="searchMovieAjax" type="button" value="검색">
                                                      </div>
                                                    </div>
                                                  </fieldset>
                                                </form>
                                            </div>
                                            <div class="tab-pane" id="tab2">
                                                <form class="form-horizontal">
                                                  <fieldset>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">영화를 선텍해주세요<br>(제목 / 감독)</label>
                                                      <div class="controls">
                                                        <select id="allMovieList" name="allMovieList">
                                                        	<option selected disabled>검색된 영화 목록</option>
                                                        </select>
                                                        &nbsp;&nbsp;&nbsp;
                                                        <input type="button"  id="selectMovieBtn" class="btn btn-primary" value="선택" />
                                                      </div>
                                                    </div>
                                                  </fieldset>
                                                </form>
                                            </div>
                                            <div class="tab-pane" id="tab3">
                                                <form class="form-horizontal" action="${pageContext.request.contextPath}/insertMovie.do">
                                                  <fieldset>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">제목</label>
                                                      <div class="controls">
                                                        <input class="input-xlarge focused" id="resultTitle" name="resultTitle" type="text" value="">
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">제목(영어)</label>
                                                      <div class="controls">
                                                        <input class="input-xlarge focused" id="resultSubtitle" name="resultSubtitle" type="text" value="">
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">영화감독</label>
                                                      <div class="controls">
                                                        <input class="input-xlarge focused" id="resultDirector" name="resultDirector" type="text" value="">
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">배우</label>
                                                      <div class="controls">
                                                        <input class="input-xlarge focused" id="resultActor" name="resultActor" type="text" value="">
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">제작년도</label>
                                                      <div class="controls">
                                                        <input class="input-xlarge focused" id="resultPubDate" name="resultPubDate" type="text" value="">
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">네이버평점</label>
                                                      <div class="controls">
                                                        <input class="input-xlarge focused" id="resultUserRating" name="resultUserRating" type="text" value="" readOnly>
                                                      </div>
                                                    </div>
                                                    <div>
                                                    	<input class="input-xlarge focused" id="resultLink" name="resultLink" type="hidden" value="" readOnly>
                                                    	<input class="input-xlarge focused" id="resultImage" name="resultImage" type="hidden" value="" readOnly>
                                                    </div>
                                                  </fieldset>
                                                  <input type="submit" class="btn btn-primary" value="전송">
                                                </form>
                                            </div>
                                            <ul class="pager wizard">
                                                <li class="previous first" style="display:none;"><a href="javascript:void(0);">First</a></li>
                                                <li class="previous"><a href="javascript:void(0);">Previous</a></li>
                                                <li class="next last" style="display:none;"><a href="javascript:void(0);">Last</a></li>
                                                <li class="next"><a href="javascript:void(0);">Next</a></li>
                                                <li class="next finish" style="display:none;"><a href="javascript:">Finish</a></li>
                                            </ul>
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
<script>
jQuery(document).ready(function() {   
   FormValidation.init();
});
	//step 변경//////////////////////////////
       $(function() {
           $(".datepicker").datepicker();
           $(".uniform_on").uniform();
           $(".chzn-select").chosen();
           $('.textarea').wysihtml5();

           $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
               var $total = navigation.find('li').length;
               var $current = index+1;
               var $percent = ($current/$total) * 100;
               $('#rootwizard').find('.bar').css({width:$percent+'%'});
               // If it's the last tab then hide the last button and show the finish instead
               if($current >= $total) {
                   $('#rootwizard').find('.pager .next').hide();
                   $('#rootwizard').find('.pager .finish').show();
                   $('#rootwizard').find('.pager .finish').removeClass('disabled');
               } else {
                   $('#rootwizard').find('.pager .next').show();
                   $('#rootwizard').find('.pager .finish').hide();
               }
           }});
           $('#rootwizard .finish').click(function() {
               alert('Finished!, Starting over!');
               $('#rootwizard').find("a[href*='tab1']").trigger('click');
           });
           
           //ajax로 데이터 넘기기/////////////////////////////////////
           var ajaxResult = null;
           console.log(ajaxResult);
           $("#searchMovieAjax").on('click', function(){
           	//네이버 영화 검색 api의 입력 데이터
           	var movieInputData = {
               		query : $("#query").val(),
           			display : $("#display").val(),
           			genre : $("#genre").val(),
           			country : $("#country").val(),
           			yearfrom : $("#yearfrom").val(),
           			yearto : $("#yearto").val()
           			};
               
               console.log(movieInputData);
           	
           	$.ajax({
           		url : "${pageContext.request.contextPath}/ajaxAddMovie.do",
               	data : movieInputData,
           		success : function(data){
              			console.log("성공");
              			console.log(data);
              			ajaxResult = data;
              			console.log(ajaxResult.items);
              			$(ajaxResult.items).each(function(index, item){
              				$("<option>").attr({
              					value : index, 
              				}).html(item.title + " / " + item.director)
              				  .appendTo("#allMovieList");
              				console.log(index)
              			});
              			
              			$("#searchMovieAjax").removeClass();
              			$("#searchMovieAjax").addClass("btn btn-success");
              			$("#searchMovieAjax").val("성공");
               	},
               	error : function(request, status, error){
               		$("#searchMovieAjax").removeClass();
              			$("#searchMovieAjax").addClass("btn btn-danger");
              			$("#searchMovieAjax").val("실패");
              			
               		alert("code:"+request.status+"\n"+
               				"message:"+request.responseText+"\n"+"error:"+error);
               	},
               	complete : function(data){
               		
               	}
               });
           });
           
           //선택한 영화 결과(tap3) 화면에 출력하기
           var arrOptVal = "";
           $("#selectMovieBtn").on('click',function(){
           	console.log(ajaxResult.items);
           	var selectedIndex = $("#allMovieList").val();
           	console.log(ajaxResult.items[selectedIndex]);
           	arrOptTitleVal = $('#allMovieList').children('option:selected').text();
           	arrOptTitleVal = arrOptTitleVal.split("/");
           	arrOptTitleVal = arrOptTitleVal[0];
           	
           	$(ajaxResult.items[selectedIndex]).each(function(index, item){
           		
           		/* $("#resultTitle").val(item.title); */
           		$("#resultTitle").val(arrOptTitleVal);
           		$("#resultSubtitle").val(item.subtitle);
           		
           		var NonSplitedDirector = item.director;  
           		splitedDirectorArr = NonSplitedDirector.split('|');
           		console.log("splitedDirectorArrlength : " +splitedDirectorArr.length);
           		console.log("splitedDirectorArr : " +splitedDirectorArr);
           		if(splitedDirectorArr.length <= 2){
           			$("#resultDirector").val(splitedDirectorArr[0]);
           		}else{
           			$("#resultDirector").val(NonSplitedDirector);	
           		}
           		
           		var NonSplitedActor = item.actor;  
           		splitedActorArr = NonSplitedActor.split('|');
           		console.log("splitedActorArrlength : " +splitedActorArr.length);
           		console.log("splitedActorArr : " +splitedActorArr);
           		if(splitedActorArr.length <= 2){
           			$("#resultActor").val(splitedActorArr[0]);
           		}else{
           			$("#resultActor").val(splitedActorArr);	
           		}
           		
           		$("#resultPubDate").val(item.pubDate);
           		$("#resultUserRating").val(item.userRating);
           		$("#resultLink").val(item.link);
           		$("#resultImage").val(item.image);
           	});
           	
           	$("#selectMovieBtn").removeClass();
      			$("#selectMovieBtn").addClass("btn btn-success");
      			$("#selectMovieBtn").val("성공");
           	
           });
       });
</script>
<jsp:include page="../inc/footer.jsp" flush="false" />