<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/adminProd/update.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<!-- header -->
	<%@include file="../include/adminHeader.jsp"%>

		<!-- 메인 화면 부분 -->
		<div class="admin_content_wrap">
		<form action="/adminProd/update" method="post" id="updateForm">
			<div class="input_wrap">
				<label>이 미 지 파 일</label><br>
					<input type="file" name="img1" src="/resources/image_1/${pageInfo.img1}"><br>
					<input type="file" name="img2" src="/resources/image_2/${pageInfo.img2}"><br>
					<input type="file" name="img3" src="/resources/image_3/${pageInfo.img3}"><br>
			</div>
			<div class="input_wrap">
				<label>상 품 번 호</label>
					<input name="prodNum" value="${pageInfo.prodNum}" readonly/>
			</div>
			<div class="input_wrap">
				<label>카 테 고 리 번 호</label>
					<input name="categoryNum" value="${pageInfo.categoryNum}" readonly/>
			</div>
			<div class="input_wrap">
				<label>상 품 명</label>
					<input name="prodName" value="${pageInfo.prodName}" />
			</div>
			<div class="input_wrap">
				<label>상 품 가 격</label>
					<input name="price" value="${pageInfo.price}" />
			</div>
			<div class="input_wrap">
				<label>상 품 상 세 정 보</label><br>
				<textarea rows="3" name="prodInfo">${pageInfo.prodInfo}</textarea>
			</div>
			<div class="input_wrap">
				<label>재 고 량</label>
					<input name="stock" value="${pageInfo.stock}" />
			</div>
			
			<div class="btn_wrap">
				<a class="btn" id="list_btn">목록 페이지</a>
				<a class="btn" id="submit_btn">수정하기</a>
				<a class="btn" id="delete_btn">삭제하기</a>
			</div>
		</form>
		
		<form id="infoForm" method="get" action="/adminProd/list">
			<input type="hidden" id="prodNum" name="prodNum" value="${pageInfo.prodNum}"/>
			<input type="hidden" name="type" value='<c:out value = "${cri.amount}"/>'> 
			<input type="hidden" name="keyword" value='<c:out value = "${cri.keyword}"/>'>
		</form>
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
	
    let form = $("#infoForm");
    let form2 = $("#updateForm");
    
    $("#list_btn").on("click", function(e) {
       form.find("#prodNum").remove();
       form.attr("action", "/adminProd/list");
       form.submit();
    });
    $("#submit_btn").on("click", function(e) {         
       form2.submit();
    });
    $("#delete_btn").on("click", function(e) {         
       form.attr("action", "/adminProd/delete");
       form.attr("method", "post");
       form.submit();         
    });
   </script>
</body>
</html>