<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 홈쇼핑 회원관리 ver1.0</title>
</head>
<style>
header{
background:blue;
}
header h1{
color:white;
}
header div{
background:lightblue;
}
header div a{
color:white;
text-decoration:none;
}
div {
text-align:center;

}


</style>
<body>

<!-- 여기중요 -->
<%
String center = request.getParameter("center");

if(center==null){
	center = "memberRegister.jsp";
	
}


%>

<!-- *****************-->
<header>
<h1 align="center">쇼핑몰 회원관리 ver 1.0</h1><br>
<div align="center"><a href="index.jsp?center=memberRegister.jsp">회원등록</a>
<a href="index.jsp?center=memberLookUp.jsp">회원목록조회/수정</a>
<a href="index.jsp?center=memberIncome.jsp">직원매출조회</a>
<a href="index.jsp">홈으로</a></div>
</header>

<div>
<jsp:include page="<%=center %>"/>


</div>



<footer>


</footer>

</body>
</html>