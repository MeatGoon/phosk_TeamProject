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
		<form id="insertForm" method="post">
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
		<button type="button" id="insert_btn">등록</button>
		<button type="button" id="list_btn">목록이동</button>
	</div>
	<script>
		$("#list_btn").on('click', function() {
			location.href = "/test/menueManage?cateTest=" + ${nowPage.nowCate};
		});
		$("#insert_btn").on('click', function() {
 			var text = $("select[name='category_num']").val();
			var result = 0 || null || "";
			if (text == result) {
				alert("카테고리를 선택해주시기 바랍니다.");
				console.log('if 여긴가');
			} else {
				console.log('else 여긴가');
				var nowCate = ${nowPage.nowCate};
				$("#insertForm").attr('action', '/test/insertMenue');
				$("#insertForm").append('<input type="hidden" name="cateTest" value="' + nowCate + '"/>');
				$("#insertForm").submit();
				/* 자고 일어나서 왜 작동안하는지 원인 찾기 */
				
				/* 
				Uncaught TypeError: $(...) is not a function
   				 at HTMLButtonElement.<anonymous> (insertMenue?nowCate=3:111:21)
 				 at HTMLButtonElement.dispatch (jquery.min.js:2:43064)
  				 at HTMLButtonElement.v.handle (jquery.min.js:2:41048)
				*/
			}
		});
	</script>
</body>
</html>