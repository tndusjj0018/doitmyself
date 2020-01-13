<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
	#mytable{
		margin-left: 50px;
	}
	
</style>
<script>
	$.ajax({
		type:"POST",
		data:{num:"${num}"},
		dataType:"json",
		url:"userList",
		success:function(rdata){
			if(rdata.length ==0){
				
			}	
		},
		error:function(){
			console.log("실패");
		}
	})
	
</script>
</head>
<body>
		<table id="mytable" class="table table-bordred table-striped">
                   <thead>
                   
                   	<th><input type="checkbox" id="checkall" /></th>
                   	<th>유저 번호</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>휴대 전화</th>
                    <th>수정/삭제</th>
                   </thead>
				    <tbody>
				    
				    <tr>
					    <td><input type="checkbox" class="checkthis" /></td>
					    <td>1</td>
					    <td>Irshad</td>
					    <td>문익점</td>
					    <td>isometric.mohsin@gmail.com</td>
					    <td>01011112222</td>
					    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
					    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
				    </tr>
				    
					 <tr>
					    <td><input type="checkbox" class="checkthis" /></td>
					    <td>2</td>
					    <td>Irshad</td>
					    <td>세종대왕</td>
					    <td>isometric.mohsin@gmail.com</td>
					    <td>01022223333</td>
					    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
					    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
					 </tr>
					    
					    
					 <tr>
					    <td><input type="checkbox" class="checkthis" /></td>
					    <td>3</td>
					    <td>Irshad</td>
					    <td>성춘향</td>
					    <td>isometric.mohsin@gmail.com</td>
					    <td>01033334444</td>
					    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
					    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
				    </tr>
				    
				    
				    
					 <tr>
					    <td><input type="checkbox" class="checkthis" /></td>
					    <td>4</td>
					    <td>Irshad</td>
					    <td>임꺽정</td>
					    <td>isometric.mohsin@gmail.com</td>
					    <td>01044445555</td>
					    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
					    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
				    </tr>
				    
				    
					 <tr>
					    <td><input type="checkbox" class="checkthis" /></td>
					    <td>5</td>
					    <td>Irshad</td>
					    <td>홍길동</td>
					    <td>isometric.mohsin@gmail.com</td>
					    <td>01055556666</td>
					    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
					    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
				    </tr>
				    
				    
				    </tbody>
				        
				</table>
				<div class="clearfix"></div>
					<ul class="pagination pull-right">
					  <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
					  <li class="active"><a href="#">1</a></li>
					  <li><a href="#">2</a></li>
					  <li><a href="#">3</a></li>
					  <li><a href="#">4</a></li>
					  <li><a href="#">5</a></li>
					  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
					</ul>
                
            	</div>
</body>
</html>