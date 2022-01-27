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
<title>회원가입</title>
</head>
<body>

	<% 
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || 
		user.getUserGender() == null || user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 하지 않은 항목이 있습니다.')");
			script.println("location.href='javascript:history.back()'");
			script.println("</script>");
		}else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("location.href='javascript:history.back()'");
				script.println("</script>");
			}else{
				// 회원가입 완료하면 세션을 부여하여 자동으로 로그인되게 해줌
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원 가입이 완료되었습니다.')");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
		}
			
	
	
	
	%>

</body>
</html>