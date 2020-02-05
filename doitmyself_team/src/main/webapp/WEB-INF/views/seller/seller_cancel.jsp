<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script src="resources/yeop/js/seller_cancel.js"></script>
<style>
	.content{margin-bottom:45px;}
	#cancel,#return{display:inline-block; background:white; width:179px; height:60px; margin-bottom:-10px; text-align:center; line-height:47px; border-radius:0 17px 0 0; font-size:11pt; color:#2e6d80; font-weight:bold;}
	#cancel:hover,#return:hover{background:white; cursor:pointer; transition:.3s;}
	#return{background:#eaeaea;}
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
            <a class="navbar-brand" href="#pablo">취소/반품 페이지</a>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <!-- <div class="panel-header panel-header-lg">

  <canvas id="bigDashboardChart"></canvas>


</div> -->
      <div class="content">
      	<div>
      		<a href="seller?doc=seller_cancel">
      			<div id="cancel">취소관리</div>
      		</a>
      		<a href="seller?doc=seller_return">
      			<div id="return">반품관리</div>
      		</a>
      	</div>
        <div class="row">
          <div class="col-md-12">
            <div class="card card-1 card-order">
              <div class="card-header">
                <p class="category">*판매자가 등록한상품 보기, 수정, 삭제</p>
                <hr>
              </div>
               	 <div class="card-body">
              	<h5 class="order-h5">[총 물품수 : <span class="saleCount">0</span>개]</h5>
              	
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
	            			<td>취소 신청일</td>
	            			<td>상품번호</td>
	            			<td>주문자ID</td>
	            			<td>상품명</td>
	            			<td>구매자 정보</td>
	            			<td>수량</td>
	            			<td>가격</td>
	            			<td>결제수단</td>
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
