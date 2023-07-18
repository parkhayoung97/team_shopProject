<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Create Page</title>
<link rel="stylesheet" href="../resources/css/adminProd/create.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<!-- header -->
	<%@include file="../include/adminHeader.jsp"%>
	
		<!-- 메인 화면 부분 -->
		<div class="admin_content_wrap">
			<div class="form_div">
			<form action="/adminProd/create" method="post" id="createForm">
				<table class="create_prod">
					<tr>
						<th>카테고리</th>
						<td>
							<select name="categoryNum">
							<c:forEach var="cate" items="${cateList }">
								<option value="${cate.cateCode }">${cate.cateName }</option> -->
							</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td><input name="prodName"></td>
					</tr>
					<tr>
						<th>이미지 파일</th>
						<td>
						<input class="file_area" type="file" name="img1" src="/resources/image_1/*"><br>
				 		<input class="file_area" type="file" name="img2" src="/resources/image_2/*"><br>
						<input class="file_area" type="file" name="img3" src="/resources/image_3/*">			
						</td>
					</tr>
					<tr>
						<th>상품 가격</th>
						<td><input name="price"></td>
					</tr>
					<tr>
						<th>상품 정보</th>
						<td><textarea rows="5" cols="20" name="prodInfo"></textarea></td>
					</tr>
					<tr>
						<th>재고량</th>
						<td><input name="stock"></td>
					</tr>
				</table>
			</form>
			</div>
			
			<!-- 버튼 -->
			<div class="button_div">
				<button id="enrollBtn" class="btn enroll_btn">등록</button>
				<button id="cancelBtn" class="btn">취소</button>
			</div>
		</div>
		
	<!-- footer -->
	<%@include file="../include/adminFooter.jsp"%>
	
	<script>
		/* 이미지 업로드 */
		$("input[name='img1']").on("change", function(e){
	//		alert("이미지 삽입");
			let formData = new FormData();
			
			let fileInput = $('input[name="img1"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];
			
			if(!fileCheck(fileObj.name, fileObj.size)){		// 맞지 않는 파일
				return false;
			}
			
			formData.append("uploadFile", fileObj);
			
			$.ajax({
				url: '/adminProd/uploadAjaxAction/1',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json'
			});
		});
		$("input[name='img2']").on("change", function(e){
			let formData = new FormData();
			// alert("이미지 삽입");
			let fileInput = $('input[name="img2"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];
			
			if(!fileCheck(fileObj.name, fileObj.size)){		// 맞지 않는 파일
				return false;
			}
			
			formData.append("uploadFile", fileObj);
			
			$.ajax({
				url: '/adminProd/uploadAjaxAction/2',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json'
			});
		});
		$("input[name='img3']").on("change", function(e){
			let formData = new FormData();
			//alert("이미지 삽입");
			let fileInput = $('input[name="img3"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];
			
			if(!fileCheck(fileObj.name, fileObj.size)){		// 맞지 않는 파일
				return false;
			}
			
			formData.append("uploadFile", fileObj);
			
			$.ajax({
				url: '/adminProd/uploadAjaxAction/3',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json'
			});
		});
		
		/* 업로드 파일 체크 */
		let regex = new RegExp("(.*?)\.(jpg|png)$");	// 파일 형식
		let maxSize = 1048576; //1MB					// 파일 용량
		
		function fileCheck(fileName, fileSize){

			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
				  
			if(!regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			
			return true;					
		}
		
		/*등록 버튼*/
		$("#enrollBtn").click(function() {
			$("#createForm").submit();
		});
		/*취소 버튼*/
		$("#cancelBtn").click(function() {
			location.href = "/adminProd/list";
		});
	</script>
</body>
</html>