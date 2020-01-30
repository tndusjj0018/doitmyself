<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		.seller_star{
			width:20px;
			height:20px;
		}
		.sellerInfoForm{
			border: 1px solid black;
			text-align: center;
		}
		.sellerInfoForm font{
			width: 300px;
			display: inline-block;
		}
		.sellerInfoForm  * {
		border: 1px solid black;
		}
		.sellerInfoForm > div{
			width:500px;
			margin: 0 auto;
		}
	</style>
	<script>
		$(document).ready(function(){
			console.log("${seller.SELLER_ADDRESS}");
			
			
			
		})
	</script>
</head>
<body>
	<div class = "sellerInfo">
		<input type = "text" name="SELLER_NAME" class="" value="${seller.SELLER_NAME}"><br>
		<input type = "text" name="SELLER_RATE" class="" value="${seller.SELLER_RATE}"><br>
		<input type = "text" name="SELLER_ID" class="" value="${seller.SELLER_ID}"><br>
		<input type = "text" name="SELLER_POSTCODE" class="" value="${seller.SELLER_POSTCODE}"><br>
		<input type = "text" name="SELLER_ADDRESS" class="" value="${seller.SELLER_ADDRESS}"><br>
	</div>
	
	<form class="sellerInfoForm">
		<div><font>${seller.SELLER_NAME}</font><span><img src = "resources/img/seller_star.png" class = "seller_star">${seller.SELLER_RATE}</span></div>
		<div><font>${seller.SELLER_ID}</font></div>
		
	</form>
</body>
</html>