<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/detail/cosmeticDetail.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>

	<!-- header -->
	<%@include file = "../include/userHeader.jsp" %>

		<!-- 메인 화면 부분 -->
		<div class="content_area">	
		
			<div class="column-container">
				<!-- 왼쪽 -->
				<div class="div_left">
					<img class="prodImg" src="/resources/image_1/s_${prodDetail.img1 }">
				</div>
				
				<!-- 오른쪽 -->
				<div class="div_right">	
					<!-- 정보 -->
					<div></div>
					<!-- 버튼 -->
					<div class="button">						
						<div class="button_quantity">
							주문수량
							<input type="text" class="quantity_input" value="1">
							<span>
								<button class="plus_btn">+</button>
								<button class="minus_btn">-</button>
							</span>
						</div>
						<div class="button_set">
							<a class="btn_cart">장바구니 담기</a>
							<a class="btn_buy">바로구매</a>
						</div>
					</div>
				</div>
			</div><!-- column-container end -->
			
			<!-- 상세설명 -->
			<div></div>
		</div><!-- content_area end -->
		
	<!-- footer -->
	<%@include file = "../include/userFooter.jsp" %>
	
	<script>
	// 수량 버튼 조작
	let quantity = $(".quantity_input").val();
	$(".plus_btn").on("click", function(){
		$(".quantity_input").val(++quantity);
	});
	$(".minus_btn").on("click", function(){
		if(quantity > 1){
			$(".quantity_input").val(--quantity);	
		}
	});
	
	// 서버로 전송할 데이터
	const form = {
			id : '${member.id}',
			prodNum : '${prodDetail.prodNum}',
			cartCount : ''
	}
	
	// 장바구니 추가 버튼
	$(".btn_cart").on("click", function(e){
		form.cartCount = $(".quantity_input").val();
		$.ajax({
			url: '/cart/add',
			type: 'POST',
			data: form,
			success: function(result){
				cartAlert(result);
			}
		})
	});
	
	function cartAlert(result){
		if(result == '0'){
			alert("장바구니에 추가를 하지 못하였습니다.");
		}else if(result == '1'){
			alert("장바구니에 추가되었습니다.");
		}else if(result == '2'){
			alert("장바구니가 이미 추가되어져 있습니다.");
		}else if(result == '5'){
			alert("로그인이 필요합니다.");
		}
	}
	</script>
</body>
</html>