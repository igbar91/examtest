<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import = "ssssExamTest3.ExamBean" %>
   <%@ page import = "ssssExamTest3.ExamDAO" %>
   <%@ page import = "java.util.*" %>    
   <%@ page import = "java.util.Date" %>   
<%@ page import = "java.text.SimpleDateFormat " %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 조회</title>
</head>
<body>

<%


ExamDAO edao = new ExamDAO();
Vector<ExamBean> vec = edao.getAllInfo();
%>

<h2>회원목록조회/수정</h2>
<table border="1" align="center">

<tr>
<td>
회원번호
</td>
<td>
회원성명
</td>
<td>
회원전화
</td>
<td>
회원주소
</td>
<td>
가입일자
</td>
<td>
고객등급
</td>
<td>
거주지역
</td>
</tr>
<%
				for(int i = 0; i < vec.size(); i++) {
				ExamBean ebean = vec.get(i);
			%>
<tr>
<td>
<a href="index.jsp?center=memberInfo.jsp?custno=<%=ebean.getCustno() %>"><%=ebean.getCustno() %></a>
</td>
<td>
<%=ebean.getCustname() %>
</td>
<td>
<%=ebean.getPhone() %>
</td>
<td>
<%=ebean.getAddress() %>
</td>
<td>
<%=ebean.getJoindate()%>
</td>
<!-- 시간은 안나오게 



</td>
<td><!-- a,b,c VIP ,일반, 7회원 -->
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

<%=grade%>
</td>
<td>
<%=ebean.getCity() %>
</td>
</tr>

<%
				}
%>




</table>


</body>
</html>