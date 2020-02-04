<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="resources/yeop/js/seller_order.js"></script>
<style>
	.modal-dialog{margin:0 auto; margin-top:271px;}
	.btn{margin:0; padding:7px 16px;}
	#orderTRNOselect{padding:3px; margin-right:13px;}
	.modal-title{margin-top:10px;}
	.modal-body{margin:19x 0;}
</style>
<!-- session id 저장용 -->
<input type="hidden" id="id" name="id" value="${USER_ID}">
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
            <a class="navbar-brand" href="#pablo">주문관리 페이지</a>
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
                <h5 class="title">주문관리</h5>
                <p class="category">*주문자, 수령인, 주소, 주문상태 등 확인이 가능합니다.</p>
                <hr>
              </div>
              
              <form id="orderSearchForm">
              <div class="card-body">
              	<h5 class="order-h5">* 상품검색</h5>
            	<hr class="order_hr">    
              	<table class="orderSearch-tb">
              		<tr>
              			<th>검색어</th>
              			<td>
              				<select name="search_field" class="orderSelect">
              					<option value="orderName">상품명</option>
              					<option value="orderNo">주문 번호</option>
              					<option value="orderId">주문자ID</option>
              					<option value="orderAddress">배송정보</option>
              				</select>
              				<input type="text" class="orderSearch">
              			</td>
              		</tr>
              		<tr>
              			<th>기간</th>
              			<td>
              				<label for="orderR-t"><input type="radio" name="orderRadio" id="orderR-t"> 오늘 </label>
              				<label for="orderR-y"><input type="radio" name="orderRadio" id="orderR-y"> 어제 </label>
              				<label for="orderR-1mon"><input type="radio" name="orderRadio" id="orderR-1mon"> 1개월 </label>
              				<label for="orderR-6mon"><input type="radio" name="orderRadio" id="orderR-6mon"> 6개월 </label>
              			</td>
              		</tr>
              		<tr>
              			<th>주문상태</th>
              			<td>
              				<label for="order-all"><input type="checkbox" name="orderCheck" id="order-all"> 전체 </label>               				
              				<label for="order-paymentFinish"><input type="checkbox" name="orderCheck" id="order-paymentFinish"> 결제완료 </label>     				
              				<label for="order-preparing"><input type="checkbox" name="orderCheck" id="order-preparing"> 배송 준비중 </label>     				
              				<label for="order-shipping"><input type="checkbox" name="orderCheck" id="order-shipping"> 배송중 </label>               				
              				<label for="order-complete"><input type="checkbox" name="orderCheck" id="order-complete"> 배송완료 </label>               				
              			</td>
              		</tr>              		
              	</table>
              	<div class="order-btn">
	              	<button type="submit">
	              		<img src="resources/img/d_search.png"> 검색
	              	</button>
	              	<button type="reset">초기화</button>
              	</div>
              </div>        
              </form>
                              
            </div>
            
            <div class="card card-order">
           	 <div class="card-body">
           	 	<div class="orderProgress">* 결제완료<b>■</b> > 상품준비중<b>■</b>(송장번호입력) > 배송중<b>■</b> > 배송완료<b>■</b></div>
              	<h5 class="order-h5">
              	[ 총주문수 : <span class="orderCount"></span>개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              	총주문금액 : <span class="orderPriceAll"></span>원 ]
              	</h5>
              	
              	<div class="orderList">
	              	<select id="viewSelect">
						<option>주문날짜순</option>              	
						<option>수량순</option>              	
						<option>총 가격순</option>              	
	              	</select>
	              	<select id="viewcount">              	
						<option value="10" selected>10개씩 보기</option>              	
						<option value="20">20개씩 보기</option>              	
						<option value="30">30개씩 보기</option>              	
	              	</select>
              	</div>
              	
            	<!-- order table2 -->
            	<table class="orderList-tb">
	            	<thead>
	            		<tr>
	            			<td>주문 날짜</td>
	            			<td>주문 번호</td>
	            			<td>주문자ID</td>
	            			<td>상품명</td>
	            			<td>배송지</td>
	            			<td>수량</td>
	            			<td>총 가격</td>
	            			<td>결제수단</td>
	            			<td>주문상태</td>
	            		</tr>
	            	</thead>	            	
	            	<tbody>
	            		<!-- orderList ajax -->	            		
	            	</tbody>	            	
            	</table>
            	<div id="message"></div>   	            	
            
            	<div class="center-block">
					<div class="row">
						<div class="col">
							<ul class="pagination">
							</ul>
						</div>
					</div>
				</div>
		          	
              </div>
              <!-- card-body -->
            </div>
          </div>
        </div>
      </div>
     
    </div>
    
    <!-- OrderTRNO Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">운송장 번호 입력</h4>
        </div>
        <div class="modal-body">
          <select id="orderTRNOselect">
          	<option>CJ대한통운</option>
          </select>
          	운송장번호 입력
          <input type="text" class="orderTRNO" maxlength="20">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary order-m-btn" data-dismiss="modal">입력</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        </div>
      </div>
      
    </div>
  </div>