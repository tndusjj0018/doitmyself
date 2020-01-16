<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
            <form>
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <i class="nc-icon nc-zoom-split"></i>
                  </div>
                </div>
              </div>
            </form>
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link btn-magnify" href="#pablo">
                  <i class="nc-icon nc-layout-11"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Stats</span>
                  </p>
                </a>
              </li>
              <li class="nav-item btn-rotate dropdown">
                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="nc-icon nc-bell-55"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Some Actions</span>
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
              </li>
              <li class="nav-item">
                <a class="nav-link btn-rotate" href="#pablo">
                  <i class="nc-icon nc-settings-gear-65"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Account</span>
                  </p>
                </a>
              </li>
            </ul>
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
              				<select>
              					<option>주문 번호</option>
              					<option>주문자ID</option>
              					<option>배송지</option>
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
              				<label for="order-preparing"><input type="checkbox" name="orderCheck" id="order-preparing"> 배송 준비중 </label>     				
              				<label for="order-shipping"><input type="checkbox" name="orderCheck" id="order-shipping"> 배송중 </label>               				
              				<label for="order-complete"><input type="checkbox" name="orderCheck" id="order-complete"> 배송완료 </label>               				
              			</td>
              		</tr>              		
              	</table>
              	<div class="order-btn">
	              	<button type="submit">검색</button>
	              	<button type="reset">초기화</button>
              	</div>
              </div>        
              </form>
                              
            </div>
            
            <div class="card card-order">
           	 <div class="card-body">
              	<h5 class="order-h5">[총 주문수 : <span class="orderCount">0</span>개]</h5>
              	
              	<div class="orderList">
	              	<select>
						<option>주문날짜순</option>              	
						<option>수량순</option>              	
						<option>총 가격순</option>              	
	              	</select>
	              	<select>              	
						<option>10개씩 보기</option>              	
						<option>20개씩 보기</option>              	
						<option>30개씩 보기</option>              	
	              	</select>
              	</div>
              	
            	<!-- order table2 -->
            	<table class="orderList-tb">
	            	<tbody>
	            		<tr>
	            			<td>주문 날짜</td>
	            			<td>주문 번호</td>
	            			<td>주문자ID</td>
	            			<td>상품명</td>
	            			<td>배송지</td>
	            			<td>수량</td>
	            			<td>총 가격</td>
	            			<td>결제수단</td>
	            			<td>배송상태</td>
	            		</tr>
	            		<tr>
	            			<td>2020-01-01</td>
	            			<td>20200101-00000000</td>
	            			<td>asdf1234</td>
	            			<td>
	            				<div>IMG</div> 품명 : kh정보교욱원
	            			</td>
	            			<td>서울시 종로구 ㅇㅇ동</td>
	            			<td>3</td>
	            			<td>100,000</td>
	            			<td>무</td>
	            			<td>
	            				<button>배송준비중</button>
	            			</td>
	            		</tr>
	            	</tbody>
            	</table>
            	
              </div>
              <!-- card-body -->
            </div>
          </div>
        </div>
      </div>
     
    </div>