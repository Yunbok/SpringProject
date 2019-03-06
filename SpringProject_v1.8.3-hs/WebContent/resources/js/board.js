// 글쓰기폼 유효성 검사
function writeCheck() {
	if (document.writeForm.subject.value == "") {
		alert("제목을 입력하세요.");
		$("#subject").focus();
		return;
	} 
	if (document.writeForm.contents.value == "") {
		alert("내용을 입력하세요.");
		$("#contents").focus();
		return;
	}
	document.writeForm.submit();
}

// 글수정폼 유효성 검사
function updateWriteCheck() {
	if (document.updateWriteForm.subject.value == "") {
		alert("제목을 입력하세요.");
		$("#subject").focus();
		return;
	} 
	if (document.updateWriteForm.contents.value == "") {
		alert("내용을 입력하세요.");
		$("#contents").focus();
		return;
	}
	document.updateWriteForm.submit();
}

// 오류게시판 리스트 불러오기
function debugBoardList() {
	document.location.href = 'debug_board_list.do?offset=0&pagelink=1';
}

//공지게시판 리스트 불러오기
function noticeBoardList() {
	document.location.href = 'notice_board_list.do?offset=0&pagelink=1';
}

// 글 검색
function searchCheck() {
	if (document.searchForm.search.value == "") {
		alert("검색내용을 입력하세요.");
		$("#search").focus();
		return;
	}
	document.searchForm.submit();
}