<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
<div class="span9" id="content">
	<div class="row-fluid">
           <!-- block -->
           <div class="row-fluid">
                      <!-- block -->
                      <div class="block">
                          <div class="navbar navbar-inner block-header">
                              <div class="muted pull-left">영화 리뷰 목록</div>
                          </div>
                          <div class="navbar navbar-inner block-header">
								<div class="muted pull-left">
									<select id="sortingReviewSelect">
										<option disabled selected>전체</option>
									</select>
								</div>
                          </div>
                          <div class="block-content collapse in">
                              <div class="span12">
									<table class="table table-striped">
				              <thead>
				                <tr>
				                  <th>#</th>
				                  <th>First Name</th>
				                  <th>Last Name</th>
				                  <th>Username</th>
				                </tr>
				              </thead>
				              <tbody>
				                <tr>
				                  <td>1</td>
				                  <td>Mark</td>
				                  <td>Otto</td>
				                  <td>@mdo</td>
				                </tr>
				                <tr>
				                  <td>2</td>
				                  <td>Jacob</td>
				                  <td>Thornton</td>
				                  <td>@fat</td>
				                </tr>
				                <tr>
				                  <td>3</td>
				                  <td>Larry</td>
				                  <td>the Bird</td>
				                  <td>@twitter</td>
				                </tr>
				              </tbody>
				            </table>
                              </div>
                          </div>
                      </div>
                      <!-- /block -->
                  </div>
           <!-- /block -->
	</div>
</div>
<jsp:include page="../inc/footer.jsp" flush="false" />