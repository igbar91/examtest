<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import = "ssssExamTest3.ExamBean" %>
   <%@ page import = "ssssExamTest3.ExamDAO" %>   
   <%@ page import = "java.util.*" %> 
          <%@ page import = "java.util.Date" %>   
<%@ page import = "java.text.SimpleDateFormat " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈쇼핑 회원등록</title>
<script src="jquery-1.12.4.min.js"></script>
<script>
function send(){
	if(document.myform.custname.value==""){
		alert("회원성명이 입력되지 않았습니다.");
		document.myform.custname.focus();
		return false;
		
	}else if(document.myform.phone.value==""){
		alert("전화번호를 입력하세요");
		document.myform.phone.focus();
		return false;
		
	}else if(document.myform.address.value==""){
		alert("주소 입력하세요");
		document.myform.address.focus();
		return false;
		
	}else if(document.myform.grade.value==""){
		alert("등급을 입력하세요");
		document.myform.grade.focus();
		return false;
	
} else (document.myform.city.value==""){
	alert("도시코드를 입력하세요");
	document.myform.city.focus();
	return false;
}	
		return true;

}
</script>
</head>



<body>

<%
	ExamDAO edao = new ExamDAO();
	ExamBean ebean = edao.getCustno();
%>


<form method="post" action="memberRegisterPro.jsp" name="myform" onsubmit="return send();">
<h2>홈쇼핑 회원 등록</h2>
<table border="1" align="center">

<tr>
<td>
회원번호
</td>
<td>
<%=ebean.getCustno() %>
</td>
<tr>

<td>
회원성명
</td>
<td>
	

<input type="text" name="custname" >

</td>
</tr>

<tr>
<td>
회원전화
</td>
<td>

<input type="text" name="phone">
</td>
</tr>

<tr>
<td>
회원주소
</td>
<td><input type="text" name="address">
</td>
</tr>

<tr>
<td>
가입일자
</td>
<td>
<%
Date now = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
String today = sf.format(now);
%>
<%=today %>
</td>
</tr>


<tr>
<td>
고객등급[A:VIP, B:일반, C:직원]
</td>
<td><input type="text" name="grade" placeholder="대문자를 입력하세요">
</td>
</tr>

<tr>
<td>
도시코드
</td>
<td><input type="text" name="city" >
</td>
</tr>


<tr align="center">
<td colspan="2" >
<input type="submit" value="등록">

<a href="index.jsp?center=memberLookUp.jsp"><button type="button">조회</button></a>
</td>
</tr>






</table>


</form>
</body>
</html>