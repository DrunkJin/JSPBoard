<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ���</title>
</head>
<body>
	<% 
		// ���� �������� �̵����� �� ���ǿ� ���� ����ִ��� üũ
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('��ȿ���� ���� ���Դϴ�.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}
		
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>

			<form align="center" method="post" action="board.jsp">
			<table align="center" style="text-align: center; border: 1px solid #dddddd">
				<thead>
				
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;background-color: #eeeeee;">�� ����</td>
						<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;")
								.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td style="background-color: #eeeeee;">�ۼ���</td>
						<td colspan="2"><%= bbs.getUserID() %></td>
					</tr>
					<tr>
						<td style="background-color: #eeeeee;">�ۼ�����</td>
						<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "��"
								+ bbs.getBbsDate().substring(14, 16) + "��" %></td>
					</tr>
					<tr>
						<td style="background-color: #eeeeee;">����</td>
						<td colspan="2" style="height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;")
							.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
				<input type="submit" value="������� ���ư���">
		</form>
		<%
				if(userID != null && userID.equals(bbs.getUserID())){
			%>
					<form align="center" method="post" action="update.jsp?bbsID=<%= bbsID %>">
					<input type="submit" value="����"></form>
					
					<form align="center" method="post" action="deleteAction.jsp?bbsID=<%= bbsID %>">
					<input type="submit" value="����"></form>
			<%
				}
			%>
				
	</table>

</body>
</html>