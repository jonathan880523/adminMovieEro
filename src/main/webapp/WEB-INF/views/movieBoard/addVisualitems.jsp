<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
    <head>
        <title>[관리자]영화 등록</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <script src="vendors/jquery-1.9.1.js"></script>
    </head>
    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">Admin Panel</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> Vincent Gabriel <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="#">Profile</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="login.html">Logout</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav">
                            <li class="active">
                                <a href="#">Dashboard</a>
                            </li>
                            <li class="dropdown">
                                <a href="#" data-toggle="dropdown" class="dropdown-toggle">Settings <b class="caret"></b>

                                </a>
                                <ul class="dropdown-menu" id="menu1">
                                    <li>
                                        <a href="#">Tools <i class="icon-arrow-right"></i>

                                        </a>
                                        <ul class="dropdown-menu sub-menu">
                                            <li>
                                                <a href="#">Reports</a>
                                            </li>
                                            <li>
                                                <a href="#">Logs</a>
                                            </li>
                                            <li>
                                                <a href="#">Errors</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#">SEO Settings</a>
                                    </li>
                                    <li>
                                        <a href="#">Other Link</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="#">Other Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Other Link</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">Content <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="#">Blog</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">News</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Custom Pages</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Calendar</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="#">FAQ</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">Users <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="#">User List</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Search</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Permissions</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                        <li>
                            <a href="index.html"><i class="icon-chevron-right"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="calendar.html"><i class="icon-chevron-right"></i> Calendar</a>
                        </li>
                        <li>
                            <a href="stats.html"><i class="icon-chevron-right"></i> Statistics (Charts)</a>
                        </li>
                        <li>
                            <a href="form.html"><i class="icon-chevron-right"></i> Forms</a>
                        </li>
                        <li class="active">
                            <a href="tables.html"><i class="icon-chevron-right"></i> Tables</a>
                        </li>
                        <li>
                            <a href="buttons.html"><i class="icon-chevron-right"></i> Buttons & Icons</a>
                        </li>
                        <li>
                            <a href="interface.html"><i class="icon-chevron-right"></i> UI & Interface</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge badge-success pull-right">731</span> Orders</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge badge-success pull-right">812</span> Invoices</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge badge-info pull-right">27</span> Clients</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge badge-info pull-right">1,234</span> Users</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge badge-info pull-right">2,221</span> Messages</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge badge-info pull-right">11</span> Reports</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge badge-important pull-right">83</span> Errors</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge badge-warning pull-right">4,231</span> Logs</a>
                        </li>
                    </ul>
                </div>
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
            <hr>
            <footer>
                <p>&copy; Vincent Gabriel 2013</p>
            </footer>
        </div>
        <!--/.fluid-container-->

        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/datatables/js/jquery.dataTables.min.js"></script>


        <script src="assets/scripts.js"></script>
        <script src="assets/DT_bootstrap.js"></script>
        <script>
        
     	//영화 스틸컷 추가 ajax
     	
        $(document).ready(function(){
        	var stillcutData = {
        			MV_TITLE : '<c:out value="'+${movieVisualListResult.MV_TITLE}+'"/>',
        			MV_INFO_SEQ : '<c:out value="'+${movieVisualListResult.MV_INFO_SEQ}+'"/>',
        			MV_STILLCUT : '$("#stillcutURL").val()'
        		};
        	
        	
        	$("#addStillcutBtn").on('click', function(){
	        	$.ajax({
	        		url : "${pageContext.request.contextPath}/insertStillcut.do",
	        		data : stillcutData,
	        		success : function(data){
	        			resultStillcutMapData = data;
	        			console.log(resultStillcutMapData);
	        			var seqVal = '<input type="checkbox" value="'+ resultStillcutMapData.VISUAL_SEQ +'">';
	        			var URLVal = '<input type="text" disabled value="'+resultStillcutMapData.MOVIE_STILLCUT+'">'
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
    </body>
</html>