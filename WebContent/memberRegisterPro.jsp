<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import = "ssssExamTest3.ExamBean" %>
   <%@ page import = "ssssExamTest3.ExamDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈쇼핑 회원등록 액션</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");

%>

<jsp:useBean id="ebean" class="ssssExamTest3.ExamBean">
	<jsp:setProperty name="ebean" property="*"/>

</jsp:useBean>

<%
ExamDAO edao= new ExamDAO();
edao.inputPeople(ebean);
%>

		<script>
		alert("회원등록이 완료되었습니다!");
		history.go(-1);
		</script>




</body>
</html>