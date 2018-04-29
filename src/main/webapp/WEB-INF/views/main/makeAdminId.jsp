<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Forms</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <script src="vendors/jquery-1.9.1.min.js"></script>
    </head>
    <body>
    	<div class="span4"></div>
        <div class="container-fluid" >
            <div class="row-fluid">
                <!--/span-->
                <div class="span6" id="content">
                     <!-- validation -->
                    <div class="row-fluid">
                         <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">관리자 아이디 생성</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
									<form action="" role="form" class="form-horizontal">
										<fieldset>
				  							<div class="control-group">
				  								<label class="control-label">아이디<span class="required">*</span></label>
				  								<div class="controls">
				  									<input type="text" name="name" data-required="1" class="span6 m-wrap"/>
				  								</div>
				  							</div>
				  							<div class="control-group">
				  								<label class="control-label">비밀번호<span class="required">*</span></label>
				  								<div class="controls">
				  									<input name="email" type="text" class="span6 m-wrap"/>
				  								</div>
				  							</div>
				  							<div class="control-group">
				  								<label class="control-label">비밀번호 확인<span class="required">*</span></label>
				  								<div class="controls">
				  									<input name="url" type="text" class="span6 m-wrap"/>
				  								</div>
				  							</div>
				  							<div class="control-group">
				  								<label class="control-label">직책<span class="required">*</span></label>
				  								<div class="controls">
				  									<input name="digits" type="text" class="span6 m-wrap"/>
				  								</div>
				  							</div>
				  							<div class="form-actions">
				  								<button type="submit" class="btn btn-primary">아이디 생성</button>
				  								<button type="button" class="btn">취소</button>
				  							</div>
										</fieldset>
									</form>
								</div>
			    			</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function(){
				var formObj = $('form[role="form"]');
				console.log(formObj);
				
				formObj.attr('action', '')
			})
		</script>
    </body>
</html>