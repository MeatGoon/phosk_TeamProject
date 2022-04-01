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
<body>
	<h1>등록페이지</h1>
	<div>
		<form id="/test/insertForm" method="post">
			<div>
				<select name="category_num">
					<c:forEach var="cateList" items="${cateList}">
						<c:choose>
							<c:when test="${cateList.category_num eq nowPage.nowCate}">
								<option selected="selected" value="${cateList.category_num}">${cateList.category_name}</option>
							</c:when>
							<c:otherwise>
								<option value="${cateList.category_num}">${cateList.category_name}</option>
							</c:otherwise>
						</c:choose>

					</c:forEach>
				</select>
			</div>
			<div>
				<label>음식 명 : </label><input type="text" name="menue_name" />
			</div>
			<div>
				<label>음식 가격 : </label><input type="text" name="menue_price" />
			</div>
			<div>
				<label>상세 설명 : </label><input type="text" name="etc" />
			</div>
		</form>
		<button id="insert_btn">등록</button>
		<button id="list_btn">목록이동</button>
	</div>
	<script>
		$("#list_btn").on('click', function() {
			window.location.href = '/test/cateList'
		});
		$("#insert_btn").on('click', function() {
			var text = $("select[name='category_num']").val();
			var result = 0 || null || "";
			if (text == result) {
				alert("카테고리를 선택해주시기 바랍니다.")
			} else {
				$("#insertForm").attr('action', '/test/insertMenue');
				$("#insertForm").submit();
			}
		});
	</script>
</body>
</html>