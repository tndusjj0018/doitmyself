<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script src="resources/yeop/js/seller_sale.js"></script>
<style>
	.content{margin-bottom:45px;}
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
            <a class="navbar-brand" href="#pablo">상품관리 페이지</a>
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
                <h5 class="title">상품관리</h5>
                <p class="category">*판매자가 등록한상품 보기, 수정, 삭제</p>
                <hr>
              </div>
               	 <div class="card-body">
              	<h5 class="order-h5">[총 상품등록수 : <span class="saleCount">0</span>개]</h5>
              	
              	<div class="orderList">
	              	<select class="saleSelect">
						<option value="P_REGDATE">등록일순</option>              	
						<option value="P_QUANTITY">재고수량순</option>              	
						<option value="P_PRICE">가격순</option>              	
	              	</select>
              	</div>
              	
            	<!-- order table2 -->
            	<table class="orderList-tb">            	
	            	<thead>
	            		<tr>
	            			<td>등록일</td>
	            			<td>상품이름</td>
	            			<td>가격</td>
	            			<td>재고수량</td>
	            			<td>찜, 조회수</td>
	            			<td>상품관리</td>
	            		</tr>
	            	</thead>
	            	<tbody>
	            		<!-- sale ajax -->
	            	</tbody>
            	</table>
            	<div id="message"></div>
              </div>                  
            </div>
     
          </div>
        </div>
      </div>
     
    </div>
