<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="menueContainer">
		<div class="manage_con">
			<button id="manage_btn">메뉴관리</button>
		</div>
		<div class="menue_eachform">
			<c:forEach items='${meList}' var='meList'>
				<c:if test='${meList.category_num eq 2}'>
					<div class='menueInfo_container'>
						<button name="${meList.menue_name}" value="${meList.category_num}"
							id="detailMenue_open">상세보기</button>
						<div class="menueInfo menueInfo_top">
							<span class="menue_text menue_text_top menue_info_name">음식명
								: ${meList.menue_name}</span> <span
								class="menue_text menue_text_top menue_info_price">가격 : <fmt:formatNumber
									value="${meList.menue_price}"></fmt:formatNumber>&nbsp;원
							</span>
						</div>
						<div class="menueInfo menueInfo_bottom">
							<span class="menue_text menue_info_detail">${meList.etc}</span>
						</div>
					</div>
				</c:if>
			</c:forEach>

		</div>
	</div>
	<div>
		<p>testing</p>
		<span>${cateTest}</span>
	</div>
</body>
</html>