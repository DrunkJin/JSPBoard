<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "user.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>    
<jsp:useBean id = "user" class = "user.User" scope = "page" />
<jsp:setProperty name = "user" property = "userID" />
<jsp:setProperty name = "user" property = "userPassword" />
<jsp:setProperty name = "user" property = "userName" />
<jsp:setProperty name = "user" property = "userGender" />
<jsp:setProperty name = "user" property = "userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<body>

	<% 
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || 
		user.getUserGender() == null || user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�Է��� ���� ���� �׸��� �ֽ��ϴ�.')");
			script.println("location.href='javascript:history.back()'");
			script.println("</script>");
		}else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�̹� �����ϴ� ���̵��Դϴ�.')");
				script.println("location.href='javascript:history.back()'");
				script.println("</script>");
			}else{
				// ȸ������ �Ϸ��ϸ� ������ �ο��Ͽ� �ڵ����� �α��εǰ� ����
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('ȸ�� ������ �Ϸ�Ǿ����ϴ�.')");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
		}
			
	
	
	
	%>

</body>
</html>