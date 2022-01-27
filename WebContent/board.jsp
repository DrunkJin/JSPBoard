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
<title>게시판</title>
</head>
<body>
	<% 
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
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
						<th style="background-color: #eeeeee; text-align: center; width: 80px">번호</th>
						<th style="background-color: #eeeeee; text-align: center; width: 1000px">제목</th>
						<th style="background-color: #eeeeee; text-align: center; width: 80px">작성자</th>
						<th style="background-color: #eeeeee; text-align: center; width: 150px">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO(); // 인스턴스 생성
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++){
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<!-- 게시글 제목을 누르면 해당 글을 볼 수 있도록 링크를 걸어둔다 -->
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>">
							<%= list.get(i).getBbsTitle() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
							+ list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
					</tr>
					<%
						}
					%>
				</tbody>

				
	</table>
	        
       <% if(pageNumber != 1){ %>
        <form align="center" method="POST" action="board.jsp?pageNumber=<%=pageNumber - 1 %>">              
	        <p><input type="submit" value="이전"></p>  </form>
	    
		<%
			}if(bbsDAO.nextPage(pageNumber + 1)){
		%>
		 <form align="center" method="POST" action="board.jsp?pageNumber=<%=pageNumber + 1 %>">     
		 <p><input type="submit" value="다음"></p></form>   
		<%
			}
		%>
		<% if(userID==null){
			  %>
		<form align="center" method="POST" action="writeAction.jsp">              
	        <p><input type="submit" value="글쓰기"></p>  </form>
	  	<%} else{
		%>
		<form align="center" method="POST" action="write.jsp">              
	        <p><input type="submit" value="글쓰기"></p>  </form>
	        <%} %>
		</table>

</body>
</html>