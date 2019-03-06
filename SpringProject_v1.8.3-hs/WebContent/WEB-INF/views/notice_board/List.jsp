<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="./resources/js/jquery.js"></script>
<script type="text/javascript" src="./resources/js/board.js" charset="utf-8"></script>
<title>공지 게시판 리스트</title>
</head>
<body>
	<jsp:include page="../Head.jsp" />
	<c:if test="${!empty sessionScope.id}" >
	<table align="center" cellpadding="1" width="700" border="0">
		<tr>
			<td>총 게시물 수 : <c:out value="${boardCount}" /></td>
			<td><p align="right">
					페이지:
					<c:out value="1" />
				</p></td>
			<td>
			<c:if test="${sessionScope.admin == 1}">
			<form action="/notice_board_write_form.do" method="get">
				<input type="submit" value="글쓰기">
			</form>
			</c:if>
			</td>
			
		</tr>
	</table>

	<table align="center" cellpadding="1" width="700" border="1">
		<tr>
			<td width="80"><p align="center">번호</p></td>
			<td width="100"><p align="center">이름</p></td>
			<td width="320"><p align="center">제목</p></td>
			<td width="100"><p align="center">등록일</p></td>
			<td width="100"><p align="center">조회수</p></td>
		</tr>

		<c:forEach var="board" items="${boardList}">
			<tr>
				<td width="80"><p align="center">${board.no}</p></td>
				<td width="100"><p align="center">${board.name}</p></td>
				<td width="320">
					<p align="center">
						<a href="notice_board_view_contents.do?no=${board.no}&offset=${offset}&pagelink=${pagelink}">
						<c:out value="${board.subject}" />
						</a>
					</p>
				</td>
				<td width="100"><p align="center">${board.wdate}</p></td>
				<td width="100"><p align="center">${board.views}</p></td>
			</tr>
		</c:forEach>
	</table>
	<form name="searchForm" action="/notice_board_serch_list.do" method="GET" >
		<table align="center" width="700" >
			<tr height="40"><td colspan="3">${PagingCount}</td></tr>
			<tr>
				<td width="80"><select name="find">
						<option value="name">이름</option>
						<option value="subject">제목</option>
						<option value="contents">내용</option>
				</select></td>
				
				<td width="520"><input type="hidden" name="offset" value="0" />
				<input type="hidden" name="pagelink" value="1" />
				<input type="text" name="search"  style="width:500px;"></td>
				<td width="100"><input type="button" value="검색" onclick="searchCheck()" style="width:90px; height:30px"></td>
			</tr>
		</table>
	</form>
	</c:if>
</body>
</html>