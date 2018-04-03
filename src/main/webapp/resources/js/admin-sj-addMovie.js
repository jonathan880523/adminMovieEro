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