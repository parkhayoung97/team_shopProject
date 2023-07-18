<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/myPage/loginConfirm.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

	<!-- header -->
	<%@include file = "../include/userHeader.jsp" %>
	<!-- 메인 화면 부분 -->
	<div class="content_area">
	
	<!-- 사이드 바 -->
	<%@ include file="/WEB-INF/views/include/sideBar.jsp"%>
	
	<div>
		<h1>회원 정보 확인</h1>
		<form id="re_login_form" method="post">
			아이디 : ${member.id}
			<div class="pw_wrap">
				<div class="pw_input_box">
					비밀번호 확인 : <input class="pw_input" name="pw">
				</div>
			</div>
			<c:if test="${result==0}">
				<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
			</c:if>
			<div class="re_login_btn_wrap">
				<input type="button" class="re_login_btn" value="확인">
			</div>
			<input type="hidden" name="id" value = "${member.id}">
		</form>
	</div>
	
	</div><!-- content_wrap end -->
	
	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/userFooter.jsp" %>
	
	<script>
		$(".re_login_btn").click(function() {
			$("#re_login_form").attr("action", "/myPage/loginConfirm");
			$("#re_login_form").submit();
		});
	</script>

</body>
</html>