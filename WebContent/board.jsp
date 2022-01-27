<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.io.PrintWriter" %>    
<%@ page import = "bbs.BbsDAO" %>    
<%@ page import = "bbs.Bbs" %>
<%@ page import = "java.util.ArrayList" %>    
<!DOCTYPE html>
<html>
<head>
  </style>
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
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<table align="center" vertical-align="middle" style="border:1px solid #48BAE4; height:70px; width:auto;" >
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center; width: 80px">��ȣ</th>
						<th style="background-color: #eeeeee; text-align: center; width: 1000px">����</th>
						<th style="background-color: #eeeeee; text-align: center; width: 80px">�ۼ���</th>
						<th style="background-color: #eeeeee; text-align: center; width: 150px">�ۼ���</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO(); // �ν��Ͻ� ����
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++){
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<!-- �Խñ� ������ ������ �ش� ���� �� �� �ֵ��� ��ũ�� �ɾ�д� -->
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>">
							<%= list.get(i).getBbsTitle() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "��"
							+ list.get(i).getBbsDate().substring(14, 16) + "��" %></td>
					</tr>
					<%
						}
					%>
				</tbody>

				
	</table>
	        
       <% if(pageNumber != 1){ %>
        <form align="center" method="POST" action="board.jsp?pageNumber=<%=pageNumber - 1 %>">              
	        <p><input type="submit" value="����"></p>  </form>
	    
		<%
			}if(bbsDAO.nextPage(pageNumber + 1)){
		%>
		 <form align="center" method="POST" action="board.jsp?pageNumber=<%=pageNumber + 1 %>">     
		 <p><input type="submit" value="����"></p></form>   
		<%
			}
		%>
		<% if(userID==null){
			  %>
		<form align="center" method="POST" action="writeAction.jsp">              
	        <p><input type="submit" value="�۾���"></p>  </form>
	  	<%} else{
		%>
		<form align="center" method="POST" action="write.jsp">              
	        <p><input type="submit" value="�۾���"></p>  </form>
	        <%} %>
		</table>

</body>
</html>