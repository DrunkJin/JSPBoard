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
<title>�۾���</title>
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
			script.println("alert('�۾���� ȸ���� �����մϴ�.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}else{
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�Է��� ���� ���� �׸��� �ֽ��ϴ�.')");
				script.println("location.href='javascript:history.back()'");
				script.println("</script>");
			}else{
				BbsDAO bbsDAO = new BbsDAO();
				
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('�۾��⿡ �����߽��ϴ�..')");
					script.println("location.href='javascript:history.back()'");
					script.println("</script>");
				}else{
					// ȸ������ �Ϸ��ϸ� ������ �ο��Ͽ� �ڵ����� �α��εǰ� ����
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('�۾��� ����')");
					script.println("location.href='board.jsp'");
					script.println("</script>");
				}
			}
		}
				

	%>

</body>
</html>