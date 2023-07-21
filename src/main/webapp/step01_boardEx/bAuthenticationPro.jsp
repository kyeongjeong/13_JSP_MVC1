<%@page import="step01_boardEx.BoardDAO"%>
<%@page import="step01_boardEx.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bAuthenticationPro</title>
</head>
<body>

	<% 
	
		request.setCharacterEncoding("utf-8");
	
		String boardId  = request.getParameter("boardId");
		String password = request.getParameter("password");
		String menu     = request.getParameter("menu");
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setBoardId(Long.parseLong(boardId));
		boardDTO.setPassword(password);
		
		boolean isAuthorizedUser = BoardDAO.getInstance().checkAuthorizedUser(boardDTO);
		
		if (isAuthorizedUser) {
			
			if (menu.equals("update")) {
	%>
				<script>
					location.href = "bUpdate.jsp?boardId=" + <%=boardId%>;
				</script>
	<% 
			}
			else if (menu.equals("delete")) {
				//삭제화면으로이동
	%>
				<script>
					location.href = "bDelete.jsp?boardId=" + <%=boardId%>;
				</script>
	<% 
			}
			
		}
		else {
	%>
			<script>
				alert("패스워드가 틀렸습니다.");
				location.href = "bDetail.jsp?boardId=" + <%=boardId%>;
			</script>
	<% 	
		}
	%>
	
</body>
</html>