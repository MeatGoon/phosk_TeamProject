<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<style>
.menue_box, #menueContainer {
	border: 1px solid black;
}

.menue_box {
	margin: 10px 5px 5px 5px;
	padding: 10px;
}
</style>
<body>
	<div class="menue_infobox">
		<button id="modify_btn">수정</button>
		<button id="accpt_btn" hidden="hidden">확인</button>
		<button id="delete_btn" hidden="hidden">삭제</button>
	</div>
	<div>
		<button id="list_btn">목록이동</button>
	</div>
	<div id="menueContainer">
		<form id="updateForm" method="post">
			<div class="menue_box">
				<label>카테고리 번호 : </label> <input class="category_info" type="text"
					name="category_name" readonly="readonly"
					value='<c:out value="${meList.category_num}" />' />
			</div>
			<div class="menue_box">
				<!-- name명 수정 필요 -->
				<label>음식명 : </label> <input class="menue_info" type="text"
					name="test_menue_name" readonly="readonly"
					value="${meList.menue_name}" /> <input class="menue_info"
					type="hidden" name="menue_name" value="${meList.menue_name}" />
			</div>
			<div class="menue_box">
				<label>음식 가격 : </label> <input class="menue_info" type="text"
					name="menue_price" readonly="readonly"
					value="${meList.menue_price}" />
			</div>
			<div class="menue_box">
				<label>상세 설명 : </label> <input class="menue_info" type="text"
					name="etc" readonly="readonly" value="${meList.etc}" />
			</div>
		</form>
	</div>
	
	<script>
		let form = $("#updateForm");
		let moveForm = $("#moveForm");

		$("#modify_btn").on("click", function() {
			$(".menue_info").attr("readonly", false);
			$("#modify_btn").attr("hidden", "hidden");
			$("#accpt_btn").attr("hidden", false);
			$("#delete_btn").attr("hidden", false);
		});

		$("#accpt_btn").on("click", function() {
			form.attr("action", "/test/modify");
			form.submit();
			/* $(".menue_info").attr("readonly", "readonly"); */
		});

		$("#delete_btn").on("click", function() {
			form.attr("action", "/test/delete");
			form.submit();
		});
		function moveList() {
			location.href = "/test/cateList?cateTest=" + ${meList.category_num};
		}
		$("#list_btn")
				.on(
						"click",
						function() {
							if ($("#accpt_btn").is(":hidden")) {
								moveList();
							} else if (confirm("이전에 입력한 데이터는 저장되지 않습니다.\n목록으로 이동 하시겠습니까???") == true) { //확인
								moveList();

							} else { //취소

								return;

							}

						});
	</script>

</body>
</html>