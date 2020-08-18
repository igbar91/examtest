<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import = "ssssExamTest3.ExamBean" %>
   <%@ page import = "ssssExamTest3.ExamDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈쇼핑 회원 정보 수정</title>
</head>
<body>
<% 
	int custno=Integer.parseInt(request.getParameter("custno"));

		ExamDAO edao = new ExamDAO();
		ExamBean ebean = edao.getOneInfo(custno);
%>

	
<h2>회원목록조회/수정</h2>
<form method="post" action="memberInfoPro.jsp">
<table border="1" align="center">

<tr>
<td>
회원번호
</td>
<td>
<%=ebean.getCustno() %>

</td>
</tr>
<tr>
<td>
회원성명
</td>
<td>
<input type="text" name="custname"  size="30"  value="<%=ebean.getCustname() %>">

</td>
</tr>
<tr>
<td>
회원전화
</td>
<td>
<input type="text" name="phone"  size="30"  value="<%=ebean.getPhone() %>">

</td>
</tr>
<tr>
<td>
회원주소
</td>
<td>
<input type="text" name="adddress"  size="30"  value="<%=ebean.getAddress() %>">

</td>
</tr>
<tr>
<td>
가입일자
</td>
<td>
<%=ebean.getJoindate()%>

</td>
</tr>
<tr>
<td>
고객등급
</td>
<td>
<input type="text" name="grade"  size="30"  value="<%=ebean.getGrade()%>">

</td>
</tr>
<tr>
<td>
거주지역
</td>
<td>
<input type="text" name="city"  size="30"  value="<%=ebean.getCity() %>">

</td>
</tr>
<tr align="center" >

<td colspan="2" >
<input type="hidden" name="custno" value="<%=ebean.getCustno()%>">
<input type="submit" value="수정">
<a href="memberLookUp.jsp"><button type="button">조회</button></a>
</td>








</table>
</form>

</body>
</html>