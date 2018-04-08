<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
<script src='../lib/proj4js-combined.js'></script>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span9" id="content">
                     <!-- wizard -->
                    <div class="row-fluid section">
                         <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">영화관 추가 위자드</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                    <div id="rootwizard">
                                        <div class="navbar">
                                          <div class="navbar-inner">
                                            <div class="container">
                                        <ul>
                                            <li><a href="#tab1" data-toggle="tab">주소입력</a></li>
                                            <li><a href="#tab2" data-toggle="tab">정보 입력</a></li>
                                        </ul>
                                         </div>
                                          </div>
                                        </div>
                                        <div id="bar" class="progress progress-striped active">
                                          <div class="bar"></div>
                                        </div>
                                        <div class="tab-content">
                                        <div class="tab-pane" id="tab1">
                                        <form name="form" id="form" method="post" enctype="multipart/form-data" >
                                        <div class="control-group">
                                           <input type="button" onClick="goPopup();" value="주소검색" />
                                           
                                           <div class="controls">
                                           <label class="control-label">검색결과</label>
                                           	<input type="text"  class="input-xlarge focused" style="width:500px;" id="roadFullAddr"  name="roadFullAddr" />
											</div>
										</div>                                         
                                          </form>
                                           </div>
                                            <div class="tab-pane" id="tab2">
                                                <form name ="theaterinsert" class="form-horizontal" method="post" action="insertTheater.do" enctype="multipart/form-data">
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">지점</label>
                                                      <div class="controls">
                                                        <input class="input-xlarge focused" id="RENTAL_SERVICE_TITLE" name="RENTAL_SERVICE_TITLE" type="text" value="">
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">정보</label>
                                                      <div class="controls">
                                                        <input class="input-xlarge focused" id="RENTAL_SERVICE_INFO" name="RENTAL_SERVICE_INFO" type="text" value="">
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">가격</label>
                                                      <div class="controls">
                                                        <input class="input-xlarge focused" id="RENTAL_SERVICE_PRICE" name="RENTAL_SERVICE_PRICE" type="text" value="">
                                                      </div>
                                                    </div>
                                                    <div class="control-group">
                                                      <label class="control-label" for="focusedInput">주소</label>
                                                      <div class="controls">
                                                        <input class="input-xlarge focused" id="RENTAL_SERVICE_POSITION" name="RENTAL_SERVICE_POSITION" type="text" value="" readonly>
                                                      </div>
                                                    </div>
													<div class="control-group">
													<label class="control-label" for="focusedInput">장소</label>
													<div class="controls">
                                         		 	<img id="table_imgbox" src="<c:out value='${jiginAdminFileVo.savefilename}'/>"  style="width: 200px; height: 150px;" /><br/>
													<input type="file" id="jFile" name="savefilename" value="파일찾기" accept="image/*"/><br/><br/>
													<input type="button" style="display: none" class="table-btn-3"  id="remove" value="삭제"/>
													</div>
													</div>                                                   
                                                    </form>
                                                    </div>
                                            </div>
                                            <ul class="pager wizard">
                                                <li class="previous first" style="display:none;"><a href="javascript:void(0);">First</a></li>
                                                <li class="previous"><a href="javascript:void(0);">Previous</a></li>
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
        <!--/.fluid-container-->

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c58093115a4a53c228969797d30bf0e6&libraries=services"></script>
  <script>
  $('.next').click(function(){
	  document.getElementById('RENTAL_SERVICE_POSITION').value = document.getElementById('roadFullAddr').value;
  });
  function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제
		// 주소검색URL(http://www.juso.go.kr/addrlink/addrCoordUrl.do)를 호출하게 됩니다.
		var pop = window.open("addressSearch.do", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}
  function jusoCallBack(roadFullAddr) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr.value = roadFullAddr;

	}

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
               alert('영화관 정보가 입력되었습니다.');
               document.theaterinsert.submit();
           });
       }); 
	
        $(function() {
            $("#jFile").on('change', function(){
                readURL(this);
                $("#remove").toggle(); // hide remove link.
                $("#add").toggle(); // hide remove link.
            });
            
            /* toggle key use */
            $("#remove").click(function(e) {
                alert('success');
                e.preventDefault(); // prevent default action of link
                $('#table_imgbox').attr('src', ""); //clear image src
                $("#jFile").val(""); // clear image input value
                $("#remove").toggle(); // hide remove link.
                $("#add").toggle(); // hide remove link.
            });
        });
     
        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();
        
            reader.onload = function (e) {
                
                 if( $("#jFile").val() != "" ){
                     var ext = $('#jFile').val().split('.').pop().toLowerCase();
                     if($.inArray(ext, ['png']) == -1 && $.inArray(ext, ['jpg']) == -1) {
                        alert('이미지 파일만 업로드 할수 있습니다.');
                        $("#jFile").val("");
                        return;
                      }
                 }
                    $('#table_imgbox').attr('src', e.target.result);
                }
              reader.readAsDataURL(input.files[0]);
            }
        }

</script>
<jsp:include page="../inc/footer.jsp" flush="false" />