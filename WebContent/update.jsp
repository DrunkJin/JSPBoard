<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
    
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
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�α����� �ϼ���')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('��ȿ���� ���� ���Դϴ�')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		//�ش� 'bbsID'�� ���� �Խñ��� ������ ���� ������ ���Ͽ� �ۼ��� ������ �´��� üũ�Ѵ�
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('������ �����ϴ�')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
	%>

			<form align="center" method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
			<table align="center" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">�Խ��� �ۼ��� ���</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<td><input type="text" placeholder="�� ����" name = "bbsTitle" maxlength="50" style="width: 1000px" value="<%= bbs.getBbsTitle() %>"></td>
					<tr>
						<td><textarea placeholder="�� ����" name="bbsContent" maxlength="2048" style="height: 350px; width: 1000px"><%=bbs.getBbsContent() %></textarea></td>
					</tr>
				</tbody>
			</table>
				<input type="submit" value="�����ϱ�">
		</form>
				
	</table>

</body>
</html>