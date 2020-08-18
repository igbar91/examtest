<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import = "ssssExamTest3.ExamBean" %>
   <%@ page import = "ssssExamTest3.ExamDAO" %>
   <%@ page import = "java.util.*" %>   
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원매출조회</title>
</head>
<style>
table {
align:center;
}
</style>
<body>


				 
<h2>회원매출조회</h2>
<%
ExamDAO edao = new ExamDAO();
Vector<ExamBean> vecter = edao.getSales();
%>
<table border="1" align="center">
<tr>
<td>
회원번호
</td>
<td>
회원성명
</td>
<td>
고객등급
</td>
<td>
매출
</td>
</tr>
<%
				for(int i = 0; i < vecter.size(); i++) {
				ExamBean ebean = vecter.get(i);
			%>
				 
				 	<tr>
			<td><%= ebean.getCustno() %></td>
			<td><%= ebean.getCustname() %></td>
			<td>
			<%
String grade = request.getParameter("grade");

switch(ebean.getGrade()){
case "A" : grade = "VIP";
break;
case "B" : grade = "일반";
break;
case "C" : grade = "직원";
break;
}


%>
			
			<%= grade %></td>
			<td><%= ebean.getTotal() %></td>
		</tr>
<%
}%>	

</table>
</body>
</html>