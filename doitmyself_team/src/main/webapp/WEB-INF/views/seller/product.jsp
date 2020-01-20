<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script type="text/javascript" src="resources/yeop/ckeditor/ckeditor.js"></script>
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
            <a class="navbar-brand" href="#pablo">상품등록 페이지</a>
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
            <div class="card">
              <div class="card-header">
                <h5 class="title">상품등록</h5>
                <p class="category">*홈페이지에 등록될 상세정보를 입력해주세요.</p>
                <hr>
              </div>
              
              <form id="p-form" action="ProductAddAction" enctype="multipart/form-data">
              <div class="card-body" style="height:900px">
              	<!-- product table 1 -->
              	<h5 class="product-h5">* 상품명/카테고리 선택</h5>
              	<hr class="product_hr">
            	<table class="product_tb">
            		<tr>
            			<th class="p_th">상품명</th>
            			<td class="p_td"><input type="text" id="test_dname"></td>            			
            		</tr>
            		<tr>
            			<th class="p_th">가게 명</th>
            			<td class="p_td">
            				<input type="text" id="test_name">
            			</td>
            		</tr>
            		<tr>
            			<th class="p_th">카테고리</th>
            			<td class="p_td">
            				<div id="main_cate">
            				<span>대분류</span>
	            				<select size="3" id="main_cate_select">
	            				
	            				</select>
            				</div>
            				
            				<img src="resources/yeop/img/cate_arrow.png" class="arrowImg">
            				
            				<div id="sub_cate">
            				<span>소분류</span>
	            				<select size="3" id="sub_cate_select">
	            					<option value="">-선택-</option>
	            				</select>
            				</div>
            				<div id="cate_result">
            					<span>* 카테고리 선택결과</span>
            					<span id="cate_message"></span>
            				</div>
            			</td>
            		</tr>
            	</table>
            	
            	<!-- product table 2 -->
            	<h5 class="product-h5">* 재고수량/가격</h5>
              	<hr class="product_hr">
            	<table class="product_tb">
            		<tr>
            			<th class="p_th">재고 수량</th>
            			<td class="p_td">
            				<input type="text" id="p_qa" maxlength="7"> 개
            			</td>            			
            			<th class="p_th">가격</th>
            			<td class="p_td">
            				<input type="text" id="p_price" maxlength="13"> 원
            			</td>
            		</tr>            		
            	</table>
            	
            	<!-- product table 3 -->
            	<h5 class="product-h5">* 메인사진/상품설명</h5>
            	<h5 class="product-h5-1">* 상품설명 이미지 첨부방법 : 이미지 > 업로드 > 파일선택 > 서버로 전송</h5>
            	<hr class="product_hr">        
            	<table class="product_tb">           
            		<tr>
            			<th class="p_th">메인사진</th>
            			<td class="p_td">
            				<input type="file" name="uploadfile"
								accept="image/gif, image/jpeg, image/png">
            			</td>            			
            		</tr> 		
            		<tr>
            			<th class="p_ex" colspan="1">상품 설명</th>
            			<td class="p_td ck_td" colspan="3">
            				<textarea id="p_content"></textarea>
            				<script type="text/javascript">
							 CKEDITOR.replace('p_content'
							                , {height: 500                                                  
							                 });
							 //이미지 업로드를 할 경우
							 //CKEDITOR.replace("description",{
							 //CKEDITOR.replace와 id("description")를 잘 적어주면 그 태그가 smart editor 스타일로 바뀌게 된다. 
							 //filebrowserUploadUrl : "${path}/insertImage.do"});
							 //파일을 업로드 해야하기 때문에 filebrowserUploadUrl을 사용하고, 서버쪽에 코드를 완성해주어야 한다.
							</script>
            			</td>
            		</tr>
            	</table>
            	
            	<button type="reset" id="new_cancel">
            		취소
            	</button>
            	<button type="submit" id="new_p">
					신규상품등록            		
            	</button>
              </div>
              <!-- card-body -->
              </form>
              
            </div>
          </div>
        </div>
      </div>
     
    </div>

