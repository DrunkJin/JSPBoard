<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>    
<jsp:useBean id = "bbs" class = "bbs.Bbs" scope = "page" />
<jsp:setProperty name = "bbs" property = "bbsTitle" />
<jsp:setProperty name = "bbs" property = "bbsContent" />


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글쓰기</title>
</head>
<body>
	<% 
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기는 회원만 가능합니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}else{
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 하지 않은 항목이 있습니다.')");
				script.println("location.href='javascript:history.back()'");
				script.println("</script>");
			}else{
				BbsDAO bbsDAO = new BbsDAO();
				
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다..')");
					script.println("location.href='javascript:history.back()'");
					script.println("</script>");
				}else{
					// 회원가입 완료하면 세션을 부여하여 자동으로 로그인되게 해줌
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 성공')");
					script.println("location.href='board.jsp'");
					script.println("</script>");
				}
			}
		}
				

	%>

</body>
</html>