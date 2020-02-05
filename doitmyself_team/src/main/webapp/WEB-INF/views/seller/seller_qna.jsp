<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="resources/yeop/js/seller_qna.js"></script>
<style>
	.orderList-tb thead>tr{background:#3c8dbcc9; color:white;}
	.orderList-tb tbody>tr>td{height:38px;}
	.qnaWriter{color:red;}
	.orderList-tb tbody>tr:hover{cursor:pointer;}
</style>
<div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="#pablo">상품문의 답변 페이지</a>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <!-- <div class="panel-header panel-header-lg">

  <canvas id="bigDashboardChart"></canvas>


</div> -->
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card card-1 card-order">
              <div class="card-header">
                <h5 class="title">상품문의 답변</h5>
                <p class="category">*판매등록한 상품의 문의글 답변 페이지 입니다.</p>
                <hr>
              </div>
               	 <div class="card-body">
              	<h5 class="order-h5">[총 글의 수 : <span class="saleCount">0</span>개]</h5>
              	
              	<div class="orderList">
	              	<select class="qnaSelect">
						<option value="Q_REGDATE">등록일순</option>              	
						<option value="Q_QUANTITY">답변여부</option>              	
	              	</select>
              	</div>
              	
            	<!-- order table2 -->
            	<table class="orderList-tb">            	
	            	<thead>
	            		<tr>
	            			<td width="7%">번호</td>
	            			<td width="10%">작성일</td>
	            			<td width="13%">질문 분류</td>
	            			<td width="10%">상품번호</td>
	            			<td width="30%">제목</td>
	            			<td width="14%">작성자</td>
	            			<td width="10%">답변여부</td>
	            		</tr>
	            	</thead>
	            	<tbody>
	            		<!-- qna ajax -->
	            	</tbody>
            	</table>
            	<div id="message"></div>
              </div>                  
            </div>
     
          </div>
        </div>
      </div>
     
    </div>
