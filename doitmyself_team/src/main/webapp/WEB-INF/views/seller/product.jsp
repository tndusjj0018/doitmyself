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
              
              <form id="p-form" action="ProductAddAction" enctype="multipart/form-data" method="post">
              <div class="card-body" style="height:900px">
              	<!-- product table 1 -->
              	<h5 class="product-h5">* 상품명/카테고리 선택</h5>
              	<hr class="product_hr">
            	<table class="product_tb">
            		<tr>
            			<th class="p_th">상품명</th>
            			<td class="p_td"><input type="text" id="test_dname" name="P_NAME" required></td>            			
            		</tr>
            		<tr>
            			<th class="p_th">사업지 명</th>
            			<td class="p_td">
            				<input type="text" id="test_name" name="P_SELLER" readonly>
            			</td>
            		</tr>
            		<tr>
            			<th class="p_th">카테고리</th>
            			<td class="p_td">
            				<div id="main_cate">
            				<span>대분류</span>
	            				<select size="3" id="main_cate_select" required>
	            				
	            				</select>
            				</div>
            				
            				<img src="resources/yeop/img/cate_arrow.png" class="arrowImg">
            				
            				<div id="sub_cate">
            				<span>소분류</span>
	            				<select size="3" id="sub_cate_select" required>
	            					<option value="">-선택-</option>
	            				</select>
            				</div>
            				<div id="cate_result">
            					<span>* 카테고리 선택결과</span>
            					<span id="cate_message"></span>
            					<!-- 카테고리 넘버 저장용 input -->
            					<input type="hidden" id="cateGory" name="P_CATEGORY_NO">
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
            				<input type="text" name="P_QUANTITY" id="p_qa" maxlength="5" required> 개
            			</td>            			
            			<th class="p_th">가격</th>
            			<td class="p_td">
            				<input type="text" id="p_price" maxlength="13" required> 원
            				<!-- 콤마뺀가격 저장 -->
            				<input type="hidden" id="p_price_removeComma" name="P_PRICE" maxlength="13">
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
            				<input type="file" name="uploadfile" onchange="readURL(this);" id="uploadfile"
								accept="image/gif, image/jpeg, image/png" required>
							<img id="upLoadFileImg" src="resources/img/noimage.gif">
            			</td>            			
            		</tr> 		
            		<tr>
            			<th class="p_ex" colspan="1">상품 설명</th>
            			<td class="p_td ck_td" colspan="3">
            			<!-- 상품설명 저장 input -->
            			<input type="hidden" id="editorData" name="P_DESCRIPTION">
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

