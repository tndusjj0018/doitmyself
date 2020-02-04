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
            <a class="navbar-brand" href="#pablo">가게 정보</a>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <!-- <div class="panel-header panel-header-sm">


</div> -->
      <div class="content">
        <div class="row row-1">
          
          <div class="">
            <div class="card card-user">
              <div class="card-header">
                <h5 class="title">판매자 정보</h5>
                <p class="category">*사업지정보 판매자 정보</p>
              </div>
              <div class="card-body">
                <form>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>사업지 이름</label>
                        <input type="text" class="form-control" id="seller_name" placeholder="seller_name" name="SELLER_NAME" readonly>
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>판매자 아이디</label>
                        <input type="text" class="form-control" id="seller_id" placeholder="seller_id" name="SELLER_ID" readonly>
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="exampleInputEmail1">사업지 우편번호</label>
                        <input type="text" id="seller_postcode" class="form-control" placeholder="seller_postcode" name="SELLER_POSTCODE" readonly>       
                      </div>                      
                    </div>                    
                        
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>사업지 주소</label>
                        <input type="text" class="form-control" placeholder="seller_address" id="seller_address" name="SELLER_ADDRESS" readonly>
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="exampleInputEmail1">사업자번호</label>
                        <input type="text" class="form-control" placeholder="seller_b_num" id="seller_b_num" name="SELLER_B_NUM" readonly>
                      </div>
                    </div>
                  </div>
                 
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                      <a href="seller?doc=seller_infoUpdate">
                      <button type="button" class="btn btn-primary btn-round">사업지 정보수정</button>
                      </a>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
     
    </div>