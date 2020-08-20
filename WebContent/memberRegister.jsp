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

</head>
<body>
<%
	ExamDAO edao = new ExamDAO();
	ExamBean ebean = edao.getCustno();
%>
<form method="post" action="memberRegisterPro.jsp" name="form" onsubmit="return joinmember()">
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
	

<input type="text" name="custname" id="custname" >

</td>
</tr>

<tr>
<td>
회원전화
</td>
<td>

<input type="text" name="phone" id="phone">
</td>
</tr>

<tr>
<td>
회원주소
</td>
<td><input type="text" name="address" id="address">
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
<td><input type="text" name="grade" placeholder="대문자를 입력하세요" id="grade">
</td>
</tr>

<tr>
<td>
도시코드
</td>
<td><input type="text" name="city"  id="city">
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

<script>
		function joinmember() {
			var custno = document.getElementById("custno");
			var custname = document.getElementById("custname");
			var phone = document.getElementById("phone");
			var address = document.getElementById("address");
			var joindate = document.getElementById("joindate");
			var grade = document.getElementById("grade");
			var city = document.getElementById("city");
			
			
			if (custname.value == "") {
				alert("이름을 입력해주세요");
				form.custname.focus();
				return false;
			}

			
			if (phone.value == "") {
				alert("휴대폰번호를 입력해주세요");
				form.phone.focus();
				return false;
			}

			if (address.value == "") {
				alert("주소를 입력해주세요");
				form.address.focus();
				return false;
			}
			
			if (grade.value == "") {
				alert("등급을 입력해주세요");
				form.grade.focus();
				return false;
			}
			
			if (city.value == "") {
				alert("도시코드를 입력해주세요");
				form.city.focus();
				return false;
			}

			
			alert("회원등록이 완료 되었습니다.");
		}
	</script>
</body>
</html>