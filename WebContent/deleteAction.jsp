<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>    


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
			script.println("alert('�α����� �ʿ��մϴ�.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script");
			script.println("alert('��ȿ���� ���� ���Դϴ�.')");
			script.println("location.href='javascript:history.back()'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		
		// ���� ����
		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.delete(bbsID);
		
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('������ �����Ͽ����ϴ�.')");
			script.println("location.href='javascript:history.back()'");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�� ���� ����')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}
				
	
				
		
	
	
	%>

</body>
</html>