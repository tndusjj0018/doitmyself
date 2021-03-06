<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <style>
      .review_orderselect{
         float:right;
         height: 40px;
         margin-bottom: 16px;
      }
      #reviewtable>thead{
		border-bottom: 2px solid #ddd!important;
      }
      
   </style>
   <script>
   var go = function(page){
		console.log("function go");
		num = page;
		reviewList();
	}
	
	var pagination = function(page, startpage, maxpage){
		$(".clearfix").empty();
		console.log("function pagination");
		console.log("startpage="+startpage);
		console.log("maxpage="+maxpage);
		
		pageoutput = "";
		//페이지네이션 내용
		pageoutput += "<ul class='pagination pull-right'>";
		if(startpage < page){//이전페이지가 존재할 때
			pageoutput += "<li><a href='javascript:go("+(page-1)+")'><span class='glyphicon glyphicon-chevron-left'></span></a></li>";
		}else{//이전페이지가 존재하지 않을 때
			pageoutput += "<li><a href='#'><span class='glyphicon glyphicon-chevron-left'></span></a></li>";	
		}
		
		for(var i = startpage;i<=maxpage;i++){
			if(i == page){
				pageoutput += "<li><a href='#'>"+i+"</a></li>";
			}else{
				pageoutput += "<li><a href='javascript:go("+i+")'>"+i+"</a></li>";
			}	
			
		}
		if(page<maxpage){//다음페이지가 존재할 때
			pageoutput += "<li><a href='javascript:go("+(page+1)+")'><span class='glyphicon glyphicon-chevron-right'></span></a></li>";
		}else{//다음페이지가 존재하지 않을 때
			pageoutput += "<li><a href='#'><span class='glyphicon glyphicon-chevron-right'></span></a></li>";	
		}
		
		
		$(".clearfix").append(pageoutput);
	}//function pagination end
	   var num = 1;
	   //review 목록 가져오기
	   var reviewList = function(){
           $.ajax({
              type:"POST",
              dataType:"json", 
              data:{num:num, reviewOrder:$(".review_orderselect").val()},
              url:"reviewlist",
              success:function(rdata){
                 $("#reviewtable").empty();
                 output = "";
                 if(rdata.reviewlist.length == 0){//리뷰가 하나도 없을 때
                    output = "<tr><td>조회된 데이터가 없습니다.</td></tr>";
                    $("#reviewtable").append(output);
                 }else{//리뷰가 있을 때
               	 console.log(rdata);
                    output += "<thead>";
                    output += "      <tr>";
                    output += "         <td>리뷰 번호</td>";
                    output += "         <td>아이디</td>";
                    output += "         <td>리뷰 내용</td>";
                    output += "         <td>작성일</td>";
                    output += "         <td>삭제</td>";
                    output += "      </tr>";
                    output += "</thead>";
                    output += "<tbody>";
                    
                    $(rdata.reviewlist).each(function(){
                   	 output += "<tr>";
                   	 output += "<td>"+this.review_NO+"</td>";
                   	 output += "<td>"+this.review_WRITER+"</td>";
                   	 output += "<td>"+this.review_CONTENT+"</td>";
                   	 output += "<td>"+this.review_DATE+"</td>";
                   	 output += "<td><button class='btn btn-danger btn-xs reviewDelete'><span class='glyphicon glyphicon-trash'></span></button></td>";
                   	 output += "</tr>";
                    })
                    
                    output += "</tbody>";
                    
                    $("#reviewtable").append(output);
                    
                    var page = rdata.num;
                    var startpage = rdata.startpage;
                    var maxpage = rdata.maxpage;
                    pagination(page, startpage, maxpage);
                    
                 }
                 
                 $(".reviewDelete").click(function(){
               	  var trNum = $(this).closest('tr').prevAll().length;//몇번째 row를 선택했는지 확인
               	  var reviewNum = $("#reviewtable tr:eq("+(trNum+1)+") td:eq(0)").text();//trNum 번째 row에서 리뷰 등록 번호 확인
               	  console.log("reviewNum = "+reviewNum);
               	  var check = confirm("해당 리뷰를 삭제하시겠습니까?");
               	  if(check == true){
	               	  delete_review(reviewNum, trNum);
               	  }
               	  
                 })
                 
                 
                 
                 
                 
              },
              error:function(){
                 console.log("reviewList ajax 에러남");
              }
              
           })//ajax end
           
           
           
        }//reviewList function end
   	
    	 var delete_review = function(reviewNo, trNum){
			console.log("function delte_review()");
			console.log("reviewNo = "+ reviewNo);
			
			$.ajax({
				type:"POST",
				data:{REVIEW_NO:reviewNo},
				url:"DeleteReview",
				success:function(rdata){
					console.log("일단은 성공");
					
					if(rdata == 0){
						alert("리뷰 삭제 실패입니다.");
					}else{
						alert("리뷰 삭제 성공입니다.");
						$("#reviewtable tr:eq("+(trNum+1)+")").remove();
						reviewList();
					}
					
				},
				error:function(){
					console.log("에러");
				}
				
			})
			
		}//delete_review end	
		
      $(document).ready(function(){
		
    	  
    	  
    	  //선택된 정렬 방법 그대로 가져가기
         if("${reviewOrder}" == ""){//정렬 기준을 정하지 않았을 때 => 기본적으로 최신순이 선택되어 있음
            console.log("기본적으로 선택된 정렬 방법이 없습니다.최신순으로 정렬합니다.");
            console.log(".review_orderselect의 최초 value = "+$(".review_orderselect").val());
         }else{
            console.log("선택된 정렬 방법은 ${reviewOrder}입니다.");
            //주소의 parameter 값 받아와서 select 설정
            $(".review_orderselect option[value = ${reviewOrder}]").prop("selected", true);
         }
         
     	 
      
         //기본적으로 실행
         reviewList();
         
         
         
         $(".review_orderselect").change(function(){
            console.log($(this).val());
            reviewList();   
         })//change end
         
         
      })
   </script>
</head>
<body>
   <font id = "admin_viewtitle">리뷰 관리</font><br>
   
   <select class="review_orderselect">
      <option value="REVIEW_DATE DESC">최신순</option>
      <option value="REVIEW_WRITER DESC">아이디 내림차순</option>
      <option value="REVIEW_WRITER ASC">아이디 오름차순</option>
      <option value="REVIEW_RATE DESC">별점 높은순</option>
      <option value="REVIEW_RATE ASC">별점 낮은순</option>
   </select>
   <table class = "table table-striped" id="reviewtable">
      
   </table>
   <div class="clearfix">
   
   </div>
   
</body>
</html>
