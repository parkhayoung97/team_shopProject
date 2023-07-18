<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/cart/cartPage.css">
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

			<!-- cartInfo -->
			<!-- 왼쪽 -->
			<section class="column-left">
				<div class="content_subject"><h2>쇼핑백</h2></div>
				<!-- 장바구니 X -->
				<c:if test="${empty cartInfo }">				
					<div class="content_total_section">장바구니에 담긴 상품이 없습니다.</div>			
				</c:if>
				<!-- 장바구니 O -->
				<c:if test="${!empty cartInfo }">
				<table class="cart_table">
					<tbody>
						<c:forEach items="${cartInfo}" var="ci">
							<tr>
								<td class="td_width_1 cart_info_td">									
									<input type="hidden" class="individual_Price_input" value="${ci.price}">
									<input type="hidden" class="individual_cartCount_input" value="${ci.cartCount}">
									<input type="hidden" class="individual_totalPrice_input" value="${ci.price * ci.cartCount}">
									<input type="hidden" class="individual_prodNum_input" value="${ci.prodNum}">
								</td>	
								<td class="td_width_2">
									<div class="image_wrap">
										<img src="/resources/image_1/s_${ci.img1 }">
									</div>
								</td>
								<td class="td_width_3">${ci.prodName}</td>
								<td class="td_width_4 price_td">
									 <fmt:formatNumber value="${ci.price}" pattern="#,### 원" />	
								</td>
								<td class="td_width_4 table_text_align_center">
									<div class="table_text_align_center quantity_div">
										<input type="text" value="${ci.cartCount}" class="quantity_input">	
										<button class="quantity_btn plus_btn">+</button>
										<button class="quantity_btn minus_btn">-</button>
									</div>
									<a class="quantity_modify_btn" data-cartnum="${ci.cartNum}">변경</a>
								</td>
								<td class="td_width_4 table_text_align_center">
									<fmt:formatNumber value="${ci.price * ci.cartCount}" pattern="#,### 원" />
								</td>
								<td class="td_width_4 table_text_align_center">
								<button class="delete_btn" data-cartnum="${ci.cartNum}">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</c:if>
			</section>	
			
			<!-- 장바구니가 있을 때 -->
			<c:if test="${!empty cartInfo }">
			<section class="column-right">
			<div class="content_subject"><h2>결제 내역</h2></div>
			<!-- 가격 종합 -->
				<div class="total_wrap">
					<table>
						<tr>
							<td>
								<table>
									<tr>
										<td>주문 금액</td>
										<td class="cart_span">
											<span class="totalPrice_span">70000</span> 원
										</td>
									</tr>
									<tr>
										<td>배송비<span class="deliver_p">3만원 이상 구매시 무료</span></td>
										
											
											<td class="cart_span"><span class="delivery_price">3000</span>원
										</td>
									</tr>									
									<tr>
										<td>총 주문 상품수</td>
										<td class="cart_span"><span class="totalCount_span"></span> 개</td>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</table>							
							</td>
						</tr>
					</table>
					<div class="boundary_div"></div>
					<table> 
						<tr>
							<td>
								<table>
									<tbody>
										<tr>
											<td class="total_pr">
												<strong>총 금액</strong>
											</td>
											<td class="cart_span">
												<span class="finalTotalPrice_span"></span> 원</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
			
				<div class="btn_section">
				<!-- 쇼핑계속하기 버튼 -->
				<div class="continue_btn_section">
					<a href="/category/cosmeticMain"><button>쇼핑 계속하기</button></a>
				</div>
				<!-- 구매 버튼 영역 -->		
				<div class="content_btn_section">
					<a class="order_btn"><button>주문하기</button></a>
				</div>
				</div>	
			</section>
			</c:if>
				
		<!-- 수량 조정 form -->
		<form action="/cart/update" method="POST" class="quantity_update_form">
			<input type="hidden" name="cartNum" class="update_cartNum">
			<input type="hidden" name="cartCount" class="update_cartCount">
			<input type="hidden" name="Id" value="${member.id}">
		</form>
		
		<!-- 삭제 form -->
		<form action="/cart/delete" method="POST" class="quantity_delete_form">
			<input type="hidden" name="cartNum" class="delete_cartNum">
			<input type="hidden" name="Id" value="${member.id}">
		</form>
		
		<!-- 주문 form -->
		<form action="/userOrder/order/${member.id }" method="get" class="order_form">
		
		</form>	
		</div><!--  -->	
	</div><!--  -->
	<!-- footer -->
	<%@include file = "../include/userFooter.jsp" %>
	
	<script>
		$(document).ready(function(){
			
			/* 종합 정보 섹션 정보 삽입 */
			setTotalInfo();	
				
		});	
		
		/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
		function setTotalInfo(){
			
			let totalPrice = 0;				// 총 가격
			let totalCount = 0;				// 총 갯수
			
			let deliveryPrice = 0;			// 배송비
			let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)
			
			$(".cart_info_td").each(function(index, element){
				
				
					// 총 가격
					totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
					// 총 갯수
					totalCount += parseInt($(element).find(".individual_cartCount_input").val());
					console.log(totalCount);
				
			});
				
				
			/* 배송비 결정 */
			if(totalPrice >= 30000){
				deliveryPrice = 0;
			} else if(totalPrice == 0){
				deliveryPrice = 0;
			} else {
				deliveryPrice = 3000;	
			}
			
				finalTotalPrice = totalPrice + deliveryPrice;
			
				
			/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */
			
			// 총 가격
			$(".totalPrice_span").text(totalPrice.toLocaleString());
			// 총 갯수
			$(".totalCount_span").text(totalCount);
		
			// 배송비
			$(".delivery_price").text(deliveryPrice);	
			// 최종 가격(총 가격 + 배송비)
			$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
		}
		
		
		/* 수량버튼 */
		$(".plus_btn").on("click", function(){
			let quantity = $(this).parent("div").find("input").val();
			$(this).parent("div").find("input").val(++quantity);
		});
		$(".minus_btn").on("click", function(){
			let quantity = $(this).parent("div").find("input").val();
			if(quantity > 1){
				$(this).parent("div").find("input").val(--quantity);		
			}
		});
			
			
		/* 수량 수정 버튼 */
		$(".quantity_modify_btn").on("click", function(){
			let cartNum = $(this).data("cartnum");
			let cartCount = $(this).parent("td").find("input").val();
			
			$(".update_cartNum").val(cartNum);
			$(".update_cartCount").val(cartCount);
			$(".quantity_update_form").submit();
			
		});
		
		/* 장바구니 삭제 버튼 */
		$(".delete_btn").on("click", function(e){
			e.preventDefault();
			const cartNum = $(this).data("cartnum");
			
			console.log(cartNum);
			
			$(".delete_cartNum").val(cartNum);
			
			$(".quantity_delete_form").submit();
		});
			
		/*주문 페이지 이동*/
		$(".order_btn").on("click", function(){
			let form_contents ='';
			let orderNumber = 0;
			$(".cart_info_td").each(function(index, element){
				let prodNum = $(element).find(".individual_prodNum_input").val();
				let cartCount = $(element).find(".individual_cartCount_input").val();
				
				let prodNum_input = "<input name='orders[" + orderNumber + "].prodNum' type='hidden' value='" + prodNum + "'>";
				form_contents += prodNum_input;
				
				let cartCount_input = "<input name='orders[" + orderNumber + "].prodCount' type='hidden' value='" + cartCount + "'>";
				form_contents += cartCount_input;
				
				orderNumber += 1;
			});
			
			$(".order_form").html(form_contents);
			$(".order_form").submit();
		});
	</script>
	
</body>
</html>