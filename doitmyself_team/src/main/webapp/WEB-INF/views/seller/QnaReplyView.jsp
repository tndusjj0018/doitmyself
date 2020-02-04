<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.form-group{margin-bottom:7px!important;}
	.form-control{padding:8px!important;}
	.QnaContent{margin-bottom:15px;}
	.qna_hr{width:97%;}
	.content{margin-bottom:30px;}
	textarea[readonly]{background:#f3f3f3!important; color:gray;}
	textarea{padding:8px;}
</style>
<script>
	$(function(){
		$('#QnaUpdate').click(function(){
			var QnaAnswer = $('#QnaAnswer').val();
			var QnaNo = "${qnaView.QNA_NO}";
			location.href = "QnaUpdate?QnaNo="+ QnaNo +"&QnaAnswer=" + QnaAnswer;
		})
	})
</script>
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
      
      <div class="content">
        <div class="row row-1">
          
          <div class="">
            <div class="card card-user">
              <div class="card-header">
                <h5 class="title">상품문의 답변</h5>
                <!-- <p class="category">*사업지정보 판매자 정보</p> -->
              </div>
              <div class="card-body">
                <form>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>상품이름</label>
                        <input type="text" class="form-control" id="" placeholder="" name="" value="${qnaView.p_NAME}" readonly>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>제목</label>
                        <input type="text" class="form-control" id="" placeholder="" name="" value="${qnaView.QNA_SUBJECT}" readonly>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>작성자</label>
                        <input type="text" class="form-control" id="" placeholder="" name="" value="${qnaView.QNA_WRITER}" readonly>
                      </div>
                    </div>
                    <div class="col-md-12 QnaContent">
                      <div class="form-group">
                        <label for="exampleInputEmail1">문의내용</label>
                        <textarea rows="7" cols="122" readonly>${qnaView.QNA_CONTENT}</textarea>          
                      </div>                      
                    </div> 
                    
	                    <hr class="qna_hr">
	                  <div class="col-md-12">
	                    <div class="form-group">
	                      <label for="exampleInputEmail1"><b>답변내용</b></label>
	                      <textarea rows="7" cols="122" id="QnaAnswer">${qnaView.QNA_ANSWER}</textarea>      
	                    </div>                      
	                  </div>
	                 </div>                   
	                  
	              <div class="row">
                    <div class="ml-auto mr-auto">
                      <button type="button" class="btn btn-primary btn-round" id="QnaUpdate">답변작성</button>
                      <button type="button" class="btn btn-primary btn-round" onClick="history.go(-1);">취소</button>
                    </div>
                  </div>
                 
                <%--  <!-- 답변글 작성 안되있을때 -->
                 <c:if test="${empty qnaView.QNA_ANSWER}">
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                      <a href="seller?doc=seller_infoUpdate">
                      <button type="button" class="btn btn-primary btn-round">답변작성 페이지</button>
                      </a>
                      <button type="button" class="btn btn-primary btn-round" onClick="history.go(-1);">취소</button>
                    </div>
                  </div>
                 </c:if>
                 
                 <!-- 답변글 작성 되어있을때 -->
                 <c:if test="${!empty qnaView.QNA_ANSWER}">
                	<hr class="qna_hr">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label for="exampleInputEmail1"><b>답변내용</b></label>
                      <input type="text" class="form-control QnaContent" id="" placeholder="" name="" value="${qnaView.QNA_ANSWER}" readonly>       
                    </div>                      
                  </div>
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                      <button type="button" class="btn btn-primary btn-round" onClick="history.go(-1);">이전페이지</button>
                    </div>
                  </div>
                 </c:if> --%>
                 
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
     
    </div>