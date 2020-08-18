<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import = "ssssExamTest3.ExamBean" %>
   <%@ page import = "ssssExamTest3.ExamDAO" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>

		<jsp:useBean id="exambean" class="ssssExamTest3.ExamBean">
			<jsp:setProperty name="exambean" property="*"/>
		</jsp:useBean>

<%
		ExamDAO edao = new ExamDAO();
			edao.update(exambean);
%>
			<script>
		alert("회원수정이 완료되었습니다!");
		history.go(-1);
		</script>

			
		
	

</body>
</html>